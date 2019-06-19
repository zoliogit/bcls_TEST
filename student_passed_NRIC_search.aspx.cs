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
using System.Security;
using System.Security.Permissions;
using System.Reflection;
using System.Runtime.CompilerServices;
using System.Drawing.Text;
using System.Collections.Generic;


public partial class student_passed_NRIC_search : System.Web.UI.Page
{
    MainClass obj = new MainClass();
    string test_id_clicked;
    string login_staff_ID, year, t_date;
    string st_role;
    protected void Page_Load(object sender, EventArgs e)
    {

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

        string name = (string)Session["staffname"]; //TO GET THE WELCOME MESSAGE

        String logintime = (string)Session["lasttime"];

        st_role = (string)Session["staffrole"];
        login_staff_ID = (string)Session["staffname"];

        // Code disables caching by browser.
        Response.Cache.SetCacheability(HttpCacheability.NoCache);// this tells the client not to cache responses in the History folder, so that when you use the back/forward buttons the client requests a new version of the response each time.
        Response.Cache.SetExpires(DateTime.UtcNow.AddHours(-1));
        Response.Cache.SetNoStore();
       
    }
    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Verifies that the control is rendered */
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

    protected void bt_session_details_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Active_testsessiondetails.aspx");
    }

    protected void Button3_Click(object sender, ImageClickEventArgs e)
    {
        Session.Abandon();
        Response.Redirect("Login.aspx");
    }
    protected void bt_reports_Click(object sender, ImageClickEventArgs e)
    {

        Response.Redirect("Report.aspx");
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        foreach (TableCell tc in e.Row.Cells)
        {

            tc.Attributes["style"] = "border-color: #98272d";

        }
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string st_id = Convert.ToString(e.CommandArgument.ToString());

        SqlConnection con_pdf = obj.getcon();
        con_pdf.Open();
       SqlCommand cmd_pdf = new SqlCommand("SELECT  e.student_id,UPPER(e.student_name) as student_name,e.student_nric,e.student_group,CONVERT(VARCHAR(10),e.date_of_pass ,105) as  date_of_pass,g.testsession_id,g.testsession_status from student_details e INNER JOIN  student_vs_testsession_details  f    ON e.student_id = f.student_id  INNER JOIN  testsession_details g ON  f.testsession_id=g.testsession_id where   ( g.testsession_status ='Completed' OR g.testsession_status= 'Archived')  and  date_of_pass is not null and    g.testsession_id = (SELECT MAX(h.testsession_id)  from student_vs_testsession_details  h  WHERE f.student_id = h.student_id  GROUP BY h.student_id)  order by e.student_group,e.student_name ", con_pdf);    
        
        
        SqlDataReader dr_pdf = cmd_pdf.ExecuteReader();
        while (dr_pdf.Read())
        {
            if (dr_pdf[0].ToString() == st_id)
            {

                test_id_clicked = dr_pdf[5].ToString();
                SqlCommand cmd18 = new SqlCommand("select test_date from testsession_details where testsession_id='" + dr_pdf[5].ToString() + "' ", con_pdf);
                SqlDataReader dr18 = cmd18.ExecuteReader();
                dr18.Read();
                t_date = dr18[0].ToString();
                year = t_date.Split('-')[2];

            }
        }
        con_pdf.Close();
        if (e.CommandName == "certificates")
        {


            string s_certificate = st_id + "Certificate.pdf";
            string path = obj.view_generated_certificate(year, st_id, s_certificate);
            Page.ClientScript.RegisterStartupScript(this.GetType(), "OpenWindow", "window.open('" + path + "','_newtab');", true);
            
        }

    }
    protected void GridView1_RowDataBound1(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {

            LinkButton lnk_cert = (LinkButton)e.Row.FindControl("lb_certificate"); //certificate link
            string Namecolumnvalue = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "certificates"));

            lnk_cert.CommandArgument = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "student_id"));

            if (Namecolumnvalue == "Yes")
            {

                lnk_cert.Visible = true;

            }
            if (Namecolumnvalue == "Mailed")
            {
                lnk_cert.Visible = true;

            }
            if ((Namecolumnvalue == null) || (Namecolumnvalue == ""))
            {
                lnk_cert.Visible = false;

            }

        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        SqlConnection con = obj.getcon();
        con.Open();

        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        SqlDataAdapter adp = new SqlDataAdapter();
        try
        {
            getRecords(txtSearch.Text.Trim());

        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Error occured : " + ex.Message.ToString() + "');", true);
        }
        finally
        {
            dt.Clear();
            dt.Dispose();
            cmd.Dispose();
            con.Close();
        }
    }

    private void getRecords(string searchVal)
    {
        SqlConnection con = obj.getcon();
        con.Open();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        SqlDataAdapter adp = new SqlDataAdapter();
        try
        {

            cmd = new SqlCommand("SELECT  e.student_id,UPPER(e.student_name) as student_name,e.student_nric,e.student_group,CONVERT(VARCHAR(10),e.date_of_pass ,105) as  date_of_pass,g.testsession_id,g.testsession_status,f.certificates from student_details e INNER JOIN  student_vs_testsession_details  f    ON e.student_id = f.student_id  INNER JOIN  testsession_details g ON  f.testsession_id=g.testsession_id where   e.student_nric like @SearchVal + '%' and ( g.testsession_status ='Completed' OR g.testsession_status= 'Archived')  and  date_of_pass is not null and    g.testsession_id = (SELECT MAX(h.testsession_id)  from student_vs_testsession_details  h  WHERE f.student_id = h.student_id  GROUP BY h.student_id)  order by e.student_group,e.student_name ", con);             
            cmd.Parameters.AddWithValue("@SearchVal", searchVal);
            adp.SelectCommand = cmd;
            adp.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            else
            {
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Error occured : " + ex.Message.ToString() + "');", true);
        }
        finally
        {
            dt.Clear();
            dt.Dispose();
            cmd.Dispose();
            con.Close();
        }
    }
}

