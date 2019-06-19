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
using System.Data.OleDb;
using System.Net;

public partial class Report : System.Web.UI.Page
{
    MainClass obj = new MainClass();
    string login_staff_ID;
    string st_role;
    string filepath;
  
    protected void Page_Load(object sender, EventArgs e)
    {
        
        hl_studenttemplate.NavigateUrl = "~/download/Student_template.xlsx";
        hl_usermanual.NavigateUrl = "~/download/cpract_usermanual.pdf";

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
        btn_student_upload.ImageUrl = "images/BtnAppend.png";


        string name = (string)Session["staffname"]; //TO GET THE WELCOME MESSAGE
        String logintime = (string)Session["lasttime"];


        st_role = (string)Session["staffrole"];
        login_staff_ID = (string)Session["staffname"];

        // Code disables caching by browser.
        Response.Cache.SetCacheability(HttpCacheability.NoCache);// this tells the client not to cache responses in the History folder, so that when you use the back/forward buttons the client requests a new version of the response each time.
        Response.Cache.SetExpires(DateTime.UtcNow.AddHours(-1));
        Response.Cache.SetNoStore();
       

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
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("student_failed_report.aspx");

    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Response.Redirect("student_passed_report.aspx");
    }
    protected void btn_student_upload_Click(object sender, ImageClickEventArgs e)
    // upload students
    {
        string confirmValue122 = Request.Form["confirm_value"];
        if (confirmValue122 == "OK")
        {
            
            string RootFolderName =ConfigurationManager.AppSettings["BCLSResultsFolder"];//D:/Hosting/10676289/html/bclstest/results

            string filename = Path.GetFileName(fileuploadstudentdb.FileName);
         
            if (Path.GetExtension(filename) == ".csv" )
            {

                string excel_file = "qb_stu_excel_file";
                //var path1 = Server.MapPath("~/results/" + excel_file + ";
                //   C:\\Users\\Divya Sajith\\Documents\\Visual Studio 2017\\WebSites\\bcls_TEST\\results\\qb_stu_excel_file
                //'D:\Hosting\10676289\html\bclstest\results\2016\certificates\10116815H\10116815HCertificate.pdf'.


             //   var path1 = Server.MapPath("~/" + RootFolderName + "/" + excel_file + "");
                var path1 =  RootFolderName + "/" + excel_file ;

                var directory = new DirectoryInfo(path1);
                filepath = path1 + "\\" + filename;
                try
                {
                    if (directory.Exists == false)
                    {
                        directory.Create();
                    }
                }

                catch (Exception ex)
                {
                    lb_upload_err.Visible = true;
                    lb_upload_err.ForeColor = System.Drawing.Color.Red;
                    lb_upload_err.Text =  ex.Message;
                }
                try
                {

                    fileuploadstudentdb.SaveAs(filepath);
                }
                catch (Exception ex)
                {
                    lb_upload_err.Visible = true;
                    lb_upload_err.ForeColor = System.Drawing.Color.Red;
                    lb_upload_err.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
                }
                try
                {
                   
                    //getting full file path of Uploaded file  
                   // string CSVFilePath = Path.GetFullPath(fileuploadstudentdb.PostedFile.FileName);
                    //Reading All text  
                  //  string ReadCSV = File.ReadAllText(filepath);
                    List<string> ReadCSV = File.ReadAllLines(filepath).Skip(1).ToList();
                    int ExcelRowNum = 1;
                    int flag = 0;
                    List<int> InvalidExcelRowNum = new List<int>();
                    //spliting row after new line  
                    foreach (string csvRow in ReadCSV)
                    {
                        if (!string.IsNullOrEmpty(csvRow))
                        {
                            ExcelRowNum++;
                            List<string> listcsvColumns = csvRow.Split(',').ToList();

                            string GetStudentID = listcsvColumns[0];
                            string GetStudentName = listcsvColumns[1];
                            string GetStudentNRIC = listcsvColumns[2];
                            string GetStudentGroup = listcsvColumns[3];
                            string sql_student_already_exist = "select * from student_details where student_id='" +GetStudentID + "'";
                            SqlConnection con = obj.getcon();
                            con.Open();
                            SqlCommand cmd77 = new SqlCommand(sql_student_already_exist, con);
                            SqlDataReader dr77 = cmd77.ExecuteReader();


                            if ( string.IsNullOrEmpty(GetStudentID) || string.IsNullOrEmpty(GetStudentName) || string.IsNullOrEmpty(GetStudentNRIC) || string.IsNullOrEmpty(GetStudentGroup)|| dr77.HasRows)//dont insert if student_id already exists in that table, or any three field in excel is empty
                            {
                                InvalidExcelRowNum.Add(ExcelRowNum);
                                flag = 1;
                             
                            }
                            else
                            {
                                insertdataintosql(GetStudentID,GetStudentName,GetStudentNRIC,GetStudentGroup);


                            }

                            con.Close();

                        }


                    }
                  


                    if (flag == 1)//if any column of excel row is empty
                    {
                        lb_upload_err.Visible = true;
                        lb_upload_err.ForeColor = System.Drawing.Color.Red;
                        lb_upload_err.Text = "Upload status: Student details are inserted. Except excel rows : ";

                        foreach (int dataItem in InvalidExcelRowNum)
                        {
                            lb_upload_err.Text += dataItem;
                            lb_upload_err.Text += ",";
                        }
                        lb_upload_err.Text += "Please check.";

                    }
                    else
                    {
                        lb_upload_err.Visible = true;
                        lb_upload_err.ForeColor = System.Drawing.Color.Green;
                        lb_upload_err.Text = "Upload status: The file uploaded successfully.";
                    }

                }
                catch (Exception ex)
                {



                    lb_upload_err.Visible = true;
                    lb_upload_err.ForeColor = System.Drawing.Color.Red;
                    lb_upload_err.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;

                }

            }
            else
            {
                lb_upload_err.Visible = true;
                lb_upload_err.ForeColor = System.Drawing.Color.Red;
                lb_upload_err.Text = "Select file having .csv format*";
            }
        }
    }


   
      
    public void insertdataintosql(string student_id, string student_nric, string student_name, string student_group)
    {
       
            SqlConnection conn = obj.getcon();
            conn.Open();
            //string query = "insert into student_details(student_id,student_nric,student_name,student_group) values('" + student_id + "','" + student_nric + "','" + student_name + "','" + student_group + "')";
            string query = "insert into student_details(student_id,student_nric,student_name,student_group) values(@student_id,@student_nric,@student_name,@student_group)";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.Add(new SqlParameter("student_id", student_id));
            cmd.Parameters.Add(new SqlParameter("student_nric", student_nric));
            cmd.Parameters.Add(new SqlParameter("student_name", student_name));
            cmd.Parameters.Add(new SqlParameter("student_group", student_group));


            cmd.ExecuteNonQuery();
            conn.Close();
      
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        Response.Redirect("passedstudents_notmailed.aspx");
    }
    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        Response.Redirect("student_passed_NRIC_search.aspx");

    }

    protected void LinkButton6_Click(object sender, EventArgs e)
    {
        Response.Redirect("instrutor_attendance_bydate.aspx");
    }
    protected void lb_cert_Click(object sender, EventArgs e)
    {
        Response.Redirect("generate_passed_cert.aspx");


    }


    protected void hl_cleargroup_Click(object sender, EventArgs e)
    {
         string confirmValue_clear = Request.Form["confirm_value"];
         if (confirmValue_clear == "OK")

         {
             SqlConnection con_clear = obj.getcon();
             con_clear.Open();
             SqlCommand cmd_clear = new SqlCommand("update student_details set student_group='past'  ", con_clear);
             cmd_clear.ExecuteNonQuery();
             con_clear.Close();

             ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Cleared  !');", true);
    
         }
    }
    protected void LinkButton5_Click(object sender, EventArgs e)
    {
        Response.Redirect("student_NRIC_search.aspx");
    }

  
}
