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
using System.Net;
using System.Net.Mail;
using System.Web.Script.Serialization;

public partial class generate_passed_cert : System.Web.UI.Page
{
    MainClass obj = new MainClass();
    string login_staff_ID, year, t_date; string cert_num;
    string cert_nric;

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
        bt_approve.ImageUrl = "images/BtnApprove2.png";
        String logintime = (string)Session["lasttime"];
        st_role = (string)Session["staffrole"];
        login_staff_ID = (string)Session["staffname"];

        // Code disables caching by browser.
        Response.Cache.SetCacheability(HttpCacheability.NoCache);// this tells the client not to cache responses in the History folder, so that when you use the back/forward buttons the client requests a new version of the response each time.
        Response.Cache.SetExpires(DateTime.UtcNow.AddHours(-1));
        Response.Cache.SetNoStore();
       


        SqlConnection con9 = obj.getcon();
        con9.Open();
        string today_date = DateTime.Now.ToString();
        SqlDataAdapter adapter =  new SqlDataAdapter("SELECT  e.student_id,UPPER(e.student_name) as student_name,e.student_nric,e.student_group,CONVERT(VARCHAR(10),e.date_of_pass ,105) as  date_of_pass,g.testsession_id,g.testsession_status,g.test_date,f.certificates from student_details e INNER JOIN  student_vs_testsession_details  f    ON e.student_id = f.student_id  INNER JOIN  testsession_details g ON  f.testsession_id=g.testsession_id where  g.testsession_status='Completed' and  date_of_pass is not null  and f.certificates IS NULL  and    g.testsession_id = (SELECT MAX(h.testsession_id)  from student_vs_testsession_details  h  WHERE f.student_id = h.student_id  GROUP BY h.student_id)  order by e.student_group,e.student_name ", con9);  
        DataSet ds = new DataSet();
        adapter.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
        int rowCount = GridView1.Rows.Count;
        if (rowCount == 0)//if gridview returns empty
        {
            bt_approve.Visible = false;
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



    protected void Button4_Click(object sender, ImageClickEventArgs e)
    // genereate certificates
    {


        // try {

        using (SqlConnection con_pdf = obj.getcon())
        { 
            con_pdf.Open();

        SqlCommand cmd_pdf =  new SqlCommand("SELECT  e.student_id,UPPER(e.student_name) as student_name,e.student_nric,e.student_group,CONVERT(VARCHAR(10),e.date_of_pass ,105) as  date_of_pass,g.testsession_id,g.testsession_status,g.test_date,f.certificates from student_details e INNER JOIN  student_vs_testsession_details  f    ON e.student_id = f.student_id  INNER JOIN  testsession_details g ON  f.testsession_id=g.testsession_id where  g.testsession_status='Completed' and  date_of_pass is not null  and f.certificates IS NULL  and    g.testsession_id = (SELECT MAX(h.testsession_id)  from student_vs_testsession_details  h  WHERE f.student_id = h.student_id  GROUP BY h.student_id)  order by e.student_group,e.student_name ", con_pdf);    
        SqlDataReader dr_pdf = cmd_pdf.ExecuteReader();
        while (dr_pdf.Read())
        {

            SqlCommand cmd18 = new SqlCommand("select test_date from testsession_details where testsession_id='" + dr_pdf[5].ToString() + "' ", con_pdf);
            SqlDataReader dr18 = cmd18.ExecuteReader();
            dr18.Read();

            t_date = dr18[0].ToString();
            year = t_date.Split('-')[2];


            string student_name = dr_pdf[1].ToString();
            string student_passed_date = dr_pdf[4].ToString();
            string student_nric = dr_pdf[2].ToString();
            string student_id = dr_pdf[0].ToString();
            string test_id = dr_pdf[5].ToString();
            string pdf_name = student_id + "Certificate.pdf";    //studentID+Certificate

            SqlCommand cmd20 = new SqlCommand("select * from  certificate where cert_nric='" + student_id + "'", con_pdf);
            SqlDataReader dr20 = cmd20.ExecuteReader();
            if (dr20.HasRows == false)
            {
                SqlCommand cmd19 = new SqlCommand("insert into certificate(cert_nric,cert_date) values('" + student_id + "',getdate()) ", con_pdf);
                cmd19.ExecuteNonQuery();

            }

            SqlCommand cmd22 = new SqlCommand("select * from  certificate where cert_nric='" + student_id + "'", con_pdf);
            SqlDataReader dr22 = cmd22.ExecuteReader();
            if (dr22.HasRows)
            {
                while (dr22.Read())
                {
                    cert_num = dr22[0].ToString();
                    cert_nric = dr22[1].ToString();

                }
            }
            string card_num = Convert.ToString((Convert.ToInt32(year)*10000) + Convert.ToInt32(cert_num)) + "P";
          


            var doc1 = new Document(PageSize.A4);
            string RootFolderName = ConfigurationManager.AppSettings["BCLSResultsFolder"];//D:/Hosting/10676289/html/bclstest/results

            string path = RootFolderName + "/" + year + "/certificates/" + student_id + "";//NP SERVER

            //string path = Server.MapPath("~/results/" + year + "/certificates/" + student_id + "");
        var directory = new DirectoryInfo(path);
            try
            {
                if (directory.Exists == false)
                {
                    directory.Create();
                }
            }
            catch (Exception ex)
            {
                var message = new JavaScriptSerializer().Serialize(ex.Message.ToString());
                var script = string.Format("alert({0});", message);
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", script, true);
                return;
            }
                try
                {
                    PdfWriter writer = PdfWriter.GetInstance(doc1, new FileStream(path + "/" + pdf_name + "", FileMode.Create));
        doc1.Open();

            string imagepath = Server.MapPath("~/images/");  

            string image_logo2 = "nrc-new2.png";
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


            var front = new PdfPTable(1); //table FRONT
            front.HorizontalAlignment = Element.ALIGN_CENTER;
            front.SpacingBefore = 10;
            front.DefaultCell.Border = 1;
            front.WidthPercentage = 100;
          
            image.ScalePercent(19f);




                //Phrase p33 = new Phrase();
                //p33.Add(new Phrase("Singapore Resuscitation\n and \nFirst Aid Council.", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.RED);


                //Paragraph p33 = new Paragraph("Student name");
                //p33.Alignment = Element.ALIGN_RIGHT;

                //Paragraph p = new Paragraph();
              
                //p.Add(new Chunk(image, 100, 50));
                //p.Add(new Phrase("Test "));

                //p33.Add(new Phrase("Singapore Resuscitation", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.RED)));
                //p33.Add(new Phrase("and", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.RED)));
                //p33.Add(new Phrase("First Aid Council", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.RED)));
                //p33.Add(new Phrase("Singapore Resuscitation", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.RED)));
                //p33.Add(new Phrase("and", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.RED)));
                //p33.Add(new Phrase("First Aid Council", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.RED)));

                //PdfPCell cell_sidetitle = new PdfPCell(p33);
                //cell_sidetitle.UseVariableBorders = true;
                //cell_sidetitle.BorderColorTop = BaseColor.BLACK;
                //cell_sidetitle.BorderColorLeft = BaseColor.BLACK;
                //cell_sidetitle.BorderColorRight = BaseColor.BLACK;
                //cell_sidetitle.BorderColorBottom = BaseColor.WHITE;
                //cell_sidetitle.HorizontalAlignment = 2; //0=Left, 1=Centre, 2=Right
                //cell_sidetitle.PaddingTop = 24f;
                //cell_sidetitle.PaddingRight = 30f;
                //cell_sidetitle.VerticalAlignment = Element.ALIGN_TOP;
                //front.AddCell(cell_sidetitle);


                PdfPCell cell_NGLOGO = new PdfPCell();
              cell_NGLOGO.AddElement(image);
               // cell_NGLOGO.AddElement(p);
             //   cell_NGLOGO.AddElement(cell_sidetitle);
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

                //// Singapore Resuscitation and First Aid Council.
                //Phrase p33 = new Phrase();

                //p33.Add(new Phrase("Singapore Resuscitation", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.RED)));
                //p33.Add(new Phrase("and", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.RED)));
                //p33.Add(new Phrase("First Aid Council", FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.RED)));
                //PdfPCell cell_sidetitle = new PdfPCell(p33);

                //cell_sidetitle.UseVariableBorders = true;
                //cell_sidetitle.BorderColorTop = BaseColor.BLACK;
                //cell_sidetitle.BorderColorLeft = BaseColor.BLACK;
                //cell_sidetitle.BorderColorRight = BaseColor.BLACK;
                //cell_sidetitle.BorderColorBottom = BaseColor.WHITE;
                //cell_sidetitle.HorizontalAlignment = 2; //0=Left, 1=Centre, 2=Right
                //cell_sidetitle.PaddingTop = 24f;
                //cell_sidetitle.PaddingLeft = 30f;
                ////  cell_NGLOGO.VerticalAlignment = Element.ALIGN_MIDDLE;
                //cell_sidetitle.VerticalAlignment = Element.ALIGN_TOP;
                //front.AddCell(cell_sidetitle);




                PdfPCell cell_title = new PdfPCell(new Phrase("Certificate of Achievement", titleFont));
            cell_title.UseVariableBorders = true;
            cell_title.BorderColorTop = BaseColor.WHITE;
            cell_title.BorderColorLeft = BaseColor.BLACK;
            cell_title.BorderColorRight = BaseColor.BLACK;
            cell_title.BorderColorBottom = BaseColor.WHITE;
            cell_title.HorizontalAlignment = Element.ALIGN_CENTER;
            cell_title.VerticalAlignment = Element.ALIGN_BOTTOM;
            cell_title.FixedHeight = 90;
            front.AddCell(cell_title);


            PdfPCell cell = new PdfPCell(new Phrase("This is to certify that", subTitleFont));
            cell.UseVariableBorders = true;
            cell.BorderColorTop = BaseColor.WHITE;
            cell.BorderColorLeft = BaseColor.BLACK;
            cell.BorderColorRight = BaseColor.BLACK;
            cell.BorderColorBottom = BaseColor.WHITE;
            cell.HorizontalAlignment = Element.ALIGN_CENTER;
            cell.VerticalAlignment = Element.ALIGN_BOTTOM;
            cell.FixedHeight = 65;
            front.AddCell(cell);

            Phrase phrase_stname = new Phrase();
            phrase_stname.Add(new Phrase(student_name + "\n", NameFont));
            phrase_stname.Add(new Phrase("____________________________________________________________________________________________________", FontFactory.GetFont("Arial", 8, Font.NORMAL)));
            PdfPCell cell_name = new PdfPCell(phrase_stname);
            cell_name.BorderColor = BaseColor.WHITE;
            cell_name.BorderColorTop = BaseColor.WHITE;
            cell_name.BorderColorLeft = BaseColor.BLACK;
            cell_name.BorderColorRight = BaseColor.BLACK;
            cell_name.BorderColorBottom = BaseColor.WHITE;
            cell_name.FixedHeight = 80f;
            cell_name.VerticalAlignment = Element.ALIGN_BOTTOM;
            cell_name.HorizontalAlignment = Element.ALIGN_CENTER;
            front.AddCell(cell_name);



            Phrase p2 = new Phrase("NRIC : " + student_nric, NRICFont);
            PdfPCell cell_nric = new PdfPCell(p2);
            cell_nric.UseVariableBorders = true;
            cell_nric.BorderColorTop = BaseColor.WHITE;
            cell_nric.BorderColorLeft = BaseColor.BLACK;
            cell_nric.BorderColorRight = BaseColor.BLACK;
            cell_nric.BorderColorBottom = BaseColor.WHITE;
            cell_nric.HorizontalAlignment = Element.ALIGN_CENTER;
            cell_nric.VerticalAlignment = Element.ALIGN_TOP;
            cell_nric.FixedHeight = 30f;
            front.AddCell(cell_nric);


            Phrase p8 = new Phrase("has been certified in ", subTitleFont);
            PdfPCell cell2 = new PdfPCell(p8);
            //cell2.Border = 1;
            cell2.UseVariableBorders = true;
            cell2.BorderColorTop = BaseColor.WHITE;
            cell2.BorderColorLeft = BaseColor.BLACK;
            cell2.BorderColorRight = BaseColor.BLACK;
            cell2.BorderColorBottom = BaseColor.WHITE;
            cell2.HorizontalAlignment = Element.ALIGN_CENTER;//0=Left, 1=Centre, 2=Right
            cell2.VerticalAlignment = Element.ALIGN_BOTTOM;
            cell2.FixedHeight = 58f;
            front.AddCell(cell2);


            Phrase p_basic = new Phrase();
            p_basic.Add(new Phrase("Basic Cardiac Life Support\n", basiccar_Font));
            p_basic.Add(new Phrase("____________________________________________________________________________________________________", FontFactory.GetFont("Arial", 8, Font.NORMAL)));
            PdfPCell cell_basic = new PdfPCell(p_basic);
            cell_basic.BorderColor = BaseColor.WHITE;
            cell_basic.BorderColorTop = BaseColor.WHITE;
            cell_basic.BorderColorLeft = BaseColor.BLACK;
            cell_basic.BorderColorRight = BaseColor.BLACK;
            cell_basic.BorderColorBottom = BaseColor.WHITE;
            cell_basic.VerticalAlignment = Element.ALIGN_MIDDLE;
            cell_basic.HorizontalAlignment = Element.ALIGN_CENTER;
            cell_basic.FixedHeight = 123f;
            front.AddCell(cell_basic);

            image_sg.ScalePercent(5f);
            PdfPCell cell_signLOGO = new PdfPCell(image_sg);
            cell_signLOGO.UseVariableBorders = true;
            cell_signLOGO.BorderColorTop = BaseColor.WHITE;
            cell_signLOGO.BorderColorLeft = BaseColor.BLACK;
            cell_signLOGO.BorderColorRight = BaseColor.BLACK;
            cell_signLOGO.BorderColorBottom = BaseColor.WHITE;
            
            cell_signLOGO.FixedHeight = 85f;
            cell_signLOGO.PaddingLeft = 55f;
            cell_signLOGO.PaddingTop = 12f;
            cell_signLOGO.VerticalAlignment = Element.ALIGN_BOTTOM;
            front.AddCell(cell_signLOGO);
         
            Phrase p1 = new Phrase();
            p1.Add(new Phrase("Ms.Shree Gopal", director_Font));
            p1.Add(new Phrase("                                       " + card_num + "                                   ", FontFactory.GetFont("Arial", 12, Font.NORMAL)));
            p1.Add(new Phrase(student_passed_date, FontFactory.GetFont("Arial", 12, Font.NORMAL)));
            PdfPCell cell6 = new PdfPCell(p1);
            cell6.BorderColor = BaseColor.WHITE;
            cell6.BorderColorTop = BaseColor.WHITE;
            cell6.BorderColorLeft = BaseColor.BLACK;
            cell6.BorderColorRight = BaseColor.BLACK;
            cell6.BorderColorBottom = BaseColor.WHITE;
            cell6.PaddingLeft = 30f;
         
            cell6.VerticalAlignment = Element.ALIGN_TOP;
           
            front.AddCell(cell6);


            Phrase p3 = new Phrase();
            p3.Add(new Phrase("Course Director", director_Font));
            p3.Add(new Phrase("                                        Cert. No.                                       ", FontFactory.GetFont("Arial", 12, Font.NORMAL)));
            p3.Add(new Phrase("Issue Date", FontFactory.GetFont("Arial", 12, Font.NORMAL)));
            PdfPCell cell_dir = new PdfPCell(p3);
           
            cell_dir.UseVariableBorders = true;
            cell_dir.BorderColorTop = BaseColor.WHITE;
            cell_dir.BorderColorLeft = BaseColor.BLACK;
            cell_dir.BorderColorRight = BaseColor.BLACK;
            cell_dir.BorderColorBottom = BaseColor.WHITE;
            cell_dir.PaddingLeft = 30f;
            cell_dir.VerticalAlignment = Element.ALIGN_TOP;
            front.AddCell(cell_dir);


            PdfPCell cell20 = new PdfPCell(new Phrase("School of Health Sciences", director_Font));
            cell20.HorizontalAlignment = 0; //0=Left, 1=Centre, 2=Right
            cell20.UseVariableBorders = true;
            cell20.BorderColorTop = BaseColor.WHITE;
            cell20.BorderColorLeft = BaseColor.BLACK;
            cell20.BorderColorRight = BaseColor.BLACK;
            cell20.BorderColorBottom = BaseColor.WHITE;
            cell20.VerticalAlignment = Element.ALIGN_TOP;
            cell20.FixedHeight = 18f;
            cell20.PaddingLeft = 30f;
            front.AddCell(cell20);


            Phrase p_cell22 = new Phrase();
            p_cell22.Add(new Phrase("The holder of this card has successfully undertaken specific training and testing in the life support skill indicated.\n", validity_font));
            p_cell22.Add(new Phrase("Certificate is valid for 2 years.", validity_font));
            PdfPCell cell22 = new PdfPCell(p_cell22);
            cell22.HorizontalAlignment = 1; //0=Left, 1=Centre, 2=Right
            cell22.UseVariableBorders = true;
            cell22.BorderColorTop = BaseColor.WHITE;
            cell22.BorderColorLeft = BaseColor.BLACK;
            cell22.BorderColorRight = BaseColor.BLACK;
            cell22.BorderColorBottom = BaseColor.WHITE;
            cell22.FixedHeight = 95f;
            cell22.VerticalAlignment = Element.ALIGN_BOTTOM;
            front.AddCell(cell22);




                //logo2.SetAbsolutePosition(368, 729);
                //logo2.ScalePercent(23f);
                //image.ScalePercent(19f);
                //PdfPCell cell_NGLOGO = new PdfPCell(image);
                //cell_NGLOGO.UseVariableBorders = true;
                //cell_NGLOGO.BorderColorTop = BaseColor.BLACK;
                //cell_NGLOGO.BorderColorLeft = BaseColor.BLACK;
                //cell_NGLOGO.BorderColorRight = BaseColor.BLACK;
                //cell_NGLOGO.BorderColorBottom = BaseColor.WHITE;
                //cell_NGLOGO.BorderColor = BaseColor.WHITE;
                //cell_NGLOGO.HorizontalAlignment = 0; //0=Left, 1=Centre, 2=Right
                //cell_NGLOGO.PaddingTop = 24f;
                //cell_NGLOGO.PaddingLeft = 30f;
                //cell_NGLOGO.VerticalAlignment = Element.ALIGN_MIDDLE;
                //front.AddCell(cell_NGLOGO);

                var logo2 = iTextSharp.text.Image.GetInstance(Server.MapPath("~/images/src_logo.jpg"));
                logo2.SetAbsolutePosition(368, 729);
                logo2.ScalePercent(23f);
                doc1.Add(logo2);
                doc1.Add(front);

            //Add border to page
            PdfContentByte content = writer.DirectContent;
            Rectangle rectangle = new Rectangle(doc1.PageSize);
            rectangle.Left += doc1.LeftMargin;
            rectangle.Right -= doc1.RightMargin;
            rectangle.Top -= doc1.TopMargin;
            rectangle.Bottom += doc1.BottomMargin;
            content.Rectangle(rectangle.Left, rectangle.Bottom, rectangle.Width, rectangle.Height);


            //ADD WATER MARK FOR DEVELOPMENT SERVER
         /*   var gstate = new PdfGState { FillOpacity = 0.35f, StrokeOpacity = 0.3f };
            content.SaveState();
            content.SetGState(gstate);
            content.SetColorFill(BaseColor.BLUE);
            content.BeginText();
            var font = BaseFont.CreateFont(BaseFont.TIMES_ROMAN, BaseFont.WINANSI, BaseFont.EMBEDDED);
            var fontSize = 70;
            content.SetFontAndSize(font, fontSize);
            var x = rectangle.Width / 2;
            var y = rectangle.Height / 2;
            //var x = (rectangle.Right + rectangle.Left) / 2;
            //  var y = (rectangle.Bottom + rectangle.Top) / 2;
            content.ShowTextAligned(Element.ALIGN_CENTER, "DEMO ONLY", x, y, 42);
            content.EndText();
            content.RestoreState();*/
          

            content.Stroke();
            doc1.Close();
          
                SqlCommand cmd = new SqlCommand("update student_vs_testsession_details set certificates='Yes' where testsession_id='" + test_id + "' and student_id='" + student_id + "'", con_pdf);
                cmd.ExecuteNonQuery();
                    }
                catch (Exception ex)
                {
                    //ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Error occured : " + ex.Message.ToString() + "');", true);
                    //return;

                    var message = new JavaScriptSerializer().Serialize(ex.Message.ToString());
                    var script = string.Format("alert({0});", message);
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", script, true);
                    return;
                }

            }
     
       // con_pdf.Close();
        Response.Redirect("passedstudents_notmailed.aspx");
        }
       
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    { 

    }
    protected void GridView1_RowDataBound1(object sender, GridViewRowEventArgs e)
    {
  
    }

}

