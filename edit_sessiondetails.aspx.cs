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
using System.Drawing;
public partial class edit_sessiondetails : System.Web.UI.Page
{
    MainClass obj = new MainClass();
   
    protected void Page_Load(object sender, EventArgs e)
    {

        string name = (string)Session["staffname"];
        string st_role = (string)Session["staffrole"];
        bt_addtotest.ImageUrl = "images/BtnSave.png";
        Button4.ImageUrl = "images/BackToStudentListBtn.png";
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
        SqlConnection con_lb = obj.getcon();
        con_lb.Open();
        SqlCommand cmd_lb = new SqlCommand("SELECT DISTINCT  [student_group] FROM [student_details]  where student_group!='past' ORDER BY student_group", con_lb);
        SqlDataReader dr_lb = cmd_lb.ExecuteReader();
        while (dr_lb.Read())
        {
            string GROUP = dr_lb[0].ToString();
            ListBox2.Items.Add(GROUP);
        }
        con_lb.Close();


        // Code disables caching by browser.
        Response.Cache.SetCacheability(HttpCacheability.NoCache);// this tells the client not to cache responses in the History folder, so that when you use the back/forward buttons the client requests a new version of the response each time.
        Response.Cache.SetExpires(DateTime.UtcNow.AddHours(-1));
        Response.Cache.SetNoStore();
       
        lb_testid.Text = (string)Session["view_testid"];
        if (Session["view_testid"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        string staff_Role = "Instructor";

        SqlConnection con1 = obj.getcon();
        con1.Open();

        SqlCommand cmd1 = new SqlCommand("delete student_vs_testsession_details WHERE   testsession_id='" + lb_testid.Text + "' and practical='" + 0 + "' and theory='" + 0 + "'", con1);
        cmd1.ExecuteNonQuery();

        con1.Close();

        if (!IsPostBack == true)
        {
            SqlConnection con2 = obj.getcon();
            con2.Open();
            SqlCommand cmd_dl = new SqlCommand("Select UPPER(staff_name) as staff_name,staff_id FROM staff_details where staff_role<>'" + staff_Role + "' ", con2);
            SqlDataAdapter da_dl = new SqlDataAdapter(cmd_dl);
            DataSet ds = new DataSet();
            da_dl.Fill(ds);
            dl_chief.DataSource = ds;
            dl_chief.DataTextField = "staff_name";
            dl_chief.DataValueField = "staff_id";

            dl_chief.DataBind();
            con2.Close();

            tb_date.Text = (string)Session["view_date"]; //DATE  
            string STAFF_id = (string)Session["staffid"];
            string aaa = (string)Session["view_chiefinstructor"];
            dl_chief.SelectedItem.Text = (string)Session["view_chiefinstructor"];

        }
        gridview2_visible();

    }


    protected void Button2_Click(object sender, EventArgs e)
    {

    }
    protected void tb_date_TextChanged(object sender, EventArgs e)
    {


    }
    protected void EndDate_OnSelectionChanged(object sender, EventArgs e)
    {
        tb_date.Text = EndDate.SelectedDate.ToString("dd-MM-yyyy");
    }
    protected void ServerValidation(object source, ServerValidateEventArgs arguments)
    {
        System.Globalization.CultureInfo provider = System.Globalization.CultureInfo.InvariantCulture;
        string format = "dd-MM-yyyy";
        DateTime dtToValidate = DateTime.ParseExact(tb_date.Text, format, provider);

        arguments.IsValid = (dtToValidate >= DateTime.Now.AddDays(-1));


    }
    protected void lb_from_textbox_Click(object sender, EventArgs e)
    {

        string id_from_textbox = tb_test_student_id.Text;
        tb_test_student_id.Text = "";
        string s_test_status = "Not logged-in";
        int t_type = 1;
        int p_type = 1;
        string Test = (string)Session["view_testid"];

        SqlConnection con = obj.getcon();
        con.Open();

        SqlCommand cmd = new SqlCommand("select student_id,student_name from student_details where (DateDiff(day, date_of_pass ,GetDate()) >365 or  date_of_pass  is null )and student_id='" + id_from_textbox + "' ", con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows == false)// student_id doesnt exists
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('StudentID Doesnt Exists Or Student Already Appeared the test')", true);
            return;
        }

        else  // need to add student
        {
            SqlCommand cmd10 = new SqlCommand("select  student_id,testsession_id from student_vs_testsession_details where student_id='" + id_from_textbox + "' and testsession_id='" + lb_testid.Text + "' ", con);
            SqlDataReader dr10 = cmd10.ExecuteReader();
            if (dr10.HasRows)
            {
                SqlCommand cmd11 = new SqlCommand("update student_vs_testsession_details set  theory='" + t_type + "', practical= '" + p_type + "' where   testsession_id='" + Test + "' and student_id='" + id_from_textbox + "' ", con);
                cmd11.ExecuteNonQuery();
            }
            else
            {
                SqlCommand cmd1 = new SqlCommand("insert student_vs_testsession_details(student_id,testsession_id,test_vs_student_status,theory,practical) SELECT '" + id_from_textbox + "','" + Test + "','" + s_test_status + "','" + t_type + "','" + p_type + "' where  NOT EXISTS(select student_id from student_vs_testsession_details where testsession_id='" + Test + "' and student_id='" + id_from_textbox + "')", con);

                cmd1.ExecuteNonQuery();
            }
            string javaScript = "<script language='JavaScript'>alert('Student with ID " + Server.HtmlEncode(id_from_textbox) + " added to the list!');</script>";

            ClientScript.RegisterStartupScript(this.GetType(), "lb_from_textbox_ClickScript", javaScript);
        }
        con.Close();

        gridview2_visible();

    }
    protected void lb_from_listbox_Click(object sender, EventArgs e)
    {

        string s_test_status = "Not logged-in";
        int t_type = 1;
        int p_type = 1;
        string Test = (string)Session["view_testid"];
        SqlConnection con = obj.getcon();
        con.Open();

        ArrayList add_from_group = new ArrayList();
        if (Session["selectedgroupes"] != null)
        {

            add_from_group = (ArrayList)Session["selectedgroupes"];
        }
        for (int k = 0; k < ListBox2.Items.Count; k++) // GROUPS FROM NEW PAGE
        {
            if (ListBox2.Items[k].Selected == true)
            {

                add_from_group.Add(ListBox2.Items[k].Value);

            }
        }

        Session["selectedgroupes"] = add_from_group;
        ArrayList s_group = new ArrayList();
        s_group = (ArrayList)Session["selectedgroupes"];

        for (int i = 1; i < s_group.Count; i++)
        {
            string each_group_from_listbox = s_group[i].ToString().Trim();

            SqlCommand cmd2 = new SqlCommand("select student_id from student_details where student_group='" + each_group_from_listbox + "' and ( DateDiff(day, date_of_pass ,GetDate()) >365 or  date_of_pass  is null ) ", con);
            SqlDataReader dr2 = cmd2.ExecuteReader();
            while (dr2.Read())
            {
                string student_id_in_group = dr2[0].ToString();
                SqlCommand cmd1 = new SqlCommand("insert student_vs_testsession_details(student_id,testsession_id,test_vs_student_status,theory,practical) SELECT '" + student_id_in_group + "','" + Test + "','" + s_test_status + "','" + t_type + "','" + p_type + "' WHERE NOT EXISTS(select student_id from student_vs_testsession_details where testsession_id='" + Test + "' and student_id='" + student_id_in_group + "')", con);

                int val1 = cmd1.ExecuteNonQuery();

            }

        }
        con.Close();
        gridview2_visible();


    }
    protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "theory_remove")
        {

            string st_id = Convert.ToString(e.CommandArgument.ToString());
            string t_id = (string)Session["S_id"];

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
            string t_id = (string)Session["S_id"];

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
            string theroy_score="";
            string practical_status = "";

            e.Row.Cells[1].HorizontalAlign = HorizontalAlign.Left;
            LinkButton lnk_theory = (LinkButton)e.Row.FindControl("lb_theory");
            LinkButton lnk_practical = (LinkButton)e.Row.FindControl("lb_practical");
            lnk_theory.CommandArgument = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "student_id"));
            lnk_practical.CommandArgument = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "student_id"));

            string Namecolumnvalue1 = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "theory"));
            string Namecolumnvalue2 = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "practical"));
            string NCV_studentID = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "student_id"));
            SqlConnection con = obj.getcon();//make remove link invisible for students have started on theory / practical
            con.Open();
            SqlCommand cmd = new SqlCommand("select a.score,b.practical_status ,a.testsession_id,a.student_id  from student_vs_testsession_details a JOIN practicaltest_summary b ON   a.student_id=b.student_id where a.student_id='" + NCV_studentID + "' and a.testsession_id='" + lb_testid.Text + "' ", con);
            SqlDataReader dr = cmd.ExecuteReader();
            if(dr.HasRows)
            {
            while (dr.Read())
            {
              theroy_score = dr[0].ToString();
              practical_status = dr[1].ToString();

            }
            }

            con.Close();

            if (Namecolumnvalue1 == "1" && theroy_score=="")
            {
                lnk_theory.Visible = true;
            }
            else
            {
                lnk_theory.Visible = false;
            }
            if (Namecolumnvalue2 == "1" && practical_status == "")
            {
                lnk_practical.Visible = true;
            }
            else
            {
                lnk_practical.Visible = false;
            }


        }

    }
    public void gridview2_visible()
    {
        SqlConnection con = obj.getcon();
        con.Open();

        SqlDataAdapter adapter = new SqlDataAdapter("select e.student_id,UPPER(e.student_name) as student_name,e.student_nric,e.student_group,f.theory,f.practical from student_details e join student_vs_testsession_details f on e.student_id=f.student_id where f.testsession_id='" + lb_testid.Text + "' AND (f.theory='" + 1 + "' OR f.practical='" + 1 + "') order by e.student_group,e.student_name ", con);
        DataSet ds = new DataSet();
        adapter.Fill(ds);
        GridView2.DataSource = ds;
        GridView2.DataBind();
        GridView2.Visible = true;


        con.Close();
    }
    protected void Button4_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("view_test.aspx");
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


    protected void Button1_Click(object sender, ImageClickEventArgs e)//SAVE Button
    {

        if (Page.IsValid)
        {
            string date = tb_date.Text;

            SqlConnection con = obj.getcon();
            con.Open();

            SqlCommand cmd = new SqlCommand("update testsession_details set   test_date='" + date + "',chiefinstructor_name='" + dl_chief.SelectedItem.Text + "' where testsession_id='" + lb_testid.Text + "' ", con);
            cmd.ExecuteNonQuery();
            con.Close();

            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('Saved !!')", true);

        }
    }
    protected void EndDate_DayRender(object sender, DayRenderEventArgs e)
    {
        if (e.Day.IsToday)
        {
            e.Cell.ForeColor = Color.Blue;
            e.Cell.BackColor = Color.Pink;
        }

    }
    protected void lb_add_external_students_Click(object sender, EventArgs e)
    {

        string s_test_status = "Not logged-in";
        string e_student_name = tb_student_name.Text;
        string e_student_nric = tb_studentnric.Text;
        string e_student_id = tb_studentnric.Text;
        string e_student_group = "EXT" + DateTime.Now.Year + "";
        tb_student_name.Text = "StudentName";
        tb_studentnric.Text = "StudentNRIC";

        if ((e_student_nric == "StudentNRIC") || (e_student_name == "StudentName") || (e_student_name == "") || (e_student_nric == ""))
        {
             ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('Invalid Entry ')", true);
            return;
        }




        SqlConnection con = obj.getcon();
        con.Open();
        SqlCommand cmd2 = new SqlCommand("insert student_details(student_id,student_nric,student_name,student_group,IsNPStudent) select '" + e_student_id + "','" + e_student_nric + "','" + e_student_name + "','" + e_student_group + "','"+0+"' where  NOT EXISTS(select student_id from student_details where student_id='" + e_student_id + "' )", con);
        int val2 = cmd2.ExecuteNonQuery();

        SqlCommand cmd77 = new SqlCommand("select student_id,student_name from student_details where (DateDiff(day, date_of_pass ,GetDate()) >365 or  date_of_pass  is null )and student_id='" + e_student_id + "' ", con);
        SqlDataReader dr77 = cmd77.ExecuteReader();
        if (dr77.HasRows == false)// student_id doesnt exists
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('Student Already Appeared the test')", true);
            return;
        }
        else
        {
            SqlCommand cmd10 = new SqlCommand("select  student_id,testsession_id from student_vs_testsession_details where student_id='" + e_student_id + "' and testsession_id='" + lb_testid.Text + "' ", con);
            SqlDataReader dr10 = cmd10.ExecuteReader();
            if (dr10.HasRows)
            {
                SqlCommand cmd11 = new SqlCommand("update student_vs_testsession_details set  theory='1', practical= '1' where   testsession_id='" + lb_testid.Text + "' and student_id='" + e_student_id + "' ", con);
                cmd11.ExecuteNonQuery();
            }
            else
            {
                SqlCommand cmd1 = new SqlCommand("insert student_vs_testsession_details(student_id,testsession_id,test_vs_student_status,theory,practical) SELECT '" + e_student_id + "','" + lb_testid.Text + "','" + s_test_status + "','1','1' where  NOT EXISTS(select student_id from student_vs_testsession_details where testsession_id='" + lb_testid.Text + "' and student_id='" + e_student_id + "')", con);

                cmd1.ExecuteNonQuery();
            }

            gridview2_visible();

            string javaScript = "<script language='JavaScript'>alert('StudentID " + Server.HtmlEncode(e_student_id) + " with StudentName " + Server.HtmlEncode(e_student_name) + " added to the list!');</script>";
            ClientScript.RegisterStartupScript(this.GetType(), "LinkButton3_ClickScript", javaScript);

        } con.Close();
    }
}



