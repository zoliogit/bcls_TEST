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
using System.Drawing.Imaging;
using System.Collections.Generic;
using System.Net;
using System.Net.Mail;
using System.Web.Script;
using System.Web.Script.Serialization;
public partial class passedstudents_notmailed : System.Web.UI.Page
{
    MainClass obj = new MainClass();
    string login_staff_ID, year, t_date;
    int rowCount;
    string test_id_clicked;

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
        // Code disables caching by browser.
        Response.Cache.SetCacheability(HttpCacheability.NoCache);// this tells the client not to cache responses in the History folder, so that when you use the back/forward buttons the client requests a new version of the response each time.
        Response.Cache.SetExpires(DateTime.UtcNow.AddHours(-1));
        Response.Cache.SetNoStore();
       
        string name = (string)Session["staffname"]; //TO GET THE WELCOME MESSAGE  
        bt_mailall.ImageUrl = "images/BtnEmail.png";
        String logintime = (string)Session["lasttime"];
        st_role = (string)Session["staffrole"];
        login_staff_ID = (string)Session["staffname"];

        Call_grid_notmailed();
       

    }
    public void  Call_grid_notmailed()
      {   
        SqlConnection con9 = obj.getcon();
        con9.Open();
        string today_date = DateTime.Now.ToString();
        SqlDataAdapter adapter = 
            new SqlDataAdapter("SELECT  e.student_id,UPPER(e.student_name) as student_name,e.student_nric,e.student_group,CONVERT(VARCHAR(10),e.date_of_pass ,105) as  date_of_pass,g.testsession_id,g.testsession_status,g.test_date,f.certificates from student_details e INNER JOIN  student_vs_testsession_details  f    ON e.student_id = f.student_id  INNER JOIN  testsession_details g ON  f.testsession_id=g.testsession_id where  g.testsession_status='Completed' and  date_of_pass is not null  and f.certificates ='Yes'  and    g.testsession_id = (SELECT MAX(h.testsession_id)  from student_vs_testsession_details  h  WHERE f.student_id = h.student_id  GROUP BY h.student_id)  order by e.student_group,e.student_name ", con9);
      
        DataSet ds = new DataSet();
        adapter.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
     
        rowCount = GridView1.Rows.Count;

        if (rowCount == 0)
        {
            bt_mailall.Visible = false;
        }
        con9.Close();
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
        SqlCommand cmd_pdf =  new SqlCommand("SELECT  e.student_id,UPPER(e.student_name) as student_name,e.student_nric,e.student_group,CONVERT(VARCHAR(10),e.date_of_pass ,105) as  date_of_pass,g.testsession_id,g.testsession_status,g.test_date,f.certificates from student_details e INNER JOIN  student_vs_testsession_details  f    ON e.student_id = f.student_id  INNER JOIN  testsession_details g ON  f.testsession_id=g.testsession_id where  g.testsession_status='Completed' and  date_of_pass is not null  and f.certificates ='Yes'  and    g.testsession_id = (SELECT MAX(h.testsession_id)  from student_vs_testsession_details  h  WHERE f.student_id = h.student_id  GROUP BY h.student_id)  order by e.student_group,e.student_name ", con_pdf);
     
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
            try
            {
                string s_certificate = st_id + "Certificate.pdf";
                string path = obj.view_generated_certificate(year, st_id, s_certificate);
                //Page.ClientScript.RegisterStartupScript(this.GetType(), "OpenWindow", "window.open('" + path + "','_newtab');", true);
                // string Geturl = "~/download/cpract_usermanual.pdf";
                if (path != string.Empty)
                {
                    WebClient User = new WebClient();
                    //Byte[] FileBuffer = User.DownloadData(Server.MapPath(path));
                    Byte[] FileBuffer = User.DownloadData(path);
                    if (FileBuffer != null)
                    {
                        Response.ContentType = "application/pdf";
                        //Response.AddHeader("Content-Disposition", "attachment; filename=Filename.extension");
                        // Response.AddHeader("Content-Disposition", "attachment; filename=cpract_usermanual.pdf");

                        Response.AddHeader("content-length", FileBuffer.Length.ToString());
                        Response.BinaryWrite(FileBuffer);
                    }
                }
            }
            catch (Exception ex)
            {
                var message = new JavaScriptSerializer().Serialize(ex.Message.ToString());
                var script = string.Format("alert({0});", message);
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", script, true);
                return;
            }

        }

            if (e.CommandName == "mail_certificate")
        {
            string confirmValue = Request.Form["confirm_value"];
            if (confirmValue == "Yes")
            {
                GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                LinkButton lnkmail = (LinkButton)row.FindControl("lb_mail");

                string student_name_cert;
                SqlConnection con_mail = obj.getcon();
                con_mail.Open();
                SqlCommand cmd_mail = new SqlCommand("select student_name from student_details where student_id='" + st_id + "' ", con_mail);
                SqlDataReader dr_mail = cmd_mail.ExecuteReader();
                dr_mail.Read();
                student_name_cert = dr_mail[0].ToString();
                con_mail.Close();
                try
                {
                    string NPst_id = st_id.Remove(st_id.Length - 1); //If ZT student id is 'ABCD' then NP's is 'SABC'

                    obj.send_mail(st_id,NPst_id, student_name_cert, year);

                    SqlConnection con_mail1 = obj.getcon();
                    con_mail1.Open();
                    SqlCommand cmd1 = new SqlCommand("update student_vs_testsession_details set certificates='Mailed' where testsession_id='" + test_id_clicked + "' and student_id='" + st_id + "'", con_mail1);
                    cmd1.ExecuteNonQuery();
                    con_mail1.Close();
                    Call_grid_notmailed();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Mail sent Successfully !');", true);
                }
                catch (Exception ex)
                {
                    var message = new JavaScriptSerializer().Serialize(ex.Message.ToString());
                    var script = string.Format("alert({0});", message);
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", script, true);
                    return;
                }
            }


        }
    }
    protected void GridView1_RowDataBound1(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {

            LinkButton lnk_cert = (LinkButton)e.Row.FindControl("lb_certificate"); //certificate link
            LinkButton lnk_mail = (LinkButton)e.Row.FindControl("lb_mail"); //certificate link
            string Namecolumnvalue = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "certificates"));

            lnk_cert.CommandArgument = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "student_id"));

            if (Namecolumnvalue == "Yes")
            {
                lnk_mail.Visible = true;
                lnk_cert.Visible = true;

            }
            if (Namecolumnvalue == "Mailed")
            {
                lnk_cert.Visible = true;
                lnk_mail.Enabled = false;
                lnk_mail.Text = "Mailed";
                lnk_mail.Visible = false;
            }
            if ((Namecolumnvalue == null) || (Namecolumnvalue == ""))
            {
                lnk_cert.Visible = false;
                lnk_mail.Visible = false;
            }

        }
    }



    protected void bt_mailall_Click(object sender, ImageClickEventArgs e)
    {
        string confirmValue = Request.Form["confirm_value"];
        if (confirmValue == "Yes")
        {
            SqlConnection con_mail = obj.getcon();
            con_mail.Open();
            SqlCommand cmd_mail = 
            new SqlCommand("SELECT  e.student_id,UPPER(e.student_name) as student_name,e.student_nric,e.student_group,CONVERT(VARCHAR(10),e.date_of_pass ,105) as  date_of_pass,g.testsession_id,g.testsession_status,g.test_date,f.certificates from student_details e INNER JOIN  student_vs_testsession_details  f    ON e.student_id = f.student_id  INNER JOIN  testsession_details g ON  f.testsession_id=g.testsession_id where  g.testsession_status='Completed' and  date_of_pass is not null  and f.certificates ='Yes'  and    g.testsession_id = (SELECT MAX(h.testsession_id)  from student_vs_testsession_details  h  WHERE f.student_id = h.student_id  GROUP BY h.student_id)  order by e.student_group,e.student_name ", con_mail);
     
            SqlDataReader dr_mail = cmd_mail.ExecuteReader();
            while (dr_mail.Read())
            {
                string mail_student_id = dr_mail[0].ToString();
                string mail_student_name = dr_mail[1].ToString();
                string mail_test_id = dr_mail[5].ToString();
                string mail_tdate = dr_mail[7].ToString();
                string mail_year = mail_tdate.Split('-')[2];

                try
                {
                 
                    string NPst_id = mail_student_id.Remove(mail_student_id.Length - 1); //If ZT student id is 'ABCD' then NP's is 'SABC'

                    obj.send_mail(mail_student_id, NPst_id, mail_student_name, mail_year);


                    SqlConnection con_mail1 = obj.getcon();
                    con_mail1.Open();
                    SqlCommand cmd1 = new SqlCommand("update student_vs_testsession_details set certificates='Mailed' where testsession_id='" + mail_test_id + "' and student_id='" + mail_student_id + "'", con_mail1);
                    cmd1.ExecuteNonQuery();
                    con_mail1.Close();

                    Call_grid_notmailed();
                }
                catch (Exception ex)
                {
                    var message = new JavaScriptSerializer().Serialize(ex.Message.ToString());
                    var script = string.Format("alert({0});", message);
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", script, true);
                    return;
                }


            }
        
            bt_mailall.Visible = false;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Mail sent Successfully !');", true);

            con_mail.Close();
        }
    }
}