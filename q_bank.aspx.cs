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
using System.Drawing;
using System.Collections.Generic;
using System.Text;
using System.Web.Script.Serialization;

public partial class q_bank : System.Web.UI.Page
{
    MainClass obj = new MainClass();

    string st_role;
    string filepath;
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
        // Code disables caching by browser.
        Response.Cache.SetCacheability(HttpCacheability.NoCache);// this tells the client not to cache responses in the History folder, so that when you use the back/forward buttons the client requests a new version of the response each time.
        Response.Cache.SetExpires(DateTime.UtcNow.AddHours(-1));
        Response.Cache.SetNoStore();

      
        string name = (string)Session["staffname"]; //TO GET THE WELCOME MESSAGE
        String logintime = (string)Session["lasttime"];
        st_role = (string)Session["staffrole"];

        Button1.ImageUrl = "images/BtnDownload.png";
        btnSend.ImageUrl = "images/BtnExport.png";
        BindGrid();

    }

    private DataTable BindGridView()
    {

        DataTable dtGrid = new DataTable();
        SqlConnection con = obj.getcon();
        con.Open();
        string strSelect = "select * from  question_bank_details";

        SqlCommand cmd = new SqlCommand(strSelect, con);

        SqlDataAdapter dAdapter = new SqlDataAdapter(cmd);

        dAdapter.Fill(dtGrid);
        return dtGrid;

    }

    protected void btnSend_Click(object sender, ImageClickEventArgs e) //upload QB
    {
        try
        {

            string confirmValue122 = Request.Form["confirm_value"];
            if (confirmValue122 == "OK")
            {
                string filename = Path.GetFileName(fileuploadExcel.FileName);
                int fileSize = fileuploadExcel.PostedFile.ContentLength;
            
                if ((Path.GetExtension(filename) == ".csv") && (fileSize <= (1.049e+6)))
                {
                    SqlConnection con_update99 = obj.getcon();
                    con_update99.Open();
                    SqlCommand cmd_update99 = new SqlCommand("update question_bank_details set answer4_text='99' , question_num ='old_'+question_num ", con_update99);
                    cmd_update99.ExecuteNonQuery();
                    con_update99.Close();

                    string excel_file = "qb_stu_excel_file";
                    string RootFolderName = ConfigurationManager.AppSettings["BCLSResultsFolder"];//D:/Hosting/10676289/html/bclstest/results

                    var path1 = RootFolderName + "/" + excel_file + "";
                    // var path1 = Server.MapPath("~/results/" + excel_file + "");
                    var directory = new DirectoryInfo(path1);
                    filepath = path1 + "\\" + filename;
                    try {
                        if (directory.Exists == false)
                        {
                            directory.Create();
                        }
                    }

                    catch (Exception ex)
                    {
                        Label5.Visible = true;
                        Label5.ForeColor = System.Drawing.Color.Red;
                        Label5.Text = ex.Message;
                    }

                    try
                    {
                        fileuploadExcel.SaveAs(filepath);
                    }
                    catch (Exception ex)
                    {
                        Label5.Visible = true;
                        Label5.ForeColor = System.Drawing.Color.Red;
                        Label5.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
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
                                List<string> listcsvColumns = csvRow.Split('|').ToList();//SPLITTING CELLS



                                string q_num = validVal(listcsvColumns[0]);
                                string category = validVal(listcsvColumns[1]);
                                string question = validVal(listcsvColumns[2]);
                                string ans1 = validVal(listcsvColumns[3]);
                                string ans2 = validVal(listcsvColumns[4]);
                                string ans3 = validVal(listcsvColumns[5]);
                                string correct_ans = validVal(listcsvColumns[6]);

                              //BELOW FIELDS ARE NOT THERE IN EXCEL FILE                               
                                string ans4 = "";// FOR IDENTIFYING  OLD AND NEW QUESTION
                                string no_correct_ans = "";
                                string task_type ="";
                                string given_time = "";
                                string no_of_ans ="";
                                string score ="";

                                insertdataintosql(q_num, category, task_type, given_time, question, no_of_ans, ans1, ans2, ans3, ans4, no_correct_ans, correct_ans, score);

                            }
                        }


                            SqlConnection conn = obj.getcon(); //delete existing QB if Excel upload success
                            conn.Open();
                            SqlCommand cmd1 = new SqlCommand("delete question_bank_details where answer4_text='99'", conn);
                            cmd1.ExecuteNonQuery();
                            conn.Close();

                            BindGrid();

                            Label5.Visible = true;
                            Label5.ForeColor = System.Drawing.Color.Green;
                            Label5.Text = "Upload status: The file uploaded successfully.";



                        }
                   

                    catch (Exception ex) //if any error occur on QB uploading
                    {

                        SqlConnection con_failedupload = obj.getcon();
                        con_failedupload.Open();
                        SqlCommand cmd_deleteqbnull = new SqlCommand("delete question_bank_details where answer4_text!='99'", con_failedupload); //new QB is deleting
                        cmd_deleteqbnull.ExecuteNonQuery();
                        SqlCommand cmd_update999 = new SqlCommand("update question_bank_details set answer4_text='' , question_num= RIGHT(question_num, LEN(question_num) - 4)", con_failedupload); //retaining old QB
                        cmd_update999.ExecuteNonQuery();
                        con_failedupload.Close();

                        Label5.Visible = true;
                        Label5.ForeColor = System.Drawing.Color.Red;
                        Label5.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;

                    }

                    finally
                    {
                        //Connection should always be closed here so that it will close always
                      //  excelConnection.Close();
                    }
                }

            }
            else
            {
                Label5.Visible = true;
                Label5.ForeColor = System.Drawing.Color.Red;
                Label5.Text = " Only Files Having .csv format and less than 1MB size can be uploaded**";

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

    //protected void btnSend_Click(object sender, ImageClickEventArgs e) //upload QB
    //{
    //    try
    //    {

    //        string confirmValue122 = Request.Form["confirm_value"];
    //        if (confirmValue122 == "OK")
    //        {
    //            string filename = Path.GetFileName(fileuploadExcel.FileName);
    //            int fileSize = fileuploadExcel.PostedFile.ContentLength;
    //            OleDbConnection excelConnection;
    //            string excelConnectionString;
    //            if ((Path.GetExtension(filename) == ".xlsx" || Path.GetExtension(filename) == ".xls") && (fileSize <= (1.049e+6)))
    //            {
    //                SqlConnection con_update99 = obj.getcon();
    //                con_update99.Open();
    //                SqlCommand cmd_update99 = new SqlCommand("update question_bank_details set answer4_text='99' , question_num ='old_'+question_num ", con_update99);
    //                cmd_update99.ExecuteNonQuery();
    //                con_update99.Close();

    //                string excel_file = "qb_stu_excel_file";
    //                string RootFolderName = ConfigurationManager.AppSettings["BCLSResultsFolder"];//D:/Hosting/10676289/html/bclstest/results

    //                var path1 = RootFolderName + "/" + excel_file + "";
    //                // var path1 = Server.MapPath("~/results/" + excel_file + "");
    //                var directory = new DirectoryInfo(path1);
    //                filepath = path1 + "\\" + filename;
    //                if (directory.Exists == false)
    //                {
    //                    directory.Create();
    //                }


    //                try
    //                {
    //                    fileuploadExcel.SaveAs(path1 + "\\" + filename);
    //                }
    //                catch (Exception ex)
    //                {
    //                    Label5.Visible = true;
    //                    Label5.ForeColor = System.Drawing.Color.Red;
    //                    Label5.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
    //                }



    //                //Create connection string to Excel work book
    //                excelConnectionString = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + filepath + ";Extended Properties=Excel 12.0;Persist Security Info=False";
    //                excelConnection = new OleDbConnection(excelConnectionString);

    //                //Create OleDbCommand to fetch data from Excel

    //                OleDbCommand cmd = new OleDbCommand("Select [QNO],[Category],[Question],[Answer1],[Answer2],[Answer3],[Correct Answer] from [QB_template$]", excelConnection);
    //                try
    //                {
    //                    excelConnection.Open();
    //                    OleDbDataReader dReader;
    //                    dReader = cmd.ExecuteReader();

    //                    //initially all fields in database table are set as null
    //                    string q_num = "";
    //                    string category = "";
    //                    string question = "";
    //                    string ans1 = "";
    //                    string ans2 = "";
    //                    string ans3 = "";
    //                    string correct_ans = "";

    //                    string ans4 = "";
    //                    string no_correct_ans = "";
    //                    string task_type = "";
    //                    string given_time = "";
    //                    string no_of_ans = "";
    //                    string score = "";


    //                    while (dReader.Read())
    //                    {
    //                        // valid function is for inseting null value for empty column

    //                        q_num = valid(dReader, 0);
    //                        category = valid(dReader, 1);
    //                        question = valid(dReader, 2);
    //                        ans1 = valid(dReader, 3);
    //                        ans2 = valid(dReader, 4);
    //                        ans3 = valid(dReader, 5);
    //                        correct_ans = valid(dReader, 6);



    //                        insertdataintosql(q_num, category, task_type, given_time, question, no_of_ans, ans1, ans2, ans3, ans4, no_correct_ans, correct_ans, score);

    //                    }
    //                    //  excelConnection.Close();

    //                    SqlConnection conn = obj.getcon(); //delete existing QB if Excel upload success
    //                    conn.Open();
    //                    SqlCommand cmd1 = new SqlCommand("delete question_bank_details where answer4_text='99'", conn);
    //                    cmd1.ExecuteNonQuery();
    //                    conn.Close();

    //                    BindGrid();

    //                    Label5.Visible = true;
    //                    Label5.ForeColor = System.Drawing.Color.Green;
    //                    Label5.Text = "Upload status: The file uploaded successfully.";
    //                }

    //                catch (Exception ex) //if any error occur on QB uploading
    //                {

    //                    SqlConnection con_failedupload = obj.getcon();
    //                    con_failedupload.Open();
    //                    SqlCommand cmd_deleteqbnull = new SqlCommand("delete question_bank_details where answer4_text!='99'", con_failedupload); //new QB is deleting
    //                    cmd_deleteqbnull.ExecuteNonQuery();
    //                    SqlCommand cmd_update999 = new SqlCommand("update question_bank_details set answer4_text='' , question_num= RIGHT(question_num, LEN(question_num) - 4)", con_failedupload); //retaining old QB
    //                    cmd_update999.ExecuteNonQuery();
    //                    con_failedupload.Close();

    //                    Label5.Visible = true;
    //                    Label5.ForeColor = System.Drawing.Color.Red;
    //                    Label5.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;

    //                }

    //                finally
    //                {
    //                    //Connection should always be closed here so that it will close always
    //                    excelConnection.Close();
    //                }
    //            }


    //            else
    //            {
    //                Label5.Visible = true;
    //                Label5.ForeColor = System.Drawing.Color.Red;
    //                Label5.Text = " Only Files Having .xlsx or.xls format and less than 1MB size can be uploaded**";

    //            }
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        var message = new JavaScriptSerializer().Serialize(ex.Message.ToString());
    //        var script = string.Format("alert({0});", message);
    //        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", script, true);
    //        return;
    //    }
    //}
  
    protected string validVal(string stval)
    {
        //if any columns are found null then they are replaced by zero
   
        if (string.IsNullOrEmpty(stval))
        {
            return Convert.ToString(0);
        }
        else
        {
            return stval.ToString().Replace("'", "''"); //To insert single quote or apostrophe data in database we need to use two consecutive single quotes or apostrophes in data

        }
    }
    public void insertdataintosql(string q_num, string category, string task_type, string given_time, string question, string no_of_ans, string ans1, string ans2, string ans3, string ans4, string no_correct_ans, string correct_ans, string score)
    {
        try
        {
            string query;
            SqlConnection conn = obj.getcon();
            conn.Open();

            query = "insert into question_bank_details(question_num, category, task_type, given_time,q_text,no_answers,answer1_text,answer2_text,answer3_text,answer4_text,no_of_correct_answer,correct_answer,    score) values('" + q_num + "','" + category + "','" + task_type + "','" + given_time + "','" + question + "','" + no_of_ans + "','" + ans1 + "','" + ans2 + "','" + ans3 + "','" + ans4 + "','" + no_correct_ans + "','" + correct_ans + "','" + score + "')";


            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        catch (Exception ex)
        {
            var message = new JavaScriptSerializer().Serialize(ex.Message.ToString());
            var script = string.Format("alert({0});", message);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", script, true);
            return;
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

    private void BindGrid()
    {
        using (SqlConnection con = obj.getcon())
        {
            using (SqlCommand cmd = new SqlCommand("SELECT * FROM question_bank_details"))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                    }
                }
            }
        }
    }
    protected void Button1_Click(object sender, ImageClickEventArgs e)
    //download questionbank_details table as excel sheet
    {
        string confirmValue = Request.Form["confirm_value"];
        if (confirmValue == "Yes")
        {
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=QB_template.xls");
            Response.Charset = "";
            Response.ContentType = "application/vnd.ms-excel";
            using (StringWriter sw = new StringWriter())
            {
                HtmlTextWriter hw = new HtmlTextWriter(sw);

                //To Export all pages
                GridView1.AllowPaging = false;
                this.BindGrid();
                GridView1.HeaderRow.BackColor = Color.White;
                GridView1.RenderControl(hw);

                Response.Output.Write(sw.ToString());
                Response.Flush();
                Response.End();
            }
        }

    }
    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Verifies that the control is rendered */
    }
    protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
    {
        string sortingDirection = string.Empty;
        if (dir == SortDirection.Ascending)
        {

            dir = SortDirection.Descending;
            sortingDirection = "Desc";

        }

        else
        {
            dir = SortDirection.Ascending;
            sortingDirection = "Asc";

        }

        DataView sortedView = new DataView(BindGridView());
        sortedView.Sort = e.SortExpression + " " + sortingDirection;
        GridView1.DataSource = sortedView;
        GridView1.DataBind();
    }

    public SortDirection dir
    {
        get
        {
            if (ViewState["dirState"] == null)
            {
                ViewState["dirState"] = SortDirection.Ascending;
            }

            return (SortDirection)ViewState["dirState"];
        }
        set
        {
            ViewState["dirState"] = value;

        }

    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }



}
