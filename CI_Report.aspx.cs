using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using System.Collections.Specialized;
using System.Text;
using System.IO;
using System.Net;

public partial class CI_Report : System.Web.UI.Page
{
    MainClass obj = new MainClass();
    string st_role;
    string name;
    string s_testid;
    string ci_name;
    string id_CI;
    
    string test_Date;
    string log_staff_id;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["id"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        if (HttpContext.Current.Request.Cookies["CPRactCookieCheck"] != null) //if cookie exists
        {


            HttpCookie ckValue = HttpContext.Current.Request.Cookies["CPRactCookieCheck"];
            string strCurSessionID = ckValue.Values["EVSS_ID"].ToString();//session.sessionID of login page           
            String strTRXID = ckValue.Values["TRXID"]; //guid value stored in session cookie Session["CPRactSessionCheck"]

            if (HttpContext.Current.Session["CPRactSessionCheck"].ToString().Trim() != strTRXID.Trim() &&
                 HttpContext.Current.Session.SessionID.ToString() == strCurSessionID.Trim())
            {
                HttpContext.Current.Session.Abandon();
                HttpContext.Current.Session.Clear();
                FormsAuthentication.SignOut();
                HttpContext.Current.Response.Redirect("Login.aspx");
            }

        }
        else //if cookie doesnt exist
        {
            HttpContext.Current.Session.Abandon();
            HttpContext.Current.Session.Clear();
            HttpContext.Current.Response.Redirect("Login.aspx");

        }
        name = (string)Session["staffname"]; //name of logged person
        lb_welcome.Text = "Welcome " + name + "!";
        log_staff_id = (string)Session["staffid"];
        st_role = (string)Session["staffrole"];
        if (st_role == "Instructor")
        {

            img_completesession.Visible = false;
        }


        else
        {
            int ID = (int)Session["id"];
            if (ID < 12)
                Response.Redirect("Login.aspx");
        }

        img_completesession.ImageUrl = "images/BtnSessionComplete.png";
        bt_Save.ImageUrl = "images/BtnSave.png";
        Button4.ImageUrl = "images/BackToStudentListBtn.png";


        // Code disables caching by browser.
        Response.Cache.SetCacheability(HttpCacheability.NoCache);// this tells the client not to cache responses in the History folder, so that when you use the back/forward buttons the client requests a new version of the response each time.
        Response.Cache.SetExpires(DateTime.UtcNow.AddHours(-1));
        Response.Cache.SetNoStore();
       
        s_testid = (string)Session["S_id"];
        string v_test_id = (string)Session["S_id"];
        v_chief_name.Text = ((string)Session["view_chiefinstructor"]).ToUpper();
        test_Date = (string)Session["view_date"];
        v_date.Text = (string)Session["view_date"];
        v_testid.Text = (string)Session["view_testid"];
        if (Session["S_id"] == null)
        {
            Response.Redirect("Login.aspx");
        }



        if (!this.IsPostBack)
        {
            SqlConnection con9 = obj.getcon();
            con9.Open();

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con9;
            cmd.CommandText = "select e.student_id,UPPER(e.student_name) as student_name,e.student_nric,e.student_group,f.test_vs_student_status,g.testsession_id,g.test_date,f.reason_for_follow_up,f.logistics,f.instruction_for_students,f.comments_by_CI,f.responsible_CI from student_details e, student_vs_testsession_details f,testsession_details g where e.student_id=f.student_id and f.testsession_id=g.testsession_id  and (e.date_of_pass  is null ) and g.testsession_id=@test_id order by e.student_group,e.student_name";
            SqlParameter param1 = new SqlParameter("@test_id", s_testid);
            cmd.Parameters.Add(param1);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            adapter.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();

            con9.Close();
        }
    }

    protected void bt_Save_Click(object sender, ImageClickEventArgs e)
    {
        save_button();
     //   Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Script", "alert('Records Successfuly Saved.!Please click on 'Session Complete' to submit the final report. ');", true);
        string script = "<script type=\"text/javascript\">alert('Submission UN-SUCCESSFUL. Remarks (minimum 10 characters) compulsory when submitting referred students');</script>";
       // ClientScript.RegisterClientScriptBlock(this.GetType(), "Alert", script);
        ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Records Successfuly Saved.!Please click on Session Complete to submit the final report. ');", true);
                                  
    }
    protected void img_completesession_Click(object sender, ImageClickEventArgs e)
    {

        string confirmValue = Request.Form["confirm_value"];
        if (confirmValue == "Yes")
        {

            save_button();
            string t_id = (string)Session["view_testid"];


            string test_status = "Completed";
            SqlConnection con = obj.getcon();
            con.Open();
            SqlCommand cmd = new SqlCommand("update testsession_details set testsession_status=@status where testsession_id=@t_id ", con);
            cmd.Parameters.Add(new SqlParameter("status", test_status));
            cmd.Parameters.Add(new SqlParameter("t_id", t_id));

            cmd.ExecuteNonQuery();

            SqlCommand cmd3 = new SqlCommand("insert into  practicaltest_summary(instructor_id,date,testsession_id)values('" + log_staff_id + "','" + test_Date + "','" + t_id + "')", con);
            cmd3.ExecuteNonQuery();
            con.Close();


            check_theoryscore_status(t_id); //update logged-in status of theory test with current score status
         
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('This test is finished')", true);
        }
    }



    protected void save_button()
    {
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            string student_ID = GridView1.Rows[i].Cells[3].Text;
            TextBox box1 = (TextBox)GridView1.Rows[i].Cells[9].FindControl("TextBox1");
            TextBox box2 = (TextBox)GridView1.Rows[i].Cells[10].FindControl("TextBox2");
            TextBox box3 = (TextBox)GridView1.Rows[i].Cells[11].FindControl("TextBox3");
            TextBox box4 = (TextBox)GridView1.Rows[i].Cells[12].FindControl("TextBox4");
            DropDownList ddl_chief = (DropDownList)GridView1.Rows[i].Cells[13].FindControl("ddl1");
            string tb1 = box1.Text;
            string tb2 = box2.Text;
            string tb3 = box3.Text;
            string tb4 = box4.Text;


            string ddl_text = ddl_chief.SelectedItem.Value;


            SqlConnection conn = obj.getcon();
            conn.Open();

            SqlCommand cmd = new SqlCommand("update student_vs_testsession_details set reason_for_follow_up=@tb1,logistics=@tb2,instruction_for_students=@tb3,comments_by_CI=@tb4,respoNsible_CI=@ddlCI where student_id=@st_id and testsession_id=@t_id ", conn);
            cmd.Parameters.Add(new SqlParameter("tb1", tb1));
            cmd.Parameters.Add(new SqlParameter("tb2", tb2));
            cmd.Parameters.Add(new SqlParameter("tb3", tb3));
            cmd.Parameters.Add(new SqlParameter("tb4", tb4));
            cmd.Parameters.Add(new SqlParameter("ddlCI", ddl_text));
            cmd.Parameters.Add(new SqlParameter("st_id", student_ID));
            cmd.Parameters.Add(new SqlParameter("t_id", s_testid));

            cmd.ExecuteNonQuery();
            conn.Close();
          
        }
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            SqlConnection con = obj.getcon();
            con.Open();
            Label lnk = e.Row.FindControl("label_practical_status") as Label;



            string Namecolumnvalue1 = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "student_id"));
            string Namecolumnvalue2 = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "testsession_id"));

            string[] link = new string[] { "- ", "- ", "- ", "- ", "- " };

            SqlCommand cmd = new SqlCommand("select practical from student_vs_testsession_details where student_id='" + Namecolumnvalue1 + "'and testsession_id='" + Namecolumnvalue2 + "' ", con);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                if (dr[0].ToString() == "1")//practical==1 if that student is assigned for practical test.other wise it will be zero.
                {
                    SqlCommand cmd106 = new SqlCommand("select practical_status,module_num,attempt from practicaltest_summary where student_id='" + Namecolumnvalue1 + "' and testsession_id='" + Namecolumnvalue2 + "' ", con);
                    SqlDataReader dr106 = cmd106.ExecuteReader();
                    if (dr106.HasRows)
                    {
                        SqlCommand cmd66 = new SqlCommand("select min(attempt) from practicaltest_summary where student_id ='" + Namecolumnvalue1 + "' and testsession_id='" + Namecolumnvalue2 + "' and module_num='module1' ", con);
                        SqlDataReader dr66 = cmd66.ExecuteReader();
                        while (dr66.Read())
                        {
                            if (dr66[0].ToString() != "0")
                            {
                                SqlCommand cmd69 = new SqlCommand("Select practical_status from  practicaltest_summary where student_id ='" + Namecolumnvalue1 + "' and  testsession_id='" + Namecolumnvalue2 + "'  and module_num='module1' and attempt= (select max(attempt) from practicaltest_summary where student_id ='" + Namecolumnvalue1 + "' and testsession_id='" + Namecolumnvalue2 + "' and module_num='module1') ", con);
                                SqlDataReader dr69 = cmd69.ExecuteReader();
                                if (dr69.HasRows)
                                {
                                    while (dr69.Read())
                                    {

                                        if (dr69[0].ToString() == "Passed")
                                        {
                                            link[0] = "P ";

                                        }
                                        else if (dr69[0].ToString() == "Referred")
                                        {
                                            link[0] = "R ";

                                        }

                                        else if (dr69[0].ToString() == "Failed")
                                        {
                                            link[0] = "F ";
                                        }
                                        else
                                        {
                                            link[0] = "- ";
                                        }
                                    }
                                }


                            }
                            else
                            {
                                link[0] = "S ";

                            }
                        }
                        SqlCommand cmd86 = new SqlCommand("select min(attempt) from practicaltest_summary where student_id ='" + Namecolumnvalue1 + "' and testsession_id='" + Namecolumnvalue2 + "' and module_num='module2' ", con);
                        SqlDataReader dr86 = cmd86.ExecuteReader();
                        while (dr86.Read())
                        {
                            if (dr86[0].ToString() != "0")
                            {
                                SqlCommand cmd85 = new SqlCommand("Select practical_status from  practicaltest_summary where student_id ='" + Namecolumnvalue1 + "' and  testsession_id='" + Namecolumnvalue2 + "'  and module_num='module2' and attempt= (select max(attempt) from practicaltest_summary where student_id ='" + Namecolumnvalue1 + "' and testsession_id='" + Namecolumnvalue2 + "' and module_num='module2') ", con);
                                SqlDataReader dr85 = cmd85.ExecuteReader();
                                if (dr85.HasRows)
                                {
                                    while (dr85.Read())
                                    {

                                        if (dr85[0].ToString() == "Passed")
                                        {
                                            link[1] = "P ";

                                        }
                                        else if (dr85[0].ToString() == "Referred")
                                        {
                                            link[1] = "R ";

                                        }

                                        else if (dr85[0].ToString() == "Failed")
                                        {
                                            link[1] = "F ";
                                        }
                                        else
                                        {
                                            link[1] = "- ";
                                        }
                                    }
                                }


                            }
                            else
                            {
                                link[1] = "S ";

                            }
                        }

                        SqlCommand cmd22 = new SqlCommand("select min(attempt) from practicaltest_summary where student_id ='" + Namecolumnvalue1 + "' and testsession_id='" + Namecolumnvalue2 + "' and module_num='module3' ", con);
                        SqlDataReader dr22 = cmd22.ExecuteReader();
                        while (dr22.Read())
                        {
                            if (dr22[0].ToString() != "0")
                            {
                                SqlCommand cmd12 = new SqlCommand("Select practical_status from  practicaltest_summary where student_id ='" + Namecolumnvalue1 + "' and  testsession_id='" + Namecolumnvalue2 + "'  and module_num='module3' and attempt= (select max(attempt) from practicaltest_summary where student_id ='" + Namecolumnvalue1 + "' and testsession_id='" + Namecolumnvalue2 + "' and module_num='module3') ", con);
                                SqlDataReader dr12 = cmd12.ExecuteReader();
                                if (dr12.HasRows)
                                {
                                    while (dr12.Read())
                                    {

                                        if (dr12[0].ToString() == "Passed")
                                        {
                                            link[2] = "P ";

                                        }
                                        else if (dr12[0].ToString() == "Referred")
                                        {
                                            link[2] = "R ";

                                        }

                                        else if (dr12[0].ToString() == "Failed")
                                        {
                                            link[2] = "F ";
                                        }
                                        else
                                        {
                                            link[2] = "- ";
                                        }
                                    }
                                }


                            }
                            else
                            {
                                link[2] = "S ";

                            }
                        }


                        SqlCommand cmd9 = new SqlCommand("select min(attempt) from practicaltest_summary where student_id ='" + Namecolumnvalue1 + "' and testsession_id='" + Namecolumnvalue2 + "' and module_num='module4' ", con);
                        SqlDataReader dr9 = cmd9.ExecuteReader();
                        while (dr9.Read())
                        {
                            if (dr9[0].ToString() != "0")
                            {
                                SqlCommand cmd21 = new SqlCommand("Select practical_status from  practicaltest_summary where student_id ='" + Namecolumnvalue1 + "' and  testsession_id='" + Namecolumnvalue2 + "'  and module_num='module4' and attempt= (select max(attempt) from practicaltest_summary where student_id ='" + Namecolumnvalue1 + "' and testsession_id='" + Namecolumnvalue2 + "' and module_num='module4') ", con);
                                SqlDataReader dr21 = cmd21.ExecuteReader();
                                if (dr21.HasRows)
                                {
                                    while (dr21.Read())
                                    {

                                        if (dr21[0].ToString() == "Passed")
                                        {
                                            link[3] = "P ";

                                        }
                                        else if (dr21[0].ToString() == "Referred")
                                        {
                                            link[3] = "R ";

                                        }

                                        else if (dr21[0].ToString() == "Failed")
                                        {
                                            link[3] = "F ";
                                        }
                                        else
                                        {
                                            link[3] = "- ";
                                        }
                                    }
                                }


                            }
                            else
                            {
                                link[3] = "S ";

                            }
                        }
                        SqlCommand cmd52 = new SqlCommand("select min(attempt) from practicaltest_summary where student_id ='" + Namecolumnvalue1 + "' and testsession_id='" + Namecolumnvalue2 + "' and module_num='module5' ", con);
                        SqlDataReader dr52 = cmd52.ExecuteReader();
                        while (dr52.Read())
                        {
                            if (dr52[0].ToString() != "0")
                            {
                                SqlCommand cmd12 = new SqlCommand("Select practical_status from  practicaltest_summary where student_id ='" + Namecolumnvalue1 + "' and  testsession_id='" + Namecolumnvalue2 + "'  and module_num='module5' and attempt= (select max(attempt) from practicaltest_summary where student_id ='" + Namecolumnvalue1 + "' and testsession_id='" + Namecolumnvalue2 + "' and module_num='module5') ", con);
                                SqlDataReader dr12 = cmd12.ExecuteReader();
                                if (dr12.HasRows)
                                {
                                    while (dr12.Read())
                                    {

                                        if (dr12[0].ToString() == "Passed")
                                        {
                                            link[4] = "P ";

                                        }
                                        else if (dr12[0].ToString() == "Referred")
                                        {
                                            link[4] = "R ";

                                        }

                                        else if (dr12[0].ToString() == "Failed")
                                        {
                                            link[4] = "F ";
                                        }
                                        else
                                        {
                                            link[4] = "- ";
                                        }
                                    }
                                }


                            }
                            else
                            {
                                link[4] = "S ";

                            }
                        }

                        string link_values = link[0] + link[1] + link[2] + link[3] + link[4];
                        lnk.Text = link_values;
                    }
                    else
                    {
                        lnk.Text = "Not Started";
                        lnk.Visible = true;
                    }
                }
                else
                {
                    lnk.Visible = false;
                }


            }
            con.Close();

            DropDownList ddl_CI = e.Row.FindControl("ddl1") as DropDownList;
            SqlConnection con2 = obj.getcon();
            con2.Open();

            SqlCommand cmd_chief_from_VS_table = new SqlCommand("Select a.responsible_CI ,b.staff_name FROM student_vs_testsession_details a, staff_details b where a.student_id ='" + Namecolumnvalue1 + "' and a.testsession_id='" + Namecolumnvalue2 + "' and a.responsible_CI=b.staff_id ", con2);
            SqlDataReader dr_chief_from_VS_table = cmd_chief_from_VS_table.ExecuteReader();
            if (dr_chief_from_VS_table.HasRows)
            {
                while (dr_chief_from_VS_table.Read())
                {

                    id_CI = dr_chief_from_VS_table[0].ToString();
                    ci_name = dr_chief_from_VS_table[1].ToString();
                   // string staff_Role = "Chief Instructor";
                    // SqlCommand cmd_dl = new SqlCommand("Select staff_name,staff_id FROM staff_details where staff_role='" + staff_Role + "' ", con2);
                  
                    SqlCommand cmd_dl = new SqlCommand("Select UPPER(staff_name) as staff_name,staff_id FROM staff_details where staff_role='Chief Instructor' or staff_role='Director/Asst Director'", con2);
                    SqlDataAdapter da_dl = new SqlDataAdapter(cmd_dl);
                    DataSet ds = new DataSet();
                    da_dl.Fill(ds);
                    ddl_CI.DataSource = ds;
                    ddl_CI.DataTextField = "staff_name".ToUpper();
                    ddl_CI.DataValueField = "staff_id";
                    ddl_CI.DataBind();
                    if (ci_name != null)
                    {
                        ddl_CI.SelectedItem.Text = ci_name;
                        ddl_CI.SelectedValue = id_CI;
                    }

                    if (st_role == "Chief Instructor")
                    {
                        ddl_CI.SelectedItem.Text = ci_name;
                        ddl_CI.SelectedValue = id_CI;
                        ddl_CI.Enabled = false;

                    }
                }

            }
            else //initially no responsible staff
            {
               // string staff_Role = "ChiefInstructor";
                //SqlCommand cmd_dl = new SqlCommand("Select staff_name,staff_id FROM staff_details where staff_role='" + staff_Role + "' ", con2);

                SqlCommand cmd_dl = new SqlCommand("Select UPPER(staff_name) as staff_name ,staff_id FROM staff_details where staff_role='Chief Instructor' or staff_role='Director/Asst Director'", con2);
                SqlDataAdapter da_dl = new SqlDataAdapter(cmd_dl);
                DataSet ds = new DataSet();
                da_dl.Fill(ds);
                ddl_CI.DataSource = ds;
                ddl_CI.DataTextField = "staff_name".ToUpper();              
                ddl_CI.DataValueField = "staff_id";
                ddl_CI.DataBind();
                if (st_role == "Chief Instructor")
                {

                    ddl_CI.Enabled = false;

                }
            }
            con2.Close();

        }

    }

    protected void Button4_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("view_test.aspx");

    }

    public void check_theoryscore_status(string t_id)
    {

        SqlConnection con_checkscore = obj.getcon();
        con_checkscore.Open();
        SqlCommand cmd_checkscore = new SqlCommand("select student_id from student_vs_testsession_details where  testsession_id='" + t_id + "' and test_vs_student_status='Logged_In'", con_checkscore);
        SqlDataReader dr_checkscore = cmd_checkscore.ExecuteReader();
        if (dr_checkscore.HasRows)
        {
            while (dr_checkscore.Read())
            {
                string student_id_for_checkscore = dr_checkscore[0].ToString();
                SqlCommand cmd_takescore = new SqlCommand("select score from student_vs_testsession_details where  testsession_id='" + t_id + "' and student_id='" + student_id_for_checkscore + "' and test_vs_student_status='Logged_In'", con_checkscore);
                SqlDataReader dr_takescore = cmd_takescore.ExecuteReader();
                if (dr_takescore.HasRows)
                {
                    while (dr_takescore.Read())
                    {
                        string score_detail = dr_takescore[0].ToString();
                        int comma = score_detail.IndexOf(',');
                        string last_score = score_detail;
                        if (string.IsNullOrEmpty(last_score) == false)
                        {
                            if (comma != -1)
                            {
                                string[] tokens = score_detail.Split(',');
                                last_score = tokens[tokens.Length - 1];

                            }

                            if (Convert.ToInt32(last_score) >= 24)
                            {

                                SqlCommand cmd111 = new SqlCommand("update student_vs_testsession_details  set test_vs_student_status='Passed' where student_id='" + student_id_for_checkscore + "' and testsession_id='" + t_id + "' and test_vs_student_status='Logged_In'", con_checkscore);
                                cmd111.ExecuteNonQuery();
                            }
                            else if (Convert.ToInt32(last_score) < 24)
                            {
                                SqlCommand cmd222 = new SqlCommand("update student_vs_testsession_details  set test_vs_student_status='Failed' where student_id='" + student_id_for_checkscore + "' and testsession_id='" + t_id + "' and test_vs_student_status='Logged_In'", con_checkscore);
                                cmd222.ExecuteNonQuery();

                            }
                        }
                        else
                        {
                            SqlCommand cmd222 = new SqlCommand("update student_vs_testsession_details  set test_vs_student_status='Not logged-in' where student_id='" + student_id_for_checkscore + "' and testsession_id='" + t_id + "' and test_vs_student_status='Logged_In'", con_checkscore);
                            cmd222.ExecuteNonQuery();
                        }
                    }
                }
                else
                {
                    SqlCommand cmd222 = new SqlCommand("update student_vs_testsession_details  set test_vs_student_status='Not logged-in' where student_id='" + student_id_for_checkscore + "' and testsession_id='" + t_id + "' and test_vs_student_status='Logged_In'", con_checkscore);
                    cmd222.ExecuteNonQuery();
                }
            }
        }
        con_checkscore.Close();

    }
}
