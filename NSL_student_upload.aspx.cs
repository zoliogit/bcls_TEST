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

public partial class NSL_student_upload : System.Web.UI.Page
{
    MainClass obj = new MainClass();
    string STAFF_id, name;
    string practical_group_of_student;
    string filepath;
    string user_selected_version;
    
    string sql_student_already_exist, sql_insert_student;
    protected void Page_Load(object sender, EventArgs e)
    {
        hl_studenttemplate.NavigateUrl = "~/download/NSL_Student_template.xlsx";
        user_selected_version = (string)Session["selected_version"];//1 =CPRact ;2= version 2.1 ; 3=version 2.2,4=version 3.1
        
        name = (string)Session["staffname"];
        string st_role = (string)Session["staffrole"];

        String logintime = (string)Session["lasttime"];
        STAFF_id = (string)Session["staffid"];
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

    }
    protected void btn_student_upload_Click(object sender, ImageClickEventArgs e)
    {
        string confirmValue122 = Request.Form["confirm_value"];
        if (confirmValue122 == "OK")
        {

            string RootFolderName = ConfigurationManager.AppSettings["BCLSResultsFolder"];//D:/Hosting/10676289/html/bclstest/results

            string filename = Path.GetFileName(fileuploadstudentdb.FileName);

            if (Path.GetExtension(filename) == ".csv")
            {

                string excel_file = "qb_stu_excel_file";
                //var path1 = Server.MapPath("~/results/" + excel_file + ";
                //   C:\\Users\\Divya Sajith\\Documents\\Visual Studio 2017\\WebSites\\bcls_TEST\\results\\qb_stu_excel_file
                //'D:\Hosting\10676289\html\bclstest\results\2016\certificates\10116815H\10116815HCertificate.pdf'.


                //   var path1 = Server.MapPath("~/" + RootFolderName + "/" + excel_file + "");
                var path1 = RootFolderName + "/" + excel_file;

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
                    lb_upload_err.Text = ex.Message;
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
                            string GetPracticalGroup = listcsvColumns[2];

                           
                            if (user_selected_version == "2")//1 =CPRact ;2= version 2.1 ; 3=version 2.2,4=version 3.1
                            {
                                sql_student_already_exist = "select * from NSL_student_details_v2_1 where student_id='" + GetStudentID + "'";
                            }
                            else if (user_selected_version == "3")
                            {
                                sql_student_already_exist = "select * from NSL_student_details_v2_2 where student_id='" + GetStudentID + "'";
                            }
                            else if (user_selected_version == "4")
                            {
                                sql_student_already_exist = "select * from NSL_student_details where student_id='" + GetStudentID + "'";
                            }
							else if (user_selected_version == "5")
                            {
                                sql_student_already_exist = "select * from NSL_student_details_v1_1 where student_id='" + GetStudentID + "'";
                            }
                            SqlConnection con = obj.getcon();
                            con.Open();
                            SqlCommand cmd77 = new SqlCommand(sql_student_already_exist, con);
                            SqlDataReader dr77 = cmd77.ExecuteReader();


                            if (string.IsNullOrEmpty(GetStudentID) || string.IsNullOrEmpty(GetStudentName) || string.IsNullOrEmpty(GetPracticalGroup) || dr77.HasRows)//dont insert if student_id already exists in that table, or any three field in excel is empty
                            {
                                InvalidExcelRowNum.Add(ExcelRowNum);
                                flag = 1;

                            }
                            else
                            {
                                insertdataintosql(GetStudentID,GetStudentName, GetPracticalGroup);
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

  
    public void insertdataintosql(string student_id, string student_name, string student_p_group)
    {

        SqlConnection conn = obj.getcon();
        conn.Open();
        //Version 1 =CPRact ;2= version 2.1 ; 3=version 2.2,4=version 3.1
    
        if (user_selected_version == "2")
        {
            sql_insert_student = "insert into NSL_student_details_v2_1(student_id,student_name,practical_group,staff_id) values(@student_id,@student_name,@student_p_group,@STAFF_id)";

        }
        else if (user_selected_version == "3")
        {
           sql_insert_student = "insert into NSL_student_details_v2_2(student_id,student_name,practical_group,staff_id) values(@student_id,@student_name,@student_p_group,@STAFF_id)";

        }
        else if (user_selected_version == "4")
        {
            sql_insert_student = "insert into NSL_student_details(student_id,student_name,practical_group,staff_id) values(@student_id,@student_name,@student_p_group,@STAFF_id)";

        }
		else if (user_selected_version == "5")
        {
            sql_insert_student = "insert into NSL_student_details_v1_1(student_id,student_name,practical_group,staff_id) values(@student_id,@student_name,@student_p_group,@STAFF_id)";

        }
        SqlCommand cmd = new SqlCommand(sql_insert_student, conn);
        cmd.Parameters.Add(new SqlParameter("student_id", student_id));
        cmd.Parameters.Add(new SqlParameter("student_name", student_name));
        cmd.Parameters.Add(new SqlParameter("student_p_group", student_p_group));
        cmd.Parameters.Add(new SqlParameter("STAFF_id", STAFF_id));
        cmd.ExecuteNonQuery();
        conn.Close();

    }
}
