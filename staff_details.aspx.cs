using System;
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

public partial class staff_details : System.Web.UI.Page
{

    MainClass obj = new MainClass();
    protected void Page_Load(object sender, EventArgs e)
    {

        string st_role = (string)Session["staffrole"];
        Button1.ImageUrl = "images/BtnAddNewStaff.png";


        string name = (string)Session["staffname"];

        String logintime = (string)Session["lasttime"];

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

        // Code disables caching by browser.
        Response.Cache.SetCacheability(HttpCacheability.NoCache);// this tells the client not to cache responses in the History folder, so that when you use the back/forward buttons the client requests a new version of the response each time.
        Response.Cache.SetExpires(DateTime.UtcNow.AddHours(-1));
        Response.Cache.SetNoStore();
       
        if (!IsPostBack)
        {
            BindUserDetails();
        }

    }


    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Active_testsessiondetails.aspx");
    }

    protected void lnkdelete_Click(object sender, EventArgs e)
    {


        LinkButton lnkbtn = sender as LinkButton;
        GridViewRow gvrow = lnkbtn.NamingContainer as GridViewRow;                  //getting particular row linkbutton
        string id = Convert.ToString(GridView1.DataKeys[gvrow.RowIndex].Value);     //getting userid of particular row
        string username = gvrow.Cells[2].Text;
        SqlConnection con = obj.getcon();
        con.Open();
        SqlCommand cmd = new SqlCommand("DELETE FROM staff_details WHERE staff_id=@STAFF_id ", con);
        cmd.Parameters.Add(new SqlParameter("STAFF_id", id));
        int result = cmd.ExecuteNonQuery();
        if (result == 1)
        {
            BindUserDetails();
            //Displaying alert message after successfully deletion of user
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('Details of " + username + " is deleted successfully')", true);
        }
        con.Close();
    }



    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        foreach (TableCell tc in e.Row.Cells)
        {

            tc.Attributes["style"] = "border-color: #98272d";

        }
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //identifying the control in gridview
            LinkButton lnkbtnresult = (LinkButton)e.Row.FindControl("lnkdelete");
            LinkButton report = (LinkButton)e.Row.FindControl("lnkstaff"); //view button
            LinkButton pwd = (LinkButton)e.Row.FindControl("lnkpass"); //pswd button
            report.CommandArgument = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "staff_id"));


            //getting username from particular row
            string username = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "staff_name"));
            string stafftype = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "NPstaff"));
            if (stafftype == "True")
            {
                pwd.Visible = false;
            }
            else
            {
                pwd.Visible = true;

            }
            //raising javascript confirmationbox whenver user clicks on link button
            lnkbtnresult.Attributes.Add("onclick", "javascript:return ConfirmationBox('" + username + "')");
        }

    }
    protected void BindUserDetails()
    {
        SqlConnection con1 = obj.getcon();
        con1.Open();
        DataSet ds = new DataSet();
        SqlDataAdapter adapter = new SqlDataAdapter("SELECT staff_id,  UPPER(staff_name) as staff_name,staff_role,staff_nric,CAST(CASE NPstaff WHEN '1' THEN 1 ELSE 0 END AS BIT) AS NPstaff FROM staff_details order by staff_name ", con1);
        adapter.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
        con1.Close();

    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "select")
        {
            string staff_id = Convert.ToString(e.CommandArgument.ToString());
            Session["S_id"] = staff_id;
            Response.Redirect("staff_attendance.aspx");
        }
        if (e.CommandName == "select_pass")
        {
            string nonNP_id = Convert.ToString(e.CommandArgument.ToString());

            Random rnd = new Random();
            int pass = rnd.Next(100000, 999999); // creates a 6 digit random no.


            SqlConnection con_pass = obj.getcon();
            con_pass.Open();
            SqlCommand cmd = new SqlCommand("update staff_details set nonNP_pswd=@nonNP_Pass,pswd_time=getDate() where staff_id=@nonNPstaff_id ", con_pass);
            cmd.Parameters.Add(new SqlParameter("nonNP_Pass", pass));
            cmd.Parameters.Add(new SqlParameter("nonNPstaff_id", nonNP_id));
            int val = cmd.ExecuteNonQuery();
            con_pass.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('Password of " + nonNP_id + " : " + pass + "')", true);

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
    protected void Button1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("add_newstaff.aspx");
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
}
