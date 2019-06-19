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


public partial class create_new_test : System.Web.UI.Page
{
    MainClass obj = new MainClass();
    string tb_session_id;
    string chief_name;

    protected void Page_Load(object sender, EventArgs e)
    {

        string st_role = (string)Session["staffrole"];
        bt_addtotest.ImageUrl = "images/BtnContinue (1).png";

        SqlConnection con_lb = obj.getcon();
        con_lb.Open();
        SqlCommand cmd_lb = new SqlCommand("SELECT DISTINCT  [student_group] FROM [student_details] where student_group!='past' ORDER BY student_group", con_lb);
        SqlDataReader dr_lb = cmd_lb.ExecuteReader();
        while (dr_lb.Read())
        {
            string GROUP = dr_lb[0].ToString();
            ListBox1.Items.Add(GROUP);
        }
        con_lb.Close();


        if (!IsPostBack)
        {
            string staff_Role = "Instructor";
            dl_duration.SelectedValue = "7.5";
            dl_test_name.SelectedValue = "BCLS";
            tb_other.Text = "BCLS";

            SqlConnection con2 = obj.getcon();
            con2.Open();
            //for to bind all the chiefinsructor's name to dropdown list
            SqlCommand cmd_dl = new SqlCommand("Select UPPER(staff_name) as staff_name,staff_id FROM staff_details where staff_role<>'" + staff_Role + "' ", con2);
            SqlDataAdapter da_dl = new SqlDataAdapter(cmd_dl);
            DataSet ds = new DataSet();
            da_dl.Fill(ds);
            dl_chiefinstructor.DataSource = ds;
            dl_chiefinstructor.DataTextField = "staff_name";
            dl_chiefinstructor.DataValueField = "staff_id";
            dl_chiefinstructor.DataBind();
            con2.Close();
        }

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

        // Code disables caching by browser.
        Response.Cache.SetCacheability(HttpCacheability.NoCache);// this tells the client not to cache responses in the History folder, so that when you use the back/forward buttons the client requests a new version of the response each time.
        Response.Cache.SetExpires(DateTime.UtcNow.AddHours(-1));
        Response.Cache.SetNoStore();
       

    }
    protected void ServerValidation(object source, ServerValidateEventArgs arguments)//exAM date shouldnt be less than today's date
    {
        System.Globalization.CultureInfo provider = System.Globalization.CultureInfo.InvariantCulture;
        string format = "dd-MM-yyyy";
        DateTime dtToValidate = DateTime.ParseExact(tb_date.Text, format, provider);
        arguments.IsValid = (dtToValidate >= DateTime.Now.AddDays(-1));

    }

    protected void Button2_Click(object sender, EventArgs e)//Logout button
    {
        Session.Abandon();
        Response.Redirect("Login.aspx");
    }


    protected void EndDate_OnSelectionChanged(object sender, EventArgs e) //COMPARE VALIDATOR FOR EXAM DATE
    {
        tb_date.Text = EndDate.SelectedDate.ToString("dd-MM-yyyy");

    }

    protected void SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList dropDownList = (DropDownList)sender;
        if (dropDownList.SelectedValue == "Other")
        {
            tb_other.Enabled = true;//textbox for typing session name
            tb_other.Text = string.Empty;
            tb_other.Visible = true;
        }
        else
        {
            tb_other.Enabled = false;
            tb_other.Text = dropDownList.SelectedValue;
        }
    }
    protected void Button1_Click(object sender, ImageClickEventArgs e)//CONTINUE button
    {
        if (Page.IsValid)
        {

            try
            {

                string STAFF_id = (string)Session["staffid"];

                string admin_name = STAFF_id;
                string date = tb_date.Text;
                string selected_chief_insturctor = dl_chiefinstructor.SelectedValue;
                Session["ad_name"] = STAFF_id;
                Session["date"] = tb_date.Text;
                string test_status = "Not Started";

                SqlConnection con = obj.getcon();
                con.Open();
                SqlCommand cmd1 = new SqlCommand("select  staff_name from staff_details where staff_id=@STAFF_id ", con);
                cmd1.Parameters.Add(new SqlParameter("STAFF_id", dl_chiefinstructor.SelectedValue));
                SqlDataReader dr1 = cmd1.ExecuteReader();
                while (dr1.Read())
                {
                    chief_name = dr1[0].ToString();
                    Session["chief_instructor_name"] = chief_name;
                }
                SqlCommand cmd = new SqlCommand("insert testsession_details (admin_id,test_date,chiefinstructor_name,testsession_status,test_name,duration) values (@ADMINID,@TESTDATE,@CINAME,@TESTSTATUS,@TESTNAME,@DURATION)", con);
                cmd.Parameters.Add(new SqlParameter("ADMINID", STAFF_id));
                cmd.Parameters.Add(new SqlParameter("TESTDATE", date));
                cmd.Parameters.Add(new SqlParameter("CINAME", chief_name));
                cmd.Parameters.Add(new SqlParameter("TESTSTATUS", test_status));
                cmd.Parameters.Add(new SqlParameter("TESTNAME", tb_other.Text));
                cmd.Parameters.Add(new SqlParameter("DURATION", dl_duration.SelectedValue));
                int val = cmd.ExecuteNonQuery();

                SqlCommand cmd3 = new SqlCommand("select last_insert_id=testsession_id from testsession_details", con);//for getting the current test id.(testid is auto increment in db table)
                SqlDataReader dr = cmd3.ExecuteReader();
                while (dr.Read())
                {
                    tb_session_id = dr[0].ToString();
                }
                Session["test"] = tb_session_id;


                ArrayList al = new ArrayList();
                for (int i = 0; i < ListBox1.Items.Count; i++)
                {
                    if (ListBox1.Items[i].Selected == true)
                    {
                        al.Add(ListBox1.Items[i].Value);
                    }
                }
                Session["selectedgroupes"] = al; //stored the selected student groups to a session 

                con.Close();
            }

            catch (Exception ex)
            {
                string exx = ex.ToString();
                //Response.Write(ex);
            }

            Response.Redirect("insert_student_test.aspx");
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
    protected void Button3_Click(object sender, EventArgs e)
    {
        Session.Abandon();

        Response.Redirect("Login.aspx");

    }
    protected void bt_session_details_Click(object sender, ImageClickEventArgs e)
    {

        Response.Redirect("Active_testsessiondetails.aspx");
    }
    protected void EndDate_DayRender(object sender, DayRenderEventArgs e)
    {
        if (e.Day.IsToday)
        {
            e.Cell.ForeColor = Color.Blue;
            e.Cell.BackColor = Color.Pink;
        }

    }

}
