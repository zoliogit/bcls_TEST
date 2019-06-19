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
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
//using System.Windows.Forms;


public partial class instrutor_attendance_bydate : System.Web.UI.Page
{
    MainClass obj = new MainClass();
    string selected_date;
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
       download.ImageUrl = "images/BtnPrint.png";
        if (!IsPostBack)
        {
            download.Visible = false;
            Bind_dl_Date();
        }

        // Code disables caching by browser.
        Response.Cache.SetCacheability(HttpCacheability.NoCache);// this tells the client not to cache responses in the History folder, so that when you use the back/forward buttons the client requests a new version of the response each time.
        Response.Cache.SetExpires(DateTime.UtcNow.AddHours(-1));
        Response.Cache.SetNoStore();
       

    }


    private void Bind_dl_Date()
    {
        SqlConnection con2 = obj.getcon();
        con2.Open();
        //for to bind all the chiefinsructor's name to dropdown list
        SqlCommand cmd_dl = new SqlCommand("Select DISTINCT date from practicaltest_summary order by date", con2);

        

        SqlDataAdapter da_dl = new SqlDataAdapter(cmd_dl);
        DataSet ds = new DataSet();
        da_dl.Fill(ds);
        dl_staff_date.DataSource = ds;

        dl_staff_date.DataTextField = "date";
        dl_staff_date.DataValueField = "date";
        dl_staff_date.DataBind();
    //   dl_staff_date.Items.Insert(0, new ListItem("--Select One--", "0"));
       dl_staff_date.Items.Insert(0,new System.Web.UI.WebControls.ListItem("---Select---", "0"));
        con2.Close();
    }

    protected void dl_staff_date_SelectedIndexChanged(object sender, EventArgs e)
    {
        selected_date = dl_staff_date.SelectedItem.Text;
        if (selected_date == "---Select---")
        {
            download.Visible = false;
            GridView1.Visible = false;
        }
        else
        {
            
            getstaff_details(selected_date.Trim());
           
        }
       
 
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
                download.Visible = true;
            }
            else
            {
                download.Visible = false;
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
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }
    protected void GridView1_RowDataBound1(object sender, GridViewRowEventArgs e)
    {
        foreach (TableCell tc in e.Row.Cells)
        {

            tc.Attributes["style"] = "border-color: #98272d";

        }

    }
    public override void VerifyRenderingInServerForm(System.Web.UI.Control control)
    {
        /* Verifies that the control is rendered */
    }
    protected void download_Click(object sender, ImageClickEventArgs e)
    {
        Session["get_date"] = dl_staff_date.SelectedItem.Text;
       // Response.Redirect("print_staff_attendance.aspx");
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "New", "window.open('print_staff_attendance.aspx');", true);
   




       /* Document pdfDoc = new Document(PageSize.A2, 10f, 10f, 10f, 0f);

           selected_date = dl_staff_date.SelectedItem.Text;
            string attachment_filename = "StaffAttendanceReport_"+selected_date+".pdf";


            string imagepath = Server.MapPath("~/images/");

           
            string image_logo = "Schools_logo.jpg";
            string image_sign = "20141014_110201.jpg";

            iTextSharp.text.Image image = iTextSharp.text.Image.GetInstance(imagepath + image_logo);//logo image
            iTextSharp.text.Image image_sg = iTextSharp.text.Image.GetInstance(imagepath + image_sign);//signimage


            var titleFont = FontFactory.GetFont("Arial Narrow", 35, Font.BOLD);
            var subTitleFont = FontFactory.GetFont("Cambria (Body)", 18, Font.NORMAL);//hasbeen,THIS ISTO
            var NameFont = FontFactory.GetFont("Arial", 20, Font.NORMAL);
            var NRICFont = FontFactory.GetFont("Cambria", 12, Font.NORMAL);
            var basiccar_Font = FontFactory.GetFont("Arial", 24, Font.NORMAL);
            var lineFont = FontFactory.GetFont("Cambria", 12, Font.NORMAL);//_______,signature,
            var director_Font = FontFactory.GetFont("Cambria", 12, Font.ITALIC);
            var validity_font = FontFactory.GetFont("Cambria (Body)", 10, Font.NORMAL);
            var cert_font = FontFactory.GetFont("Cambria (Body)", 8, Font.NORMAL);



            //var pdfTable = new PdfPTable(1);

            var front = new PdfPTable(1); //table FRONT
            front.HorizontalAlignment = Element.ALIGN_CENTER;
            front.SpacingBefore = 10;
            front.DefaultCell.Border = 1;
            front.WidthPercentage = 100;

            image.ScalePercent(19f);
            PdfPCell cell_NGLOGO = new PdfPCell(image);
            cell_NGLOGO.UseVariableBorders = true;
            cell_NGLOGO.BorderColorTop = BaseColor.BLACK;
            cell_NGLOGO.BorderColorLeft = BaseColor.BLACK;
            cell_NGLOGO.BorderColorRight = BaseColor.BLACK;
            cell_NGLOGO.BorderColorBottom = BaseColor.WHITE;
            cell_NGLOGO.BorderColor = BaseColor.WHITE;
            cell_NGLOGO.HorizontalAlignment = 0; //0=Left, 1=Centre, 2=Right
            cell_NGLOGO.PaddingTop = 24f;
            cell_NGLOGO.PaddingLeft = 30f;
            cell_NGLOGO.VerticalAlignment = Element.ALIGN_MIDDLE;
            front.AddCell(cell_NGLOGO);

         //   front.WriteSelectedRows(0, -1, pdfDoc.Left, pdfDoc.Top, PdfWriter.directco);


       PdfPTable pdfTable = new PdfPTable(GridView1.Columns.Count);
        
        pdfTable.SpacingBefore = 10;
        pdfTable.DefaultCell.Border = 1;
        pdfTable.WidthPercentage = 50;
        pdfTable.HorizontalAlignment = Element.ALIGN_CENTER;

     


        //Adding Header row
        
      
        for (int i = 0; i < GridView1.HeaderRow.Cells.Count; i++)
        {
            string header = GridView1.HeaderRow.Cells[i].Text;
            PdfPCell cell = new PdfPCell(new Phrase(header));
           // cell.BackgroundColor = new iTextSharp.text.Color(240, 240, 240);
            pdfTable.AddCell(cell);
        }

        //Adding DataRow
        foreach (GridViewRow   row in GridView1.Rows)
        {
            for (int i = 0; i < GridView1.Columns.Count; i++)
            {    
                pdfTable.AddCell(row.Cells[i].Text);
            }
        }
       
      

        HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
        PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
        pdfDoc.Open();
        // htmlparser.Parse(srpdfDoc.Add(pdfTable);
        pdfDoc.Add(pdfTable);
        pdfDoc.Add(front);
        pdfDoc.Close();

        Response.ContentType = "application/pdf";
        Response.AddHeader("content-disposition", "attachment;filename=" + attachment_filename);

        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Write(pdfDoc);
        Response.End();
        */

     
    }

    
}
