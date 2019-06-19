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
using System.Windows.Forms;
using System.Drawing;
using System.Collections.Generic;
using System.Web.SessionState;
using System.Reflection;

public partial class active_testsessiondetails : System.Web.UI.Page
{

    MainClass obj = new MainClass(); //object for DB connection

    string login_staff_ID;
    string st_role, current_test_status, current_test_status2;
    protected void Page_Load(object sender, EventArgs e)
    {
        System.Web.SessionState.SessionIDManager manager = new System.Web.SessionState.SessionIDManager();
        string oldId = manager.GetSessionID(Context);
        string name = (string)Session["staffname"]; //TO GET THE WELCOME MESSAGE

        if (Session["id"] == null)
            Response.Redirect("Login.aspx");

        String logintime = (string)Session["lasttime"];

        current_test_status = "Archived";
        current_test_status2 = "Completed";

        st_role = (string)Session["staffrole"];
        string login_staff_id = (string)Session["staffid"];
     
        // Code disables caching by browser.
        Response.Cache.SetCacheability(HttpCacheability.NoCache);// this tells the client not to cache responses in the History folder, so that when you use the back/forward buttons the client requests a new version of the response each time.
        Response.Cache.SetExpires(DateTime.UtcNow.AddHours(-1));
        Response.Cache.SetNoStore();
        
        login_staff_ID = (string)Session["staffname"];


        if (st_role == "Instructor" || st_role == "Chief Instructor" || st_role=="Guest")
        {
            SqlConnection con9 = obj.getcon();
            con9.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con9;
            cmd.CommandText = "select a.admin_id,a.testsession_id,a.test_type,a.test_date,a.testsession_status,UPPER(a.chiefinstructor_name) as chiefinstructor_name ,count(b.student_id) as student_id from testsession_details a ,student_vs_testsession_details b where a.testsession_status not in(@status1, @status2) and a.testsession_id=b.testsession_id group by   a.admin_id,a.testsession_id,a.test_type,a.test_date,a.testsession_status,a.chiefinstructor_name ORDER BY a.testsession_id DESC ";
            SqlParameter param1 = new SqlParameter("@status1", current_test_status);
            SqlParameter param2 = new SqlParameter("@status2", current_test_status2);
            cmd.Parameters.Add(param1);
            cmd.Parameters.Add(param2);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            adapter.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();


            con9.Close();
        }
        else if(st_role == "Director/Asst Director")//if role=Admin
        {
            SqlConnection con8 = obj.getcon();
            con8.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con8;
            cmd.CommandText = "select a.admin_id,a.testsession_id,a.test_type,a.test_date,a.testsession_status,UPPER(a.chiefinstructor_name) as chiefinstructor_name,count(b.student_id) as student_id from testsession_details a ,student_vs_testsession_details b where a.testsession_status<>@status1 and a.testsession_id=b.testsession_id group by   a.admin_id,a.testsession_id,a.test_type,a.test_date,a.testsession_status,a.chiefinstructor_name ORDER BY a.testsession_id DESC ";
            SqlParameter param1 = new SqlParameter("@status1", current_test_status);
            cmd.Parameters.Add(param1);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            adapter.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
            con8.Close();
        }

    }

  
    protected void lnkdelete_Click(object sender, EventArgs e)// delete link for removing test session
    {
        LinkButton lnkbtn = sender as LinkButton;
        GridViewRow gvrow = lnkbtn.NamingContainer as GridViewRow;                        //getting particular row linkbutton
        string test_id = Convert.ToString(GridView1.DataKeys[gvrow.RowIndex].Value);     //getting userid of particular row


        string confirmValue = Request.Form["confirm_value"];//java script for confirmation is written on aspx page
        if (confirmValue == "Yes")
        {
            SqlConnection con = obj.getcon();
            con.Open();

            SqlCommand cmd1 = new SqlCommand("delete testsession_details where testsession_id=@test_ID1", con);
            cmd1.Parameters.Add(new SqlParameter("test_ID1", test_id));
            int result = cmd1.ExecuteNonQuery();


            SqlCommand cmd2 = new SqlCommand("delete student_vs_testsession_details where testsession_id=@test_ID2", con);
            cmd2.Parameters.Add(new SqlParameter("test_ID2", test_id));
            cmd2.ExecuteNonQuery();

            SqlCommand cmd3 = new SqlCommand("delete practicaltest_details where testsession_id=@test_ID3", con);
            cmd3.Parameters.Add(new SqlParameter("test_ID3", test_id));
            cmd3.ExecuteNonQuery();

            SqlCommand cmd4 = new SqlCommand("delete practicaltest_summary where testsession_id=@test_ID4", con);
            cmd4.Parameters.Add(new SqlParameter("test_ID4", test_id));
            cmd4.ExecuteNonQuery();

            if (result == 1)
            {

                SqlConnection con8 = obj.getcon();
                con8.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con8;
                cmd.CommandText = "select a.admin_id,a.testsession_id,a.test_type,a.test_date,a.testsession_status,UPPER(a.chiefinstructor_name) as chiefinstructor_name ,count(b.student_id) as student_id from testsession_details a ,student_vs_testsession_details b where a.testsession_status<>@status1 and a.testsession_id=b.testsession_id group by   a.admin_id,a.testsession_id,a.test_type,a.test_date,a.testsession_status,a.chiefinstructor_name ORDER BY a.testsession_id DESC ";
                SqlParameter param1 = new SqlParameter("@status1", current_test_status);
                cmd.Parameters.Add(param1);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                adapter.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                con8.Close();

                // alert message after successfull deletion of user
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('Test with ID " + test_id + " deleted successfully')", true);
            }
            con.Close();
        }
        else
        {
            Response.Redirect("Active_testsessiondetails.aspx");
        }

    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        if (e.CommandName == "select") //FOR SETTING THE VIEW LINK BUTTON
        {

            string view_id = Convert.ToString(e.CommandArgument.ToString());
            Session["S_id"] = view_id;


            SqlConnection con = obj.getcon();
            con.Open();
            SqlCommand cmd = new SqlCommand("Select start_time,test_date,duration,no_questions,testsession_id,chiefinstructor_name,testsession_status from testsession_details where testsession_id =@View_ID", con);
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
                Session["testsession_status"] = dr[6].ToString();
            }
            con.Close();
            Response.Redirect("view_test.aspx");

        }

        if (e.CommandName == "ARCHIVE") //FOR SETTING THE ARCHIVE LINK BUTTON
        {

            string view_archieve_id = Convert.ToString(e.CommandArgument.ToString());
            string confirmValue = Request.Form["confirm_value"];
            if (confirmValue == "Yes")
            {
                string status = "Archived";

                GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                LinkButton lnkbtn = (LinkButton)row.FindControl("lnkarchive");
                lnkbtn.Visible = false;

                SqlConnection con6 = obj.getcon();
                con6.Open();
                SqlCommand cmd1 = new SqlCommand("update testsession_details set testsession_status=@test_status  where testsession_id=@test_id ", con6);
                cmd1.Parameters.Add(new SqlParameter("test_status", status));
                cmd1.Parameters.Add(new SqlParameter("test_id", view_archieve_id));
                cmd1.ExecuteNonQuery();

                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('This session successfully moved to archives, You can viewed it in Past Session details.')", true);


                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con6;
                cmd.CommandText = "select a.admin_id,a.testsession_id,a.test_type,a.test_date,a.testsession_status,UPPER(a.chiefinstructor_name) as chiefinstructor_name,count(b.student_id) as student_id from testsession_details a ,student_vs_testsession_details b where a.testsession_status<>@status1 and a.testsession_id=b.testsession_id group by   a.admin_id,a.testsession_id,a.test_type,a.test_date,a.testsession_status,a.chiefinstructor_name ORDER BY a.testsession_id DESC ";
                SqlParameter param1 = new SqlParameter("@status1", current_test_status);
                cmd.Parameters.Add(param1);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                adapter.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                con6.Close();

            }

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

            e.Row.Cells[1].HorizontalAlign = HorizontalAlign.Left;
            e.Row.Cells[2].HorizontalAlign = HorizontalAlign.Left;

            LinkButton lnk2 = (LinkButton)e.Row.FindControl("lnkdelete"); //DELETE LINK
            LinkButton theLinkButton3 = (LinkButton)e.Row.FindControl("lnkarchive");
            LinkButton theLinkButton4 = (LinkButton)e.Row.FindControl("LinkButton1"); //view button

            theLinkButton4.CommandArgument = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "testsession_id"));
            theLinkButton3.CommandArgument = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "testsession_id"));

            string Namecolumnvalue = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "testsession_status"));

            if (Namecolumnvalue == "Not Started")
            {
                lnk2.Visible = true;
            }
            else if (Namecolumnvalue == "Completed")
            {
                lnk2.Visible = false;
                theLinkButton3.Visible = true;

            }
            else if (Namecolumnvalue == "Archived")
            {
                theLinkButton4.Visible = false;
                lnk2.Visible = false;
                theLinkButton3.Visible = false;
            }
            else
            {
                lnk2.Visible = false;
            }
            if (e.Row.Cells[5].Text == "Not Started")
            {
                e.Row.Cells[5].BackColor = System.Drawing.Color.Orange;
            }
            else if (e.Row.Cells[5].Text == "Ongoing")
            {
                e.Row.Cells[5].BackColor = System.Drawing.Color.Red;
            }
            else if (e.Row.Cells[5].Text == "Completed")
            {
                e.Row.Cells[5].BackColor = System.Drawing.Color.Green;
            }
            else if (e.Row.Cells[5].Text == "Archived")
            {
                e.Row.Cells[5].BackColor = System.Drawing.Color.Gray;
            }
            string login_staff_role = (string)Session["staffrole"];

            if (login_staff_role == "Instructor" || login_staff_role == "ChiefInstructor" || login_staff_role == "Guest")
            {
                lnk2.Visible = false;
            }

        }

    }



}

