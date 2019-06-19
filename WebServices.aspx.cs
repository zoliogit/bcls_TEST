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
using System.Collections.Specialized;       //FOR NAME VALUE COLLECTIONS
using System.Web.Script.Serialization;     //JAVA SCRIPT SERIALIZER CLASS
using System.Runtime.Serialization.Json;  //We can use DataContractJsonSerializer to serialize type instance to JSON string and deserialize JSON string to type instance.
using System.ServiceModel.Web;           // JSON
using System.Collections.Generic;       //FOR GENERATING RANDOM NUMS
using System.Text;                     // FOR STRING BUILDER
using System.Net;
using System.DirectoryServices.Protocols;
using System.DirectoryServices;
using System.Diagnostics;
using System.DirectoryServices.ActiveDirectory;

public partial class WebServices : System.Web.UI.Page
{
    MainClass obj = new MainClass();
    string t_activation_code; string ans_db;
    string test_id;
    string  year, t_date;

    string student_nric, student_test_date,student_name;
    string cert_path;
    string theory_status;
    string module1_status;
    string module2_status;
    string module3_status;
    string module4_status;
    string module5_status;
    string is_test_archived;
    protected void Page_Load(object sender, EventArgs e)
    {
        string servicename;
        string RootFolderName = ConfigurationManager.AppSettings["BCLSResultsFolder"];//D:/Hosting/10676289/html/bclstest/results


        HttpContext context = HttpContext.Current;
        NameValueCollection nvc = context.Request.Form;

        servicename = nvc["servicename"];

        switch (servicename)
        {

         case "ibclslogin":
                {
                 
                string userName, passWord;

                    if ((!string.IsNullOrEmpty(nvc["username"])) && (!string.IsNullOrEmpty(nvc["password"])))
                    {
                        userName = nvc["username"]; //ALLOWS MANY VALUES FOR ONE KEY.
                        passWord = nvc["password"];


              // bool StudentPassword_valid = obj.ZTpasswordCheck(userName, passWord);
                 bool StudentPassword_valid = obj.NPpasswordCheck(userName, passWord); //NP PRODUCTION SERVER

                        if (StudentPassword_valid)
                        {
                            var userDetails = new { status = "success", username = userName };
                            string json = new JavaScriptSerializer().Serialize(userDetails);
                            Response.ContentType = "application/json";
                            Response.Write(json);
                        }
                        else
                        {
                            var userDetails = new { status = "fail" };
                            string json = new JavaScriptSerializer().Serialize(userDetails);
                            Response.ContentType = "application/json";
                            Response.Write(json);

                        }
                    }


                    else  //gets null or empty from device
                    {
                        var userDetails = new { status = "authorisation failed" };
                        string json = new JavaScriptSerializer().Serialize(userDetails);
                        Response.ContentType = "application/json";
                        Response.Write(json);
                    }



                }
                break;


            case "studentlogin":
                {
                    SqlConnection con = obj.getcon();
                    string userName, passWord;

                    if ((!string.IsNullOrEmpty(nvc["username"])) && (!string.IsNullOrEmpty(nvc["password"])))
                    {
                        userName = nvc["username"]; //ALLOWS MANY VALUES FOR ONE KEY.
                        passWord = nvc["password"];

                        string user_remove_firs_char = userName.Substring(1);
                        string Student_status = "Logged_In";
                        string Student_old_status = "Not logged-in";


                        con.Open();
                        SqlCommand cmd = new SqlCommand("select student_id,student_name,IsNPStudent,ExtStudentPassword from student_details where student_id LIKE '" + user_remove_firs_char + "_' ", con);
                        SqlDataReader dr = cmd.ExecuteReader();

                        string studentExists, loginOK;
                        studentExists = "Student Not in DB.  ";
                        loginOK = "But, Login unsuccessful.";
                        bool StudentSuccessfullyLoggedIn = false;
                        if (dr.HasRows)
                        {
                            studentExists = "Student Exists in the db";

                            dr.Read();
                            bool bitValue = true;  //ASSUME  NPstudent
                            if (!dr.IsDBNull(2))
                                bitValue = dr.GetBoolean(2);
                            if (bitValue == false) //NON NP Student/external student
                            {
                                string NONnp_pass = Convert.ToString(dr[3]);
                                if (NONnp_pass == passWord)
                                {
                                    StudentSuccessfullyLoggedIn = true;
                                    loginOK = "Login SUCCESSFUL";
                                }
                               
                            }
                            else//NP STUDENT
                            { 

                         //  bool StudentPassword_valid = obj.ZTpasswordCheck(userName, passWord);
                           bool StudentPassword_valid = obj.NPpasswordCheck(userName, passWord); //NP PRODUCTION SERVER                      
                            if (StudentPassword_valid)
                            {
                                StudentSuccessfullyLoggedIn = true;
                                loginOK = "Login SUCCESSFUL";
                            }
                            }

                        }
                        if (StudentSuccessfullyLoggedIn)
                        {
                            //LOGGED-IN STATUS CHaNGING FOR ONLY LATEST SESSON of particular student////this is to solve the issue of looged-in status of same student on all assigned session
                           SqlCommand cmd404 = new SqlCommand("select MAX(testsession_id) from student_vs_testsession_details where student_id  LIKE '" + user_remove_firs_char + "_'   GROUP BY student_id", con);
                            SqlDataReader dr404 = cmd404.ExecuteReader();

                            if (dr404.HasRows)
                            {


                                while (dr404.Read())
                                {
                                    string max_testsession_id = dr404[0].ToString();
                                    SqlCommand cmd409 = new SqlCommand("select testsession_status from testsession_details  where testsession_id='" + max_testsession_id + "'  ", con);
                                    SqlDataReader dr409 = cmd409.ExecuteReader();
                                    while (dr409.Read())
                                    {
                                        if (dr409[0].ToString() == "Archived")
                                        {
                                            //var userDetails = new { status = "Exam already attended" };
                                            //string json = new JavaScriptSerializer().Serialize(userDetails);
                                            //Response.ContentType = "application/json";
                                            //Response.Write(json);


                                            is_test_archived = "yes";

                                        }
                                        else
                                        {
                                            is_test_archived = "no";

                                        }
                                    }                                      

                                            string input = "abcdefghijklmnopqrstuvwxyz0123456789"; //to read the token
                                            StringBuilder builder = new StringBuilder();
                                            Random random = new Random((int)DateTime.Now.Ticks);


                                            char ch;
                                            for (int i = 0; i < 32; i++)
                                            {
                                                ch = input[random.Next(0, input.Length)];
                                                builder.Append(ch);
                                            }


                                            string Token = builder.ToString();
                                            SqlCommand cmd1 = new SqlCommand("update student_details set token='" + Token + "' where student_id LIKE '" + user_remove_firs_char + "_'  ", con);
                                            cmd1.ExecuteNonQuery();

                                            SqlCommand cmd444 = new SqlCommand("select max(testsession_id) from student_vs_testsession_details where student_id LIKE '" + user_remove_firs_char + "_'  ", con);
                      
                                            SqlDataReader dr444 = cmd444.ExecuteReader(); //UPDATE THE STATUS AS LOOGED IN FOR LARGEST SESSION ID
                                            while (dr444.Read())
                                            {
                                                string max_testid = dr444[0].ToString();
                                                SqlCommand cmd24 = new SqlCommand("update student_vs_testsession_details set  test_vs_student_status='" + Student_status + "' where student_id LIKE '" + user_remove_firs_char + "_' and testsession_id='"+max_testid+"' ", con);
                                                cmd24.ExecuteNonQuery();
                                            }
                                            

                                            SqlCommand cmd44 = new SqlCommand("select student_name,student_id from student_details where student_id  LIKE '" + user_remove_firs_char + "_' ", con);
                                            SqlDataReader dr44 = cmd44.ExecuteReader();
                                            while (dr44.Read())
                                            {
                                                string student_name = dr44[0].ToString();
                                                string student_id = dr44[1].ToString();
                                                var userDetails = new { status = "success", username = student_id, token = Token, studentname = student_name, is_test_archived=is_test_archived };
                                                string json = new JavaScriptSerializer().Serialize(userDetails);
                                                Response.ContentType = "application/json";
                                                Response.Write(json);
                                            }
                                       // }
                                    
                                }

                            }
                            else //not assigned for any test
                            {
                                var userDetails = new { status = "Not assigned for any test" };
                                string json = new JavaScriptSerializer().Serialize(userDetails);
                                Response.ContentType = "application/json";
                                Response.Write(json);

                            }
                        }

                        else
                        {

                            var userDetails = new { status = "ZTserver: " + studentExists + loginOK };
                            string json = new JavaScriptSerializer().Serialize(userDetails);
                            Response.ContentType = "application/json";
                            Response.Write(json);
                        }
                    }


                    else
                    {
                        var userDetails = new { status = "authorisation failed" };
                        string json = new JavaScriptSerializer().Serialize(userDetails);
                        Response.ContentType = "application/json";
                        Response.Write(json);
                    }

                    con.Close();

                }
                break;

            case "get_pdf":
                {
                    SqlConnection con600 = obj.getcon();
                    con600.Open();
                    string status_student_id = nvc["username"];
                    string status_token = nvc["token"];
                    string max_testsession_id;

                    SqlCommand cmd2 = new SqlCommand("select student_id from student_details where student_id = '" + status_student_id + "' and token='" + status_token + "'  ", con600);
                    SqlDataReader dr2 = cmd2.ExecuteReader();
                    if (dr2.HasRows == true)  //student exist with valid token
                    {
                        //Fetching latest testsession id of that student
                        SqlCommand cmd600 = new SqlCommand("select MAX(testsession_id) from student_vs_testsession_details where student_id  = '" + status_student_id + "'   GROUP BY student_id", con600);
                        SqlDataReader dr600 = cmd600.ExecuteReader();

                        if (dr600.HasRows)
                        {
                            while (dr600.Read())
                            {
                                max_testsession_id = dr600[0].ToString();

                                //for getting testsession date
                                SqlCommand cmd18 = new SqlCommand("select test_date from testsession_details where testsession_id='" + max_testsession_id + "' ", con600);
                                SqlDataReader dr18 = cmd18.ExecuteReader();
                                dr18.Read();
                                t_date = dr18[0].ToString();
                                year = t_date.Split('-')[2];

                                //checking if certificate is generated
                                SqlCommand cmd601 = new SqlCommand("select * from student_vs_testsession_details where student_id  = '" + status_student_id + "'  and certificates in('Yes','Mailed') and testsession_id='" + max_testsession_id + "' ", con600);
                                SqlDataReader dr601 = cmd601.ExecuteReader();
                                if (dr601.HasRows) //if certificate is generated
                                {

                                    string s_certificate = status_student_id + "Certificate.pdf";
                                   // string original_path = Server.MapPath("~/results/" + year + "/certificates/" + status_student_id + "");
                                    // cert_path = Global.ZT_pdf_path_to_ipad_first_part + year + "/certificates/" + status_student_id + "/" + s_certificate + "";//Local SERVER

                                    cert_path = RootFolderName + "/"+year+"/certificates/"+status_student_id+"/"+ s_certificate;

                                    if (cert_path != string.Empty)
                                    {
                                        WebClient User = new WebClient();
                                        Byte[] FileBuffer = User.DownloadData(cert_path);
                                        if (FileBuffer != null)
                                        {
                                        
                                            Response.Clear();
                                            Response.ClearHeaders();
                                            Response.ContentType = "application/pdf";
                                            Response.AddHeader("Content-Disposition", "attachment; filename=10117873GCertificate.pdf");
                                            Response.AddHeader("Content-Length", FileBuffer.Length.ToString());
                                            Response.OutputStream.Write(FileBuffer, 0, FileBuffer.Length);
                                            Response.Flush();
                                            Response.End();

                                        }
                                    }
                                }
                            }

                        }
                    }
                    else  //student does not exist with valid token
                    {
                        var userDetails = new { status = "authorisation failed" };
                        string json = new JavaScriptSerializer().Serialize(userDetails);
                        Response.ContentType = "application/json";
                        Response.Write(json);
                    }
                    con600.Close();
                }
                break;
            case "get_student_score_status":
                {
                  
                    SqlConnection con600 = obj.getcon();
                    con600.Open();
                    string  status_student_id = nvc["username"]; 
                    string  status_token = nvc["token"];
                    string max_testsession_id;

                    SqlCommand cmd2 = new SqlCommand("select student_id from student_details where student_id = '" +status_student_id+ "' and token='" + status_token + "'  ", con600);
                    SqlDataReader dr2 = cmd2.ExecuteReader();
                    if (dr2.HasRows == true)  //student exist with valid token
                    {
                        //Fetching latest testsession id of that student
                        SqlCommand cmd600 = new SqlCommand("select MAX(testsession_id) from student_vs_testsession_details where student_id  = '" + status_student_id + "'   GROUP BY student_id", con600);
                        SqlDataReader dr600 = cmd600.ExecuteReader();

                        if (dr600.HasRows)
                        {
                            while (dr600.Read())
                            {
                                max_testsession_id = dr600[0].ToString();

                                //for getting testsession date
                                SqlCommand cmd18 = new SqlCommand("select test_date from testsession_details where testsession_id='" + max_testsession_id + "' ", con600);
                                SqlDataReader dr18 = cmd18.ExecuteReader();
                                dr18.Read();
                                t_date = dr18[0].ToString();
                                year = t_date.Split('-')[2];

                                //checking if certificate is generated
                                SqlCommand cmd601 = new SqlCommand("select * from student_vs_testsession_details where student_id  = '" + status_student_id + "'  and certificates in('Yes','Mailed') and testsession_id='" + max_testsession_id + "' ", con600);
                                SqlDataReader dr601 = cmd601.ExecuteReader();
                                if (dr601.HasRows) //if certificate is generated then mobile app will call get_pdf
                                {
                                                               
                                    var userDetails = new { status = "generated" };
                                    string json = new JavaScriptSerializer().Serialize(userDetails);
                                    Response.ContentType = "application/json";
                                    Response.Write(json);

                                }
                                else  //certificate is not generated
                                {
                                    /*To get Theory Status-- Shows if student passed/Failed */


                                     SqlCommand cmd_theory_check= new SqlCommand("select theory from student_vs_testsession_details where student_id  = '" + status_student_id + "'  and testsession_id='" + max_testsession_id + "'", con600);
                                     SqlDataReader dr_theory_check = cmd_theory_check.ExecuteReader();
                                     while (dr_theory_check.Read())
                                    {
                                        if (dr_theory_check[0].ToString() == "1")//theory==1 if that student is assigned for theory test.other wise it will be zero.
                                        {


                                            SqlCommand cmd88 = new SqlCommand("select score   from  student_vs_testsession_details  where student_id  = '" + status_student_id + "'  and testsession_id='" + max_testsession_id + "'   ", con600);
                                            SqlDataReader dr88 = cmd88.ExecuteReader();
                                            if (dr88.HasRows)
                                            {
                                                while (dr88.Read())
                                                {
                                                    string score_detail = dr88[0].ToString();
                                                    int comma = score_detail.IndexOf(',');
                                                    string last_score = score_detail;
                                                    if (string.IsNullOrEmpty(last_score) == false)
                                                    {
                                                        if (comma != -1)
                                                        {
                                                            string[] tokens = score_detail.Split(',');
                                                            last_score = tokens[tokens.Length - 1];
                                                        }

                                                        if (Convert.ToInt32(last_score) >= 24)  //PASSED
                                                        {
                                                            theory_status = "Passed";
                                                        }

                                                        else if (Convert.ToInt32(last_score) < 24)//FAILED
                                                        {
                                                            theory_status = "Failed";
                                                        }

                                                    }
                                                    else   //NOT STARTED __ SCore is empty
                                                    {
                                                        theory_status = "Not Taken";
                                                    }

                                                }
                                            }
                                        }
                                        else//not assigned for theory test
                                        {
                                            //theory_status = "Not assigned";
                                            theory_status = " ";
                                        }
                                    }
                                   
                                    /*To get practical status*/

                                    SqlCommand cmd = new SqlCommand("select practical from student_vs_testsession_details where student_id  = '" + status_student_id + "'  and testsession_id='" + max_testsession_id + "'", con600);
                                    SqlDataReader dr = cmd.ExecuteReader();
                                    while (dr.Read())
                                    {
                                        if (dr[0].ToString() == "1")//practical==1 if that student is assigned for practical test.other wise it will be zero.
                                        {

                                            SqlCommand cmd106 = new SqlCommand("select practical_status,module_num,attempt from practicaltest_summary where student_id  = '" + status_student_id + "'  and testsession_id='" + max_testsession_id + "' ", con600);
                                            SqlDataReader dr106 = cmd106.ExecuteReader();
                                            if (dr106.HasRows)
                                            {
                                              //Passed , Failed, Referred
                                                string module1 = "module1";
                                                string module2 = "module2";
                                                string module3 = "module3";
                                                string module4 = "module4";
                                                string module5 = "module5";
                                                module1_status = get_each_module_status(module1, status_student_id, max_testsession_id);
                                                module2_status = get_each_module_status(module2, status_student_id, max_testsession_id);
                                                module3_status = get_each_module_status(module3, status_student_id, max_testsession_id);
                                                module4_status = get_each_module_status(module4, status_student_id, max_testsession_id);
                                                module5_status = get_each_module_status(module5, status_student_id, max_testsession_id);
                                            }                                             
                                           
                                            else  ///not started
                                            {
                                                module1_status = "Not Taken";
                                                module2_status = "Not Taken";
                                                module3_status = "Not Taken";
                                                module4_status = "Not Taken";
                                                module5_status = "Not Taken";
                                            }

                                        }

                                        else //not assigned for practical test
                                        {                                           
                                           
                                            module1_status = " ";
                                            module2_status = " ";
                                            module3_status = " ";
                                            module4_status = " ";
                                            module5_status = " ";
                                        }

                                    }
                                    //for getting student_name,nric
                                    SqlCommand cmd_nric = new SqlCommand("select student_nric,student_name from  student_details where student_id='" + status_student_id+ "' ", con600);
                                    SqlDataReader dr_nric = cmd_nric.ExecuteReader();
                                    dr_nric.Read();
                                    student_nric= dr_nric[0].ToString();
                                    student_name=dr_nric[1].ToString();

                                    var userDetails = new {status="not_generated",student_name=student_name,student_nric=student_nric,test_date=t_date, theory_status = theory_status, module1_status = module1_status, module2_status = module2_status, module3_status = module3_status, module4_status = module4_status, module5_status = module5_status };
                                    string json = new JavaScriptSerializer().Serialize(userDetails);
                                    Response.ContentType = "application/json";
                                    Response.Write(json);

                            } // end of certificate not generated
                        }

                    }
                }
                    else  //student does not exist with valid token
                    {
                        var userDetails = new { status = "authorisation failed" };
                        string json = new JavaScriptSerializer().Serialize(userDetails);
                        Response.ContentType = "application/json";
                        Response.Write(json);
                    }
                    con600.Close();
                }
                break;

            case "testactivation":
                {
                    string t_studentid;
                    t_activation_code = nvc["activation_code"];
                    string t_token = nvc["token"];
                    t_studentid = nvc["username"];

                    string Student_status2 = "In Progress";
                    string Student_status_passed = "Passed";
                    SqlConnection con1 = obj.getcon();
                    con1.Open();

                    SqlCommand cmd2 = new SqlCommand("select student_id from student_details where student_id = '" + t_studentid + "' and token='" + t_token + "'  ", con1);
                    SqlDataReader dr2 = cmd2.ExecuteReader();
                    if (dr2.HasRows == true)
                    {

                        SqlCommand cmd3 = new SqlCommand("select d.student_id  ,v.testsession_id ,d.test_vs_student_status,d.score from student_vs_testsession_details d join  testsession_details v on  v.testsession_id=d.testsession_id  where  v.active_testsession_code='" + t_activation_code + "' and d.student_id= '" + t_studentid + "' and d.theory='1' ", con1);
                        SqlDataReader dr3 = cmd3.ExecuteReader();

                        if (dr3.HasRows == true) // if success
                        {
                            while (dr3.Read())
                            {
                                test_id = dr3[1].ToString();

                                string score_detail = dr3[3].ToString();
                                int comma = score_detail.IndexOf(',');
                                string last_score = score_detail;
                                if (comma != -1)
                                {
                                    string[] tokens = score_detail.Split(',');
                                    last_score = tokens[tokens.Length - 1];

                                }
                                if (score_detail == "")//just started the test first time
                                {

                                    var userDetails = new { status = "activation_code_success", testsession_id = test_id };
                                    string json = new JavaScriptSerializer().Serialize(userDetails);
                                    Response.ContentType = "application/json";
                                    Response.Write(json);

                                    SqlCommand cmd25 = new SqlCommand("update student_vs_testsession_details set  test_vs_student_status='" + Student_status2 + "' where testsession_id='" + test_id + "' and student_id = '" + t_studentid + "' ", con1);
                                    cmd25.ExecuteNonQuery();
                                }
                                else
                                {
                                    if (Convert.ToInt32(last_score) >= 24)//if already attended and passed
                                    {
                                        var userDetails = new { status = "Exam already attended" };
                                        string json = new JavaScriptSerializer().Serialize(userDetails);
                                        Response.ContentType = "application/json";
                                        Response.Write(json);
                                        SqlCommand cmd56 = new SqlCommand("update student_vs_testsession_details set  test_vs_student_status='" + Student_status_passed + "' where testsession_id='" + test_id + "' and student_id = '" + t_studentid + "' ", con1);
                                        cmd56.ExecuteNonQuery();
                                    }
                                    else if (Convert.ToInt32(last_score) < 24) //if failed
                                    {

                                        var userDetails = new { status = "Failed_student Activation_code_success", testsession_id = test_id };
                                        string json = new JavaScriptSerializer().Serialize(userDetails);
                                        Response.ContentType = "application/json";
                                        Response.Write(json);

                                        SqlCommand cmd26 = new SqlCommand("update student_vs_testsession_details set  test_vs_student_status='" + Student_status2 + "' where testsession_id='" + test_id + "' and student_id = '" + t_studentid + "' ", con1);
                                        cmd26.ExecuteNonQuery();

                                    }

                                }
                            }
                        }
                        else
                        {
                            var userDetails = new { status = "activation_code_failure" };
                            string json = new JavaScriptSerializer().Serialize(userDetails);
                            Response.ContentType = "application/json";
                            Response.Write(json);
                        }
                    }

                    else
                    {
                        var userDetails = new { status = "authorisation failed" };
                        string json = new JavaScriptSerializer().Serialize(userDetails);
                        Response.ContentType = "application/json";
                        Response.Write(json);
                    }
                    con1.Close();

                    break;
                }


            case "questions":
                {
                    string q_token = nvc["token"];
                    string q_studentid = nvc["username"];
                    string q_activation_code = nvc["activation_code"];
                    string q_test_id = nvc["testsessionid"];

                    SqlConnection con5 = obj.getcon();
                    con5.Open();
                    SqlCommand cmd6 = new SqlCommand("select student_id from student_details where student_id = '" + q_studentid + "' and token='" + q_token + "' ", con5);
                    SqlDataReader dr6 = cmd6.ExecuteReader();

                    if (dr6.HasRows == true)
                    {

                        SqlDataAdapter da = new SqlDataAdapter("select question_num,q_text,answer1_text,answer2_text,answer3_text,correct_answer,category from question_bank_details  where question_num  in (select  question_num  from activetest_code_vs_qnum  where active_testsession_code='" + q_activation_code + "')order by newid()", con5);
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        JavaScriptSerializer js = new JavaScriptSerializer();
                        var rows = dt.Rows.Cast<DataRow>().Select(row => new { q_num = row[0], question = row[1], answer1 = row[2], answer2 = row[3], answer3 = row[4], CorrectAnswer = row[5], }).ToArray();

                        string json = js.Serialize(rows);
                        Response.ContentType = "application/json";
                        Response.Write(json);

                    }
                    else
                    {
                        var userDetails = new { status = "authorisation failed" };
                        string json = new JavaScriptSerializer().Serialize(userDetails);
                        Response.ContentType = "application/json";
                        Response.Write(json);
                    }
                    con5.Close();

                    break;
                }
            case "stafflogin":
                {

                    SqlConnection con = obj.getcon();
                    string userName, passWord;

                    if ((!string.IsNullOrEmpty(nvc["Staffid"])) && (!string.IsNullOrEmpty(nvc["Password"])))
                    {
                        userName = nvc["Staffid"]; //ALLOWS MANY VALUES FOR ONE KEY.
                        passWord = nvc["Password"];

                        con.Open();
                        SqlCommand cmd = new SqlCommand("select staff_id from staff_details where staff_id='" + userName + "' ", con);
                        SqlDataReader dr = cmd.ExecuteReader();


                        bool StaffSuccessfullyLoggedIn = false;
                        if (dr.HasRows)
                        {
                     //  bool StaffPassword_valid = obj.ZTpasswordCheck(userName, passWord);
                         bool StaffPassword_valid = obj.NPpasswordCheck(userName, passWord);
                            if (StaffPassword_valid)
                            {
                                StaffSuccessfullyLoggedIn = true;
                            }

                        }
                        if (StaffSuccessfullyLoggedIn)
                        {
                            var userDetails = new { status = "success" };
                            string json = new JavaScriptSerializer().Serialize(userDetails);
                            Response.ContentType = "application/json";
                            Response.Write(json);
                        }
                        else
                        {
                            var userDetails = new { status = "failed" };
                            string json = new JavaScriptSerializer().Serialize(userDetails);
                            Response.ContentType = "application/json";
                            Response.Write(json);
                        }
                    }


                    else
                    {
                        var userDetails = new { status = "authorisation failed" };
                        string json = new JavaScriptSerializer().Serialize(userDetails);
                        Response.ContentType = "application/json";
                        Response.Write(json);
                    }

                    con.Close();
                    break;
                }
            case "submit":
                {
                    string s_token = nvc["token"];
                    string s_studentid = nvc["username"];
                    string s_testsession_id = nvc["testsession_id"];
                    string s_score = nvc["score"];
                    string s_result = nvc["ans"];

                    SqlConnection con7 = obj.getcon();
                    con7.Open();
                    SqlCommand cmd8 = new SqlCommand("select student_id from student_details where student_id LIKE '" + s_studentid + "' and token='" + s_token + "' ", con7);
                    SqlDataReader dr8 = cmd8.ExecuteReader();

                    if (dr8.HasRows)
                    {
                        SqlCommand cmd88 = new SqlCommand("select score,answer from student_vs_testsession_details  where student_id ='" + s_studentid + "' and testsession_id='" + s_testsession_id + "' ", con7);
                        SqlDataReader dr88 = cmd88.ExecuteReader();
                        if (dr88.HasRows)
                        {
                            dr88.Read();
                            string text = "----------------------------------------------------------------\r\n----------------------------------------------------------------\n";
                            string submittime = "Submitted at:" + DateTime.Now.ToString() + System.Environment.NewLine;
                            string score_db = dr88[0].ToString();
                            ans_db = dr88[1].ToString();
                            if (score_db != "")
                            {

                                string final_result = submittime + s_result + text;
                                using (SqlCommand cmd71 = con7.CreateCommand())
                                {

                                    cmd71.CommandText = "update student_vs_testsession_details set   score='" + score_db + "'+','+'" + s_score + "' , answer= @answer where testsession_id='" + s_testsession_id + "' and student_id ='" + s_studentid + "' ";
                                    cmd71.Parameters.Add("@answer", SqlDbType.NVarChar).Value = final_result + ans_db;
                                    cmd71.ExecuteNonQuery();
                                }
                            }

                            else
                            {
                                string initial_result = submittime + s_result;
                                SqlCommand cmd71 = new SqlCommand("update student_vs_testsession_details set score='" + s_score + "' , answer='" + initial_result + "' where testsession_id='" + s_testsession_id + "' and student_id ='" + s_studentid + "' ", con7);
                                cmd71.ExecuteNonQuery();

                            }
                        }


                        var userDetails = new { status = "SCORE SUBMITTED SUCCESSFULLY!!" };
                        string json = new JavaScriptSerializer().Serialize(userDetails);
                        Response.ContentType = "application/json";
                        Response.Write(json);

                        SqlCommand cmd13 = new SqlCommand("update student_details set token=NULL where student_id = '" + s_studentid + "' ", con7);
                        cmd13.ExecuteNonQuery();

                        if (Convert.ToInt32(s_score) >= 24)
                        {

                            string s_test_student_status = "Passed";
                            SqlCommand cmd11 = new SqlCommand("update student_vs_testsession_details set test_vs_student_status='" + s_test_student_status + "' where testsession_id='" + s_testsession_id + "' and student_id ='" + s_studentid + "' ", con7);
                            cmd11.ExecuteNonQuery();
                            obj.is_passed_both_test(s_studentid, s_testsession_id);//for to update the date of passing to student_details table


                        }
                        else
                        {
                            string s_test_student_statuss = "Failed";
                            SqlCommand cmd11 = new SqlCommand("update student_vs_testsession_details set  test_vs_student_status='" + s_test_student_statuss + "' where testsession_id='" + s_testsession_id + "' and student_id ='" + s_studentid + "' ", con7);
                            cmd11.ExecuteNonQuery();
                        }

                    }
                    else
                    {
                        var userDetails = new { status = "authorisation failed" };
                        string json = new JavaScriptSerializer().Serialize(userDetails);
                        Response.ContentType = "application/json";
                        Response.Write(json);
                    }
                    con7.Close();


                }

                break;
        }

    }

    private string get_each_module_status(string module_num,string module_student_id,string module_test_session_id)
    {
        SqlConnection con_module = obj.getcon();
        con_module.Open();
        //string module_status = " ";
        string module_status = "Not Taken";
        SqlCommand cmdat1 = new SqlCommand("Select max(attempt) from  practicaltest_summary where student_id  = '" + module_student_id + "'  and testsession_id='" + module_test_session_id + "'  and module_num='" + module_num + "'", con_module);
        SqlDataReader drat1 = cmdat1.ExecuteReader(); //there is a chance for inserting saved row after submitting the last attempt (attempt 3) . So first need to check if we submitted the last atempt..then need to display the submitted status .thats why checking max(attempt)
        if (drat1.HasRows)
        {
            while (drat1.Read())
            {
                if (drat1[0].ToString() == "3") //attempted 3 chances
                {
                    SqlCommand cmd69 = new SqlCommand("Select practical_status from  practicaltest_summary where student_id  = '" + module_student_id + "'  and testsession_id='" + module_test_session_id + "'  and module_num='" + module_num + "' ", con_module);
                    SqlDataReader dr69 = cmd69.ExecuteReader();
                    if (dr69.HasRows)
                    {
                        while (dr69.Read())
                        {

                            module_status = dr69[0].ToString();


                        }
                    }

                }
                else
                {

                    SqlCommand cmd66 = new SqlCommand("select min(attempt) from practicaltest_summary  where student_id  = '" + module_student_id + "'  and testsession_id='" + module_test_session_id + "'  and module_num='" + module_num + "'", con_module);
                    SqlDataReader dr66 = cmd66.ExecuteReader();
                    while (dr66.Read())
                    {
                        if (dr66[0].ToString() != "0")
                        {
                            SqlCommand cmd69 = new SqlCommand("Select practical_status from  practicaltest_summary where student_id  = '" + module_student_id + "'  and testsession_id='" + module_test_session_id + "'  and module_num='" + module_num + "' and attempt= (select max(attempt) from practicaltest_summary where student_id  = '" + module_student_id + "'  and  testsession_id='" + module_test_session_id + "'  and module_num='" + module_num + "') ", con_module);
                            SqlDataReader dr69 = cmd69.ExecuteReader();
                            if (dr69.HasRows)
                            {
                                while (dr69.Read())
                                {
                                    module_status = dr69[0].ToString(); //Passed,Failed
                                }
                            }

                        }
                        else //saved 
                        {
                            module_status = "In-Progress";

                        }
                    }
                }
            }
            con_module.Close();
        }
        else
        {

          //  module_status = "Not Taken";
            module_status = " ";
        }

        return module_status;
    }



}












