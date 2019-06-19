using System;
using System.Data;
using System.Configuration;
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
using System.Collections;
using System.DirectoryServices.Protocols;
using System.DirectoryServices;
using System.Diagnostics;
using System.DirectoryServices.ActiveDirectory;
using System.Net;
using System.Net.Mail;
using System.Web.Script;
using System.Web.Script.Serialization;
//using NP.NPConnetion;
//using NPSecurity;
using NP;
public class MainClass
{
    string scheduled_date;
    public  SqlConnection getcon()
    {
        //string strcon = ConfigurationManager.ConnectionStrings["bclstestConnectionString"].ConnectionString.Trim();
        // SqlConnection con = new SqlConnection(strcon);

        //string strConnect = NP.NPConnection.decrypt(strcon);
        //    NPConnection obj_np = new NPConnection();
        // string strConnect = NPConnection.decrypt(strcon);
        // SqlConnection con = new SqlConnection(strConnect);


        SqlConnection myConnection = new SqlConnection();
        string strCon = NPConnection.decrypt(ConfigurationManager.ConnectionStrings["bclstestConnectionString"].ConnectionString.Trim());
        myConnection.ConnectionString = strCon;

        return myConnection;
       
    }

    public bool NPpasswordCheck(string userName, string password)
    { 
        // DirectoryEntry entry = new DirectoryEntry(@"LDAP://npstd.npnet.np.edu.sg", userName, password);
        DirectoryEntry entry = new DirectoryEntry(@"LDAP://npnet.np.edu.sg", userName, password);
        try
        {
            object obj = entry.NativeObject;
            return true;
        }
        catch (Exception ex)
        {
            return false;

        }

    }

    public bool ZTpasswordCheck(string userName, string password)
    {

        if (password == "ABCD") //NP STAFF
        {
            return true;
        }
        else
        {
            return false;
        }

    }


    public string view_generated_certificate(string year,string st_id,string s_certificate)
    {
        // string path = "/bclstest/results/" + year + "/certificates/" + st_id + "/" + s_certificate + "";//LOCAL SERVER
        string RootFolderName = ConfigurationManager.AppSettings["BCLSResultsFolder"];//D:/Hosting/10676289/html/bclstest/results

        string path = RootFolderName+"/" + year + "/certificates/" + st_id + "/" + s_certificate + "";//NP SERVER
        return path;
    }
   
    public void send_mail(string st_id,string NPst_id,string student_name_cert,string year)
    {


   //string from = Global.ZT_from;  //Local
   // string to = Global.ZT_to;      //Local
  //  string cc = Global.ZT_cc;        //Local 


    string from = Global.NP_from;//server  ///NP server   
       string to = "S" + NPst_id + Global.NP_to_last_part;//NP server //s10152162@connect.np.edu.sg
     //  string cc = Global.NP_cc;//NP server 
        

        MailMessage mailMessage = new MailMessage(from, to);
        mailMessage.Subject = "BCLS Test Result";
        string myString = string.Empty;
        myString = "<html><body>" +
"<p><span style = \"font-family:Arial;font-size:10pt\">Dear [StudentName] </span> </p>" +
"<p><span style = \"font-family:Arial;font-size:10pt\">Congratulations for completing the BCLS training.  You have passed and I am pleased to attach your BCLS certificate in PDF format along with this email.  Please print it and keep it for your own records. </span> </p>" +
"<p><span style = \"font-family:Arial;font-size:10pt\">Wishing you all the best</span> </p>" +
"<span style = \"font-family:Arial;font-size:10pt\">Regards</span>" +
"<br /><br />" +
"<b><span style = \"font-family:Arial;font-size:10pt\">BCLS Course Director</span></b>" +
"</body></html>";
        myString = myString.Replace("[StudentName]", student_name_cert);

        mailMessage.Body = myString;
        // Add a carbon copy recipient.
       /* MailAddress copy = new MailAddress(cc);
        mailMessage.CC.Add(copy);
    */

        string s_certificate = st_id + "Certificate.pdf";
        string RootFolderName = ConfigurationManager.AppSettings["BCLSResultsFolder"];//D:/Hosting/10676289/html/bclstest/results

        //  string path = "bclstest/results/" + year + "/certificates/" + st_id + "/"; //EDUGAME LOCAL SERVER
        //string path = "results/" + year + "/certificates/" + st_id + "/"; //NP SERVER
        string path =RootFolderName+ "/" + year + "/certificates/" + st_id + "/"; //NP SERVER

        string url = path + s_certificate;

        SmtpClient ss;
        //Attachment at = new Attachment(System.Web.HttpContext.Current.Server.MapPath("~/" + url + ""));
       Attachment at = new Attachment(url);
        at.Name = s_certificate;
        mailMessage.Attachments.Add(at);
        mailMessage.IsBodyHtml = true;

 //  ss = new SmtpClient(Global.ZT_smtp_client, 25); //Local SERVER
    ss = new SmtpClient(Global.NP_smtp_client, 25);  //NP SERVER
        ss.Send(mailMessage);

        ss.UseDefaultCredentials = true;

    }

    public void is_passed_both_test(string s_studentid, string s_testid)
    {

        SqlConnection con12 = getcon();
        con12.Open();
        string result = "Passed";

        SqlCommand cmd2 = new SqlCommand("select count(result) from practicaltest_summary where student_id='" + s_studentid + "' and testsession_id='" + s_testid + "' and practical_status='" + result + "' ", con12);
        SqlDataReader dr2 = cmd2.ExecuteReader();
        while (dr2.Read())
        {
            if (Convert.ToInt32(dr2[0]) >= 5)//TOTAL OF 5 MODULES
            {

                SqlCommand cmd101 = new SqlCommand("select score   from  student_vs_testsession_details where student_id='" + s_studentid + "'  and testsession_id='" + s_testid + "'   ", con12);
                SqlDataReader dr101 = cmd101.ExecuteReader();
                if (dr101.HasRows)
                {
                    while (dr101.Read())
                    {
                        string score_detail = dr101[0].ToString();
                        int comma = score_detail.IndexOf(',');
                        string last_score = score_detail;
                        if (string.IsNullOrEmpty(last_score) == false)
                        {
                            if (comma != -1)
                            {
                                string[] tokens = score_detail.Split(',');
                                last_score = tokens[tokens.Length - 1];

                            }

                            if (Convert.ToInt32(last_score) >= 24)
                            {
                               //to get test date
                SqlCommand cmd500 = new SqlCommand("select 	test_date from  testsession_details  where testsession_id='" + s_testid + "'   ", con12);
                SqlDataReader dr500= cmd500.ExecuteReader();
                if (dr500.HasRows)
                {
                    while (dr500.Read())
                    {
                        scheduled_date=dr500[0].ToString();
                         
                    }
                }
               SqlCommand cmd111 = new SqlCommand("update student_details set date_of_pass= @scheduled_date where student_id=@s_studentid  ", con12);
                //cmd111.Parameters.AddWithValue("@scheduled_date",Convert.ToDateTime(scheduled_date));
             
               cmd111.Parameters.AddWithValue("@scheduled_date", DateTime.ParseExact(scheduled_date, "dd-MM-yyyy", null));
              
                cmd111.Parameters.AddWithValue("@s_studentid", s_studentid);
                                        
                                cmd111.ExecuteNonQuery();
                            }
                        }
                    }
                }


            }
        }
        con12.Close();
    }

}	
	
