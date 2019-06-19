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
public partial class past_session : System.Web.UI.Page
{
    MainClass obj = new MainClass();
  
    string current_test_status;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["id"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        else
        {
            int ID = (int)Session["id"];
            if (ID < 22)
                Response.Redirect("Login.aspx");
        }

        string name = (string)Session["staffname"]; //TO GET THE WELCOME MESSAGE

        String logintime = (string)Session["lasttime"];
        current_test_status = "Archived";

        // Code disables caching by browser.
        Response.Cache.SetCacheability(HttpCacheability.NoCache);// this tells the client not to cache responses in the History folder, so that when you use the back/forward buttons the client requests a new version of the response each time.
        Response.Cache.SetExpires(DateTime.UtcNow.AddHours(-1));
        Response.Cache.SetNoStore();
       
        SqlConnection con9 = obj.getcon();
        con9.Open();
        SqlDataAdapter adapter = new SqlDataAdapter("select admin_id,testsession_id,test_type,test_date,testsession_status,UPPER(chiefinstructor_name) as chiefinstructor_name from testsession_details where testsession_status='" + current_test_status + "' and testsession_id>'67' ", con9);
        DataSet ds = new DataSet();
        adapter.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
        con9.Close();

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

    protected void Button3_Click(object sender, ImageClickEventArgs e)
    {
        Session.Abandon();
        Response.Redirect("Login.aspx");
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "select") //FOR SETTING THE VIEW LINK BUTTON
        {

            string view_id = Convert.ToString(e.CommandArgument.ToString());
            Session["S_id"] = view_id;

            SqlConnection con = obj.getcon();
            con.Open();
            SqlCommand cmd = new SqlCommand("Select * from testsession_details where testsession_id =" + view_id + "", con);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                Session["view_time"] = dr[1].ToString();
                Session["view_date"] = dr[2].ToString();
                Session["view_duration"] = dr[11].ToString();
                Session["view_questions"] = dr[3].ToString();
                Session["view_testid"] = dr[5].ToString();
                Session["view_chiefinstructor"] = dr[9].ToString();
            }
            con.Close();
            Response.Redirect("view_test.aspx");

        }
        if (e.CommandName == "un-ARCHIVE") //FOR SETTING THE VIEW LINK BUTTON
        {

            string view_archieve_id = Convert.ToString(e.CommandArgument.ToString());
            string confirmValue = Request.Form["confirm_value"];
            if (confirmValue == "Yes")
            {
                string status = "Ongoing";

                GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                LinkButton lnkbtn = (LinkButton)row.FindControl("lnkarchive");
                lnkbtn.Visible = false;

                SqlConnection con6 = obj.getcon();
                con6.Open();
                SqlCommand cmd1 = new SqlCommand("update testsession_details set testsession_status='" + status + "'  where testsession_id='" + view_archieve_id + "' ", con6);
                cmd1.ExecuteNonQuery();

                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('This session successfully removed from archives, You can viewed it in Active Session details.')", true);

                SqlDataAdapter adapter = new SqlDataAdapter("select admin_id,testsession_id,test_type,test_date,testsession_status,UPPER(chiefinstructor_name) as chiefinstructor_name from testsession_details where testsession_status='" + current_test_status + "'  and testsession_id>'67' ", con6);
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
            LinkButton theLinkButton4 = (LinkButton)e.Row.FindControl("LinkButton1"); //view button
            LinkButton theLinkButton3 = (LinkButton)e.Row.FindControl("lnkarchive");//un archive

            theLinkButton4.CommandArgument = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "testsession_id"));
            theLinkButton3.CommandArgument = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "testsession_id"));

        }
    }
}
