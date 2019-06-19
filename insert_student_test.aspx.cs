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
using System.Text;
using System.Collections.Generic;
using System.Net;
using System.Drawing;


public partial class insert_student_test : System.Web.UI.Page
{
    MainClass obj = new MainClass();

    string[] group_array = new string[5];
    string[] new_group_array = new string[5];

    ArrayList add_group = new ArrayList();
    ArrayList al = new ArrayList();

    string id_from_textbox = "";
    int FLAG = 0;
    string id, s_testid, g_name, Test, s_testtype, value, from_new_group;

    protected void Page_Load(object sender, EventArgs e)
    {

        string st_role = (string)Session["staffrole"];
        bt_confirm.ImageUrl = "images/BtnConfirmStudentList.png";

        string name = (string)Session["staffname"];

        String logintime = (string)Session["lasttime"];

        if (Session["id"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        else
        {
            int ID = (int)Session["id"];
            if (ID < 12)
                Response.Redirect("Login.aspx");
        }

        string s_admin = (string)Session["ad_name"];
        string s_date = (string)Session["date"];

        string s_chief_instructor = (string)Session["chief_instructor_name"];
        s_testid = (string)Session["test"];
        lb_insert_date.Text = s_date;
        lb_chief.Text = s_chief_instructor.ToUpper();

        // Code disables caching by browser.
        Response.Cache.SetCacheability(HttpCacheability.NoCache);// this tells the client not to cache responses in the History folder, so that when you use the back/forward buttons the client requests a new version of the response each time.
        Response.Cache.SetExpires(DateTime.UtcNow.AddHours(-1));
        Response.Cache.SetNoStore();
       
        SqlConnection con1 = obj.getcon(); //initially clearing the 'student_vs_testsession_details' table having column value practical=0 & theory =0
        con1.Open();
        SqlCommand cmd1 = new SqlCommand("delete student_vs_testsession_details WHERE   testsession_id='" + s_testid + "' and practical='" + 0 + "' and theory='" + 0 + "'", con1);
        cmd1.ExecuteNonQuery();
        con1.Close();

        if (!IsPostBack)
        {
            Session["STUDENT_ID"] = null;
            SqlConnection con = obj.getcon();
            con.Open();

            if (Session["selectedgroupes"] == null)
            {
                Response.Redirect("Login.aspx");

            }

            ArrayList groups_previous_page = new ArrayList();
            groups_previous_page = (ArrayList)Session["selectedgroupes"];

            if (groups_previous_page.Count != 0) //binding groups to the Listbox 
            {
                for (int k = 0; k < groups_previous_page.Count; k++)
                {
                    string group_p_page = groups_previous_page[k].ToString().Trim();
                    SqlCommand cmd = new SqlCommand("select distinct student_group from student_details  where student_group!='past' ORDER BY student_group", con);
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        string GROUP = dr[0].ToString();

                        if (GROUP != group_p_page)
                        {
                            ListBox1.Items.Add(GROUP);
                        }

                    }

                }

            }
            else
            {
                Session["selectedgroupes"] = null;
                SqlCommand cmd2 = new SqlCommand("select distinct student_group from student_details where  student_group!='past'", con);
                SqlDataReader dr2 = cmd2.ExecuteReader();
                while (dr2.Read())
                {
                    string GROUP = dr2[0].ToString();
                    ListBox1.Items.Add(GROUP);
                }
            }
            con.Close();
            gridview2_selectgroup();
        }

    }

    public void gridview2_selectgroup()
    {
        if (Session["selectedgroupes"] != null)
        {
            ArrayList groups = new ArrayList();
            ArrayList student_id_list = new ArrayList();

            groups = (ArrayList)Session["selectedgroupes"];
            student_id_list = (ArrayList)Session["STUDENT_ID"];

            string select_string = "SELECT student_id,UPPER(student_name) as student_name,student_nric,student_group FROM student_details WHERE  (student_group='" + groups[0].ToString().Trim() + "' ";


            for (int i = 1; i < groups.Count; i++)
            {
                select_string += " or student_group='" + groups[i].ToString().Trim() + "'";
            }

            if (Session["STUDENT_ID"] != null)
            {

                for (int i = 0; i < student_id_list.Count; i++)
                {
                    select_string += " or student_id='" + student_id_list[i].ToString().Trim() + "'";

                }
            }
            select_string += ")and student_id in (select student_id from student_details where (DateDiff(day,date_of_pass,GetDate()) >365 or date_of_pass is null)) order by student_group,student_name";
            SqlConnection con = obj.getcon();
            con.Open();
            DataSet ds = new DataSet();
            SqlDataAdapter adapter = new SqlDataAdapter(select_string, con);
            adapter.Fill(ds);
            GridView2.DataSource = ds;
            GridView2.AllowSorting = false;
            GridView2.DataBind();
            con.Close();

        }
        else
        {

            ArrayList student_id_list = new ArrayList();

            student_id_list = (ArrayList)Session["STUDENT_ID"];

            string select_string = "SELECT student_id,UPPER(student_name) as student_name,student_nric,student_group FROM student_details WHERE  ";

            if (Session["STUDENT_ID"] != null)
            {
                select_string += " (student_id='" + student_id_list[0].ToString().Trim() + "' ";

                if (student_id_list.Count > 1)
                {
                    for (int i = 1; i < student_id_list.Count; i++)
                    {
                        select_string += " or student_id='" + student_id_list[i].ToString().Trim() + "'";

                    }
                }
                select_string += ")and student_id in (select student_id from student_details where (DateDiff(day,date_of_pass,GetDate()) >365 or date_of_pass is null)) order by student_group,student_name";


                SqlConnection con = obj.getcon();
                con.Open();
                DataSet ds = new DataSet();

                SqlDataAdapter adapter = new SqlDataAdapter(select_string, con);
                adapter.Fill(ds);
                GridView2.DataSource = ds;
                GridView2.AllowSorting = false;
                GridView2.DataBind();
                con.Close();
            }
        }
    }


    protected void LinkButton3_Click(object sender, EventArgs e) //add new student from text box
    {
        s_testtype = (string)Session["testtype"];
        id_from_textbox = tb_test_student_id.Text;
        tb_test_student_id.Text = "StudentID";

        Test = (string)Session["test"];

        SqlConnection con = obj.getcon();
        con.Open();

        SqlCommand cmd = new SqlCommand("select student_id,student_name from student_details where (DateDiff(day,date_of_pass,GetDate()) >365 or date_of_pass is null )and student_id='" + id_from_textbox + "' ", con);
        SqlDataReader dr = cmd.ExecuteReader();

        if (dr.HasRows == false)// student_id doesnt exists
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('StudentID Doesnt Exists Or Student Already Appeared the test')", true);
            return;
        }

        else  // need to add student
        {
            while (dr.Read())
            {
                ArrayList student_list = new ArrayList();

                if (Session["STUDENT_ID"] != null)
                {
                    student_list = (ArrayList)Session["STUDENT_ID"];
                }
                string student_Name = dr[1].ToString();
                student_list.Add(id_from_textbox);
                Session["STUDENT_ID"] = student_list;
                gridview2_selectgroup();
                string javaScript = "<script language='JavaScript'>alert('StudentID " + Server.HtmlEncode(id_from_textbox) + " with StudentName " + Server.HtmlEncode(student_Name) + " added to the list!');</script>";
                ClientScript.RegisterStartupScript(this.GetType(), "LinkButton3_ClickScript", javaScript);



            }
        }
        con.Close();

    }

    protected void LinkButton4_Click(object sender, EventArgs e)//add new student_group from listbox
    {
        SqlConnection con = obj.getcon();
        con.Open();
        ArrayList add_from_group = new ArrayList();
        if (Session["selectedgroupes"] != null)
        {
            add_from_group = (ArrayList)Session["selectedgroupes"];
        }
        for (int k = 0; k < ListBox1.Items.Count; k++) // GROUPS FROM NEW PAGE
        {
            if (ListBox1.Items[k].Selected == true)
            {

                add_from_group.Add(ListBox1.Items[k].Value);

            }
        }

        Session["selectedgroupes"] = add_from_group;
        con.Close();
        gridview2_selectgroup();
    }


    protected void CheckBoxTheory_Checked(object sender, EventArgs e)
    {
        for (int i = 0; i < GridView2.Rows.Count; i++)
        {
            CheckBox CheckBox1 = (CheckBox)GridView2.Rows[i].FindControl("CheckBoxTheory");

            if (CheckBox1.Checked)
            {
                CheckBox1.Checked = true;
            }

            else
            {
                CheckBox1.Checked = false;
            }

        }
    }
    protected void CheckBoxPractical_Checked(object sender, EventArgs e)
    {
        for (int i = 0; i < GridView2.Rows.Count; i++)
        {

            CheckBox checkBox2 = (CheckBox)GridView2.Rows[i].FindControl("CheckBoxPractical");

            if (checkBox2.Checked)
            {
                checkBox2.Checked = true;
            }

            else
            {
                checkBox2.Checked = false;
            }

        }

    }





    protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        if (e.CommandName == "theory_remove")
        {

            string st_id = Convert.ToString(e.CommandArgument.ToString());
            string t_id = (string)Session["test"];

            SqlConnection con = obj.getcon();
            con.Open();
            string theory_state = "0";
            SqlCommand cmd = new SqlCommand("update student_vs_testsession_details set theory='" + theory_state + "' WHERE student_id='" + st_id + "' and testsession_id='" + t_id + "'", con);
            int temp = cmd.ExecuteNonQuery();

            GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
            LinkButton lnkbtn = (LinkButton)row.FindControl("lb_theory");
            lnkbtn.Visible = false;
            con.Close();
        }
        if (e.CommandName == "practical_remove")
        {

            string practical_state = "0";
            string st_id = Convert.ToString(e.CommandArgument.ToString());
            string t_id = (string)Session["test"];

            SqlConnection con = obj.getcon();
            con.Open();
            SqlCommand cmd = new SqlCommand("update student_vs_testsession_details set practical='" + practical_state + "' WHERE student_id='" + st_id + "' and testsession_id='" + t_id + "'", con);
            int temp = cmd.ExecuteNonQuery();

            GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
            LinkButton lnkbtn = (LinkButton)row.FindControl("lb_practical");
            lnkbtn.Visible = false;
            con.Close();

        }
    }


    protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        foreach (TableCell tc in e.Row.Cells)
        {

            tc.Attributes["style"] = "border-color: #98272d";

        }
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[2].HorizontalAlign = HorizontalAlign.Left;

        }

    }

    protected void lb_add_external_students_Click(object sender, EventArgs e) //add external students
    {

        string e_student_name = tb_student_name.Text;
        string e_student_nric = tb_studentnric.Text;
        string e_student_id = tb_studentnric.Text;
        string e_student_group = "EXT" + DateTime.Now.Year + "";
        tb_student_name.Text = "StudentName";
        tb_studentnric.Text = "StudentNRIC";
      string IsNpStudent = "0";
        SqlConnection con = obj.getcon();
        con.Open();
        SqlCommand cmd2 = new SqlCommand("insert student_details(student_id,student_nric,student_name,student_group,IsNPStudent) select '" + e_student_id + "','" + e_student_nric + "','" + e_student_name + "','" + e_student_group + "','"+IsNpStudent+"' where  NOT EXISTS(select student_id from student_details where student_id='" + e_student_id + "' )", con);
        int val2 = cmd2.ExecuteNonQuery();
        SqlCommand cmd77 = new SqlCommand("select student_id,student_name from student_details where (DateDiff(day,date_of_pass,GetDate())>365 or  date_of_pass  is null )and student_id='" + e_student_id + "' ", con);
        SqlDataReader dr77 = cmd77.ExecuteReader();
        if (dr77.HasRows == false)// student_id doesnt exists
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('Student Already Appeared the test')", true);
            return;
        }
        else
        {

            ArrayList e_student_list = new ArrayList();

            if (Session["STUDENT_ID"] != null)
            {
                e_student_list = (ArrayList)Session["STUDENT_ID"];
            }
            e_student_list.Add(e_student_id);
            Session["STUDENT_ID"] = e_student_list;

            gridview2_selectgroup();

            string javaScript = "<script language='JavaScript'>alert('StudentID " + Server.HtmlEncode(e_student_id) + " with StudentName " + Server.HtmlEncode(e_student_name) + " added to the list!');</script>";
            ClientScript.RegisterStartupScript(this.GetType(), "LinkButton3_ClickScript", javaScript);
        }
        con.Close();


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
    protected void Button3_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("Login.aspx");
    }
    protected void bt_session_details_Click(object sender, ImageClickEventArgs e)
    {

        Response.Redirect("Active_testsessiondetails.aspx");
    }
    protected void bt_confirm_Click(object sender, ImageClickEventArgs e)
    {
        int t_type, p_type;

        try
        {

            Test = (string)Session["test"];
            Session["selectedgroupes"] = null;
            Session["STUDENT_ID"] = null;

            SqlConnection con = obj.getcon();
            con.Open();

            for (int i = 0; i < GridView2.Rows.Count; i++)
            {
                t_type = 0;
                p_type = 0;
                CheckBox CheckBox1 = (CheckBox)GridView2.Rows[i].FindControl("CheckBoxTheory");
                CheckBox checkBox2 = (CheckBox)GridView2.Rows[i].FindControl("CheckBoxPractical");
                id = GridView2.Rows[i].Cells[1].Text;

                if (CheckBox1.Checked)
                {
                    t_type = 1;
                }
                if (checkBox2.Checked)
                {
                    p_type = 1;
                }
                if (CheckBox1.Checked || checkBox2.Checked) //if student is assigned to both test
                {
                    string student_test_status = "Not logged-in";
                    SqlCommand cmd3 = new SqlCommand("select student_id,testsession_id from student_vs_testsession_details where student_id='" + id + "' and testsession_id='" + Test + "'", con);
                    SqlDataReader dr3 = cmd3.ExecuteReader();

                    if (dr3.HasRows)
                    {
                        SqlCommand cmd6 = new SqlCommand("update student_vs_testsession_details set theory='" + t_type + "',practical='" + p_type + "' where student_id='" + id + "' and testsession_id='" + Test + "' ", con);
                        cmd6.ExecuteNonQuery();
                    }

                    else
                    {
                        SqlCommand cmd1 = new SqlCommand("insert student_vs_testsession_details(student_id,testsession_id,test_vs_student_status,theory,practical) select '" + id + "','" + Test + "','" + student_test_status + "' ,'" + t_type + "','" + p_type + "' where  NOT EXISTS(select student_id from student_vs_testsession_details where testsession_id='" + Test + "' and student_id='" + id + "')", con);
                        int val1 = cmd1.ExecuteNonQuery();
                    }

                }

            }
            con.Close();
            Response.Redirect("finalised_student_for_test.aspx");

        }

        catch (Exception ex)
        {
          //  Response.Write(ex);
        }
    }
}
