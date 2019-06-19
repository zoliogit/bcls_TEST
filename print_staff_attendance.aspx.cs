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
using System.Drawing;
using System.Drawing.Imaging;
using System.Collections.Generic;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;

public partial class print_staff_attendance : System.Web.UI.Page
{
    MainClass obj = new MainClass();
    string selected_date;
    protected void Page_Load(object sender, EventArgs e)
    {
        MainClass obj = new MainClass();
        selected_date = Session["get_date"].ToString();
        lb_attendance_date.Text = "BCLS – STAFF ATTENDANCE ON " + selected_date;
      //  lb_date_printed.Text = DateTime.Now.ToString("dd-MM-yyyy");
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
       
        if (!IsPostBack)
        {
         getstaff_details(selected_date);
           get_ci_names(selected_date);

        }

    }

    private void get_ci_names(string selected_date)
    {
         SqlConnection con12 = obj.getcon();
        con12.Open();

        SqlCommand cmd2 = new SqlCommand("select  DISTINCT  a.chiefinstructor_name  from  testsession_details a, practicaltest_summary b where a.test_date=b.date  and b.date='"+selected_date+"' ", con12);
        SqlDataReader dr2 = cmd2.ExecuteReader();
        while (dr2.Read())
        {
            string CI_Name = dr2[0].ToString();
            Label label1 = new Label();
          //  Label2.Text = "AA";
            label1.Text = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp" + CI_Name + "<br/><br/>";
          label1.Attributes.Add("style", "font-size:17px;  font-family: Arial;");
           // div1.Controls.Add(label1);
           Panel1.Controls.Add(label1);
        }
        con12.Close();
    }
  private void getstaff_details(string selected_date)
    {
        SqlConnection con = obj.getcon();
        con.Open();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        SqlDataAdapter adp = new SqlDataAdapter();
        try
        {

            cmd = new SqlCommand("select DISTINCT a.instructor_id ,UPPER(b.staff_name) as staff_name,b.staff_nric,b.staff_employee_no from practicaltest_summary a ,staff_details b where a.instructor_id=b.staff_id and a.date = @SearchVal  order by a.instructor_id", con);
            cmd.Parameters.AddWithValue("@SearchVal", selected_date);


            adp.SelectCommand = cmd;
            adp.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                GridView1.Visible = true;
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
    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Verifies that the control is rendered */
    }
 
    protected void btnExportasPDF_Click(object sender, ImageClickEventArgs e)
    {
        
        Response.ContentType = "application/pdf";
        Response.AddHeader("content-disposition", "attachment;filename=UserDetails.pdf");
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        StringWriter sw = new StringWriter();
        HtmlTextWriter hw = new HtmlTextWriter(sw);
        this.Page.RenderControl(hw);
        StringReader sr = new StringReader(sw.ToString());
        Document pdfDoc = new Document(PageSize.A4);
        HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
        PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
        pdfDoc.Open();
        htmlparser.Parse(sr);
        pdfDoc.Close();
        Response.Write(pdfDoc);
        Response.End();
    }
}
