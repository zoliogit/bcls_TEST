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

public partial class finalised_student_for_test : System.Web.UI.Page
{
    MainClass obj = new MainClass();

    protected void Page_Load(object sender, EventArgs e)
    {
        string name = (string)Session["staffname"];
        string st_role = (string)Session["staffrole"];
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
        Response.Cache.SetCacheability(HttpCacheability.NoCache);

        string s_date = (string)Session["date"];
        string s_chief_instructor = (string)Session["chief_instructor_name"];
        lb_chief.Text = s_chief_instructor.ToUpper();
        lb_date.Text = s_date;

        string test_id = (string)Session["test"];
        if (Session["test"] == null)
        {
            Response.Redirect("Login.aspx");
        }

        SqlConnection con1 = obj.getcon();//clearing the 'student_vs_testsession_details' table having column value practical=0 & theory =0
        con1.Open();
        SqlCommand cmd1 = new SqlCommand("delete student_vs_testsession_details WHERE   testsession_id='" + test_id + "' and practical='" + 0 + "' and theory='" + 0 + "'", con1);
        cmd1.ExecuteNonQuery();
        con1.Close();

        gridview2_visible();

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
            Label label_theory = (Label)e.Row.FindControl("TextBox2");
            Label label_practical = (Label)e.Row.FindControl("TextBox3");

            CheckBox cb_theory = (CheckBox)e.Row.FindControl("CheckBox1");
            CheckBox cb_practical = (CheckBox)e.Row.FindControl("CheckBox2");


            string Namecolumnvalue1 = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "theory"));
            string Namecolumnvalue2 = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "practical"));

            if (Namecolumnvalue1 == "True")
            {
                label_theory.Visible = false;
                cb_theory.Visible = true;

            }
            else
            {
                label_theory.Visible = true;
                cb_theory.Visible = false;

            }

            if (Namecolumnvalue2 == "True")
            {
                label_practical.Visible = false;
                cb_practical.Visible = true;
            }
            else
            {
                label_practical.Visible = true;
                cb_practical.Visible = false;

            }
        }
    }

    public void gridview2_visible()
    {
        SqlConnection con = obj.getcon();
        con.Open();
        string test_id = (string)Session["test"];
        SqlDataAdapter adapter = new SqlDataAdapter("select  e.student_id,UPPER(e.student_name) as student_name ,e.student_nric,e.student_group,CAST(CASE f.theory WHEN '1' THEN 1 ELSE 0 END AS BIT) AS theory,CAST(CASE f.practical WHEN '1' THEN 1 ELSE 0 END AS BIT) AS practical from student_details e join student_vs_testsession_details f on e.student_id=f.student_id where f.testsession_id='" + test_id + "' order by e.student_group,e.student_name", con);
        DataSet ds = new DataSet();
        adapter.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
        GridView1.Visible = true;
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

}
