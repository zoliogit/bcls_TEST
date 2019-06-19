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

public partial class staff_attendance : System.Web.UI.Page
{
    MainClass obj = new MainClass();
    string staff_name;
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

        // Code disables caching by browser.
        Response.Cache.SetCacheability(HttpCacheability.NoCache);// this tells the client not to cache responses in the History folder, so that when you use the back/forward buttons the client requests a new version of the response each time.
        Response.Cache.SetExpires(DateTime.UtcNow.AddHours(-1));
        Response.Cache.SetNoStore();
        
        string staff_ID = (string)Session["S_id"];

        SqlConnection con = obj.getcon();
        con.Open();
        SqlCommand cmd = new SqlCommand("select staff_name from staff_details where staff_Id='" + staff_ID + "'", con);
        SqlDataReader dr = cmd.ExecuteReader();

        while (dr.Read())
        {
            staff_name = dr[0].ToString();
            Label5.Text = staff_name;
        }

      //  SqlDataAdapter adapter = new SqlDataAdapter("select DISTINCT date from practicaltest_summary where instructor_id='" + staff_ID + "' order by testsession_id DESC", con);
        SqlDataAdapter adapter = new SqlDataAdapter("Select test_date  from testsession_details where testsession_id IN (select DISTINCT testsession_id  from practicaltest_summary where instructor_id='" + staff_ID + "') order by testsession_id DESC ", con);        
        DataSet ds = new DataSet();
        adapter.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();

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
    protected void bt_session_details_Click(object sender, ImageClickEventArgs e)
    {

        Response.Redirect("Active_testsessiondetails.aspx");
    }

    protected void Button3_Click(object sender, ImageClickEventArgs e)
    {
        Session.Abandon();
        Response.Redirect("Login.aspx");
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        foreach (TableCell tc in e.Row.Cells)
        {

            tc.Attributes["style"] = "border-color: #98272d";

        }

    }
}
