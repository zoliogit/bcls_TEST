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
using System.IO;
using System.Net;

public partial class view_test : System.Web.UI.Page
{
    string t_id;
    string student_id;
    string testssession_status;
    string login_staff_role;
    string name; //staff
    MainClass obj = new MainClass();
    string st_role;
    protected void Page_Load(object sender, EventArgs e)
    {


        name = (string)Session["staffname"];
        Session["staff_name_for_edit_score"] = name; ;
        st_role = (string)Session["staffrole"];


        img_starttest.ImageUrl = "images/BtnStartTheroyTest.png";
        img_finishtest.ImageUrl = "images/BtnFinishTheroyTest.png";
        img_edittest.ImageUrl = "images/BtnEditSessionDetails.png";
        img_completesession.ImageUrl = "images/BtnReports.png";

        if (Session["id"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        else

        {
            int ID = (int)Session["id"];
            if (ID < 02) //Guests
                theDivForBottomButtons.Visible = false;//BUTTONS FOR Edit Theory Test,Activation code,

        }

        // Code disables caching by browser.
        Response.Cache.SetCacheability(HttpCacheability.NoCache);// this tells the client not to cache responses in the History folder, so that when you use the back/forward buttons the client requests a new version of the response each time.
        Response.Cache.SetExpires(DateTime.UtcNow.AddHours(-1));
        Response.Cache.SetNoStore();
       
        
        Response.AppendHeader("Refresh", "60"); //Automatic web page refresh

        string logintime = (string)Session["lasttime"];
        testssession_status = (string)Session["testsession_status"];
        v_testid.Text = (string)Session["view_testid"];
        string view_id = v_testid.Text;
       
        SqlConnection con88 = obj.getcon();
        con88.Open();
        SqlCommand cmd = new SqlCommand("Select start_time,	test_date,duration,no_questions,testsession_id,chiefinstructor_name from testsession_details where testsession_id =@View_ID", con88);
        cmd.Parameters.Add(new SqlParameter("View_ID", view_id));
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            Session["view_time"] = dr[0].ToString();
            Session["view_date"] = dr[1].ToString();
            Session["view_duration"] = dr[2].ToString();
            Session["view_questions"] = dr[3].ToString();
            Session["view_testid"] = dr[4].ToString();
            Session["view_chiefinstructor"] = dr[5].ToString();

        }
        con88.Close();
        // string v_test_id = (string)Session["S_id"];
        v_date.Text = (string)Session["view_date"];
        v_chief_name.Text = ((string)Session["view_chiefinstructor"]).ToUpper();
   
        if (Session["view_testid"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        
        SqlConnection con = obj.getcon();
       con.Open();
       SqlDataAdapter adapter = new SqlDataAdapter("select e.student_id,UPPER(e.student_name) as student_name ,e.student_group,f.test_vs_student_status,f.score,f.practical_status,CAST(CASE e.IsNPStudent WHEN '0' THEN 1 ELSE 0 END AS BIT) AS IsNPStudent  from student_details e join student_vs_testsession_details f on e.student_id=f.student_id where f.testsession_id='" + view_id + "' order by e.student_group,e.student_name  ", con);
        //CAST(CASE e.IsNPStudent WHEN '0' THEN 1 ELSE 0 END AS BIT) AS IsNPStudent >>> means db stores 0 if extstudnet//else store 1

        DataSet ds = new DataSet();
       adapter.Fill(ds);
       GridView1.DataSource = ds;
       GridView1.DataBind();
       con.Close();
    }
  
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Active_testsessiondetails.aspx");
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("Login.aspx");
    }
    protected void img_starttest_Click(object sender, ImageClickEventArgs e)
    {
      
        string s_testid = (string)Session["S_id"];
        string status = "Ongoing";
        
        SqlConnection con1 = obj.getcon();
        con1.Open();
        SqlCommand cmd = new SqlCommand("update testsession_details set testsession_status='" + status + "' where testsession_id='" + s_testid + "' ", con1);
        cmd.ExecuteNonQuery(); 
        con1.Close();
      
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "New", "window.open('start_test.aspx');", true);
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "select") //start practical test
        {
            string st_id = Convert.ToString(e.CommandArgument.ToString());
            Session["p_studentid"] = st_id;
            string s_testid = (string)Session["view_testid"];

            SqlConnection con = obj.getcon();
            con.Open();
            SqlCommand cmd = new SqlCommand("Select student_id,student_nric,student_name,student_group  from student_details where student_id ='" + st_id + "' ", con);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {   Session["p_student_group"]=dr[3].ToString();
                Session["p_studentnric"] = dr[1].ToString();
                Session["p_studentname"] = dr[2].ToString();
                Session["p_studentid"] = dr[0].ToString();
            }
          
            Response.Redirect("Practical_test.aspx");
            con.Close();
        }

      if (e.CommandName == "selectresult")//show result
        {
           t_id=  (string)Session["view_testid"];
           student_id = Convert.ToString(e.CommandArgument.ToString());
           Session["student_id"]=student_id;
           string FileName = t_id + student_id + ".txt";
           Session["f_name"] = FileName;
          
           ScriptManager.RegisterStartupScript(Page, typeof(Page), "New", "window.open('theorytest_results.aspx');", true);
           
        }


      if (e.CommandName == "selectstatus")//to edit theory score
      {
          student_id = Convert.ToString(e.CommandArgument.ToString());
          Session["student_id"] = student_id;
          SqlConnection con = obj.getcon();
          con.Open();
          SqlCommand cmd = new SqlCommand("Select * from student_details where student_id ='" + student_id + "' ", con);
          SqlDataReader dr = cmd.ExecuteReader();
          while (dr.Read())
          {
             Session["editscore_studentname"] = dr[2].ToString();
            
          }

          con.Close();
       Response.Redirect("EditTheoryScore.aspx");
      //    ScriptManager.RegisterStartupScript(Page, typeof(Page), "New", "window.open('EditTheoryScore.aspx');", true);
           
        }
        if (e.CommandName == "select_pass")
        {
            string ExtStudent_id = Convert.ToString(e.CommandArgument.ToString());

            Random rnd = new Random();
            int pass = rnd.Next(100000, 999999); // creates a 6 digit random no.


            SqlConnection con_pass = obj.getcon();
            con_pass.Open();
            SqlCommand cmd = new SqlCommand("update student_details set ExtStudentPassword=@ExtStudentPassword where student_id=@ExtStudent_id ", con_pass);
            cmd.Parameters.Add(new SqlParameter("ExtStudentPassword", pass));
            cmd.Parameters.Add(new SqlParameter("ExtStudent_id", ExtStudent_id));
            int val = cmd.ExecuteNonQuery();
            con_pass.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('Password of " + ExtStudent_id + " : " + pass + "')", true);

        }
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        foreach (TableCell tc in e.Row.Cells)
        {

            tc.Attributes["style"] = "border-color: #98272d";

        }
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[2].HorizontalAlign = HorizontalAlign.Left;
            e.Row.Cells[7].HorizontalAlign = HorizontalAlign.Center;

            LinkButton lnk2 = (LinkButton)e.Row.FindControl("LinkButton2"); //result link
            LinkButton lnk_status = (LinkButton)e.Row.FindControl("lb_status"); //status link for edit score
            LinkButton lnk = (LinkButton)e.Row.FindControl("LinkButton1");//practical status link
            lnk.CommandArgument = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "student_id"));
            lnk2.CommandArgument = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "student_id"));
            lnk_status.CommandArgument = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "student_id"));
          

            string Namecolumnvalue1 = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "student_id"));
            string test_id = (string)Session["view_testid"];

            LinkButton pwd = (LinkButton)e.Row.FindControl("lnkpass"); //pswd button
            Boolean aa = Convert.ToBoolean(DataBinder.Eval(e.Row.DataItem, "IsNPStudent"));
            int studenttype2 = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "IsNPStudent"));
            string studenttype = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "IsNPStudent"));
            if (studenttype == "True" && st_role == "Director/Asst Director")//external student
            {
                pwd.Visible = true;
            }
            else
            {
                pwd.Visible = false;

            }


            string[] link = new string[] { "- ", "- ", "- ", "- ", "- " };




           SqlConnection con = obj.getcon();
            con.Open();
            SqlCommand cmd_invigilator_noresult = new SqlCommand("select staff_role from staff_details where staff_name='" + name + "'", con);
            SqlDataReader dr_invigilator_noresult = cmd_invigilator_noresult.ExecuteReader();
            while (dr_invigilator_noresult.Read())
            {
                login_staff_role = dr_invigilator_noresult[0].ToString();

            }
          


                SqlCommand cmd_theory = new SqlCommand("select theory from student_vs_testsession_details where student_id='" + Namecolumnvalue1 + "'and testsession_id='" + test_id + "' ", con);
                SqlDataReader dr_theory = cmd_theory.ExecuteReader();
            while (dr_theory.Read())
            {
                if (dr_theory[0].ToString() == "1")//theory==1 if that student is assigned for theory test.other wise it will be zero.
                {

                    string Namecolumnvalue_score = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "score"));
                    string Namecolumnvalue = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "test_vs_student_status"));
                    if (Namecolumnvalue == "Passed") //passed 
                    {
                        lnk_status.Enabled = false;//no need to edit the score which is already passed
                    }

                    if ((login_staff_role != "Director/Asst Director") || (testssession_status == "Completed"))
                    {
                        lnk_status.Enabled = false; //only Director/Asst Director can  edit the theory score  
                    }
                    int count = Namecolumnvalue_score.Split(',').Length - 1;
                    //checking number of comma in score column
                    if (count >= 2)
                    {
                        lnk_status.Enabled = false;//no need to edit the score which was conducted 3 times
                    }

                    if(login_staff_role == "Guest")
                    {
                        lnk.Enabled = false;//Guest has no provision to start practical test
                    }
                    if ((Namecolumnvalue_score != "") && (login_staff_role != "Instructor") && (login_staff_role != "Guest"))
                    {
                        lnk2.Visible = true; //result link
                    }
                    else
                    {
                        lnk2.Visible = false;//result link
                    }
                    string status_text = lnk_status.Text;

                    if (status_text == "Not logged-in")
                    {
                        e.Row.Cells[4].BackColor = System.Drawing.Color.Gray;
                    }
                    else if (status_text == "Logged_In")
                    {
                        e.Row.Cells[4].BackColor = System.Drawing.Color.Orange;
                    }
                    else if (status_text == "In Progress")
                    {
                        e.Row.Cells[4].BackColor = System.Drawing.Color.LightSkyBlue;
                    }
                    else if (status_text == "Passed")
                    {
                        e.Row.Cells[4].BackColor = System.Drawing.Color.Green;
                    }
                    else if (status_text == "Failed")
                    {
                        e.Row.Cells[4].BackColor = System.Drawing.Color.Red;
                    }



                }
                else
                {
                    lnk2.Visible = false; //result link
                    lnk_status.Visible = false;//status link
                }
            }








          

            SqlCommand cmd = new SqlCommand("select practical from student_vs_testsession_details where student_id='" + Namecolumnvalue1 + "'and testsession_id='" + test_id + "' ", con);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                if (dr[0].ToString() == "1")//practical==1 if that student is assigned for practical test.other wise it will be zero.
                {

                    SqlCommand cmd106 = new SqlCommand("select practical_status,module_num,attempt from practicaltest_summary where student_id='" + Namecolumnvalue1 + "' and testsession_id='" + test_id + "' ", con);
                    SqlDataReader dr106 = cmd106.ExecuteReader();
                    if (dr106.HasRows)
                    {
                        //  --------  MODULE 1  ------------

                        SqlCommand cmdat1 = new SqlCommand("Select max(attempt) from  practicaltest_summary where student_id ='" + Namecolumnvalue1 + "' and testsession_id='" + test_id + "'  and module_num='module1'", con);
                        SqlDataReader drat1 = cmdat1.ExecuteReader(); //there is a chance for inserting saved row after submitting the last attempt (attempt 3) . So first need to check if we submitted the last atempt..then need to display the submitted status .thats why checking max(attempt)
                        if (drat1.HasRows)
                        {
                            while (drat1.Read())
                            {
                                if (drat1[0].ToString() == "3")
                                {
                                    SqlCommand cmd69 = new SqlCommand("Select practical_status from  practicaltest_summary where student_id ='" + Namecolumnvalue1 + "' and  testsession_id='" + test_id + "'  and module_num='module1' and attempt= (select max(attempt) from practicaltest_summary where student_id ='" + Namecolumnvalue1 + "' and testsession_id='" + test_id + "' and module_num='module1') ", con);
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

                                    SqlCommand cmd66 = new SqlCommand("select min(attempt) from practicaltest_summary where student_id ='" + Namecolumnvalue1 + "' and testsession_id='" + test_id + "' and module_num='module1' ", con);
                                    SqlDataReader dr66 = cmd66.ExecuteReader();
                                    while (dr66.Read())
                                    {
                                        if (dr66[0].ToString() != "0")
                                        {
                                            SqlCommand cmd69 = new SqlCommand("Select practical_status from  practicaltest_summary where student_id ='" + Namecolumnvalue1 + "' and  testsession_id='" + test_id + "'  and module_num='module1' and attempt= (select max(attempt) from practicaltest_summary where student_id ='" + Namecolumnvalue1 + "' and testsession_id='" + test_id + "' and module_num='module1') ", con);
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




                                }
                            }
                        }


                       //  --------  MODULE 2  ------------

                        SqlCommand cmdat2 = new SqlCommand("Select max(attempt) from  practicaltest_summary where student_id ='" + Namecolumnvalue1 + "' and testsession_id='" + test_id + "'  and module_num='module2'", con);
                        SqlDataReader drat2 = cmdat2.ExecuteReader();
                        if (drat2.HasRows)
                        {
                            while (drat2.Read())
                            {
                                if (drat2[0].ToString() == "3")
                                {
                                    SqlCommand cmd85 = new SqlCommand("Select practical_status from  practicaltest_summary where student_id ='" + Namecolumnvalue1 + "' and  testsession_id='" + test_id + "'  and module_num='module2' and attempt= (select max(attempt) from practicaltest_summary where student_id ='" + Namecolumnvalue1 + "' and testsession_id='" + test_id + "' and module_num='module2') ", con);
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

                                    SqlCommand cmd86 = new SqlCommand("select min(attempt) from practicaltest_summary where student_id ='" + Namecolumnvalue1 + "' and testsession_id='" + test_id + "' and module_num='module2' ", con);
                                    SqlDataReader dr86 = cmd86.ExecuteReader();
                                    while (dr86.Read())
                                    {
                                        if (dr86[0].ToString() != "0")
                                        {
                                            SqlCommand cmd85 = new SqlCommand("Select practical_status from  practicaltest_summary where student_id ='" + Namecolumnvalue1 + "' and  testsession_id='" + test_id + "'  and module_num='module2' and attempt= (select max(attempt) from practicaltest_summary where student_id ='" + Namecolumnvalue1 + "' and testsession_id='" + test_id + "' and module_num='module2') ", con);
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



                                }
                            }
                        }


                       //  --------  MODULE 3  ------------

                        SqlCommand cmdat3 = new SqlCommand("Select max(attempt) from  practicaltest_summary where student_id ='" + Namecolumnvalue1 + "' and testsession_id='" + test_id + "'  and module_num='module3'", con);
                        SqlDataReader drat3 = cmdat3.ExecuteReader();
                        if (drat3.HasRows)
                        {
                            while (drat3.Read())
                            {
                                if (drat3[0].ToString() == "3")
                                {
                                    SqlCommand cmd12 = new SqlCommand("Select practical_status from  practicaltest_summary where student_id ='" + Namecolumnvalue1 + "' and  testsession_id='" + test_id + "'  and module_num='module3' and attempt= (select max(attempt) from practicaltest_summary where student_id ='" + Namecolumnvalue1 + "' and testsession_id='" + test_id + "' and module_num='module3') ", con);
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
                                    SqlCommand cmd22 = new SqlCommand("select min(attempt) from practicaltest_summary where student_id ='" + Namecolumnvalue1 + "' and testsession_id='" + test_id + "' and module_num='module3' ", con);
                                    SqlDataReader dr22 = cmd22.ExecuteReader();
                                    while (dr22.Read())
                                    {
                                        if (dr22[0].ToString() != "0")
                                        {
                                            SqlCommand cmd12 = new SqlCommand("Select practical_status from  practicaltest_summary where student_id ='" + Namecolumnvalue1 + "' and  testsession_id='" + test_id + "'  and module_num='module3' and attempt= (select max(attempt) from practicaltest_summary where student_id ='" + Namecolumnvalue1 + "' and testsession_id='" + test_id + "' and module_num='module3') ", con);
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

                                }
                            }
                        }


                        //  --------  MODULE 4  ------------


                              
                         SqlCommand cmdat4 = new SqlCommand("Select max(attempt) from  practicaltest_summary where student_id ='" + Namecolumnvalue1 + "' and testsession_id='" + test_id + "'  and module_num='module4'", con);
                        SqlDataReader drat4 = cmdat4.ExecuteReader();
                        if (drat4.HasRows)
                        {
                            while (drat4.Read())
                            {
                                if (drat4[0].ToString() == "3")
                                {

                                    SqlCommand cmd21 = new SqlCommand("Select practical_status from  practicaltest_summary where student_id ='" + Namecolumnvalue1 + "' and  testsession_id='" + test_id + "'  and module_num='module4' and attempt= (select max(attempt) from practicaltest_summary where student_id ='" + Namecolumnvalue1 + "' and testsession_id='" + test_id + "' and module_num='module4') ", con);
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

                                    SqlCommand cmd9 = new SqlCommand("select min(attempt) from practicaltest_summary where student_id ='" + Namecolumnvalue1 + "' and testsession_id='" + test_id + "' and module_num='module4' ", con);
                                    SqlDataReader dr9 = cmd9.ExecuteReader();
                                    while (dr9.Read())
                                    {
                                        if (dr9[0].ToString() != "0")
                                        {
                                            SqlCommand cmd21 = new SqlCommand("Select practical_status from  practicaltest_summary where student_id ='" + Namecolumnvalue1 + "' and  testsession_id='" + test_id + "'  and module_num='module4' and attempt= (select max(attempt) from practicaltest_summary where student_id ='" + Namecolumnvalue1 + "' and testsession_id='" + test_id + "' and module_num='module4') ", con);
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
                                }
                            }
                        }

                        //  --------  MODULE 5  ------------

                        SqlCommand cmdat5 = new SqlCommand("Select max(attempt) from  practicaltest_summary where student_id ='" + Namecolumnvalue1 + "' and testsession_id='" + test_id + "'  and module_num='module5'", con);
                        SqlDataReader drat5 = cmdat5.ExecuteReader();
                        if (drat5.HasRows)
                        {
                            while (drat5.Read())
                            {
                                if (drat5[0].ToString() == "3")
                                {
                                    SqlCommand cmd85 = new SqlCommand("Select practical_status from  practicaltest_summary where student_id ='" + Namecolumnvalue1 + "' and  testsession_id='" + test_id + "'  and module_num='module5' and attempt= (select max(attempt) from practicaltest_summary where student_id ='" + Namecolumnvalue1 + "' and testsession_id='" + test_id + "' and module_num='module5') ", con);
                                    SqlDataReader dr85 = cmd85.ExecuteReader();
                                    if (dr85.HasRows)
                                    {
                                        while (dr85.Read())
                                        {

                                            if (dr85[0].ToString() == "Passed")
                                            {
                                                link[4] = "P ";

                                            }
                                            else if (dr85[0].ToString() == "Referred")
                                            {
                                                link[4] = "R ";

                                            }

                                            else if (dr85[0].ToString() == "Failed")
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

                                    SqlCommand cmd86 = new SqlCommand("select min(attempt) from practicaltest_summary where student_id ='" + Namecolumnvalue1 + "' and testsession_id='" + test_id + "' and module_num='module5' ", con);
                                    SqlDataReader dr86 = cmd86.ExecuteReader();
                                    while (dr86.Read())
                                    {
                                        if (dr86[0].ToString() != "0")
                                        {
                                            SqlCommand cmd85 = new SqlCommand("Select practical_status from  practicaltest_summary where student_id ='" + Namecolumnvalue1 + "' and  testsession_id='" + test_id + "'  and module_num='module5' and attempt= (select max(attempt) from practicaltest_summary where student_id ='" + Namecolumnvalue1 + "' and testsession_id='" + test_id + "' and module_num='module5') ", con);
                                            SqlDataReader dr85 = cmd85.ExecuteReader();
                                            if (dr85.HasRows)
                                            {
                                                while (dr85.Read())
                                                {

                                                    if (dr85[0].ToString() == "Passed")
                                                    {
                                                        link[4] = "P ";

                                                    }
                                                    else if (dr85[0].ToString() == "Referred")
                                                    {
                                                        link[4] = "R ";

                                                    }

                                                    else if (dr85[0].ToString() == "Failed")
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



                                }
                            }
                        }



                        string link_values = link[0] + link[1] + link[2] + link[3]+ link[4];
                        if(link_values=="P P P P P ")
                        {e.Row.Cells[7].BackColor = System.Drawing.Color.Green;
                        }
                        else{
                            e.Row.Cells[7].BackColor = System.Drawing.Color.Red;
                        }
                         
                         lnk.Text = link_values;
                    }
                     else
                    {
                         lnk.Text = "Start Practical Test";
                         lnk.Visible = true;
                    }
                }
                else
                {
                       lnk.Visible = false;
                }

                   
            }
            con.Close();
        }
    }
           
 
  
    protected void bt_createtest_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("create_new_test.aspx");
    }
    protected void bt_staff_details_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("staff_details.aspx");
    }
    protected void bt_past_test_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("past_session.aspx");
    }
    protected void bt_question_bank_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("q_bank.aspx");
    }
    protected void bt_reports_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Report.aspx");
    }
    protected void bt_session_details_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Active_testsessiondetails.aspx");
    }

     protected void img_edittest_Click(object sender, ImageClickEventArgs e)
     {
        Response.Redirect("edit_sessiondetails.aspx");
     }
    protected void img_finishtest_Click(object sender, ImageClickEventArgs e)//End theory test
    {
        string confirmValue = Request.Form["confirm_value"];
        if (confirmValue == "Yes")
        {
            string t_id = (string)Session["view_testid"];
           
            SqlConnection con = obj.getcon();
            con.Open();
            SqlCommand cmd = new SqlCommand("update testsession_details  set active_testsession_code=NULL where testsession_id = '" + t_id + "' ", con);
            cmd.ExecuteNonQuery();

            SqlCommand cmd_delete = new SqlCommand("delete activetest_code_vs_qnum where testsession_id = '" + t_id + "' ", con);
            cmd_delete.ExecuteNonQuery();

         
            check_theoryscore_status(t_id); //update logged-in status of theory test with current score status//this is to solve the issue of showing logged-in status of same student on all assigned session

             SqlCommand cmd_date_of_pass = new SqlCommand("select student_id from student_vs_testsession_details where  testsession_id='" + t_id + "' ", con);
             SqlDataReader dr_date_of_pass = cmd_date_of_pass.ExecuteReader();
             if (dr_date_of_pass.HasRows)
             {
                 while (dr_date_of_pass.Read())
            {
                string student_id_to_check_date_of_pass = dr_date_of_pass[0].ToString();
                obj.is_passed_both_test(student_id_to_check_date_of_pass,t_id);
            }
            }

        con.Close();
        ScriptManager.RegisterStartupScript(this, this.GetType(), "redirect",
         "alert('This theory test is closed'); window.location='view_test.aspx';", true);



           // ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('This theory test is closed')", true);
         //Response.Redirect("view_test.aspx");
        }
    }
    protected void img_completesession_Click(object sender, ImageClickEventArgs e)
    { Response.Redirect("CI_Report.aspx");

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
