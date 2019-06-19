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
using System.IO;
using System.Net;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.Text;
public partial class theorytest_results : System.Web.UI.Page
{
    MainClass obj = new MainClass();
    protected void Page_Load(object sender, EventArgs e)
    {


        if (HttpContext.Current.Request.Cookies["CPRactCookieCheck"] != null) //if cookie exists
        {


            HttpCookie ckValue = HttpContext.Current.Request.Cookies["CPRactCookieCheck"];
            string strCurSessionID = ckValue.Values["EVSS_ID"].ToString();//session.sessionID of login page           
            String strTRXID = ckValue.Values["TRXID"]; //guid value stored in session cookie Session["CPRactSessionCheck"]

            if (HttpContext.Current.Session["CPRactSessionCheck"].ToString().Trim() != strTRXID.Trim() &&
                 HttpContext.Current.Session.SessionID.ToString() == strCurSessionID.Trim())
            {
                HttpContext.Current.Session.Abandon();
                HttpContext.Current.Session.Clear();
                FormsAuthentication.SignOut();
                HttpContext.Current.Response.Redirect("Login.aspx");
            }

        }
        else //if cookie doesnt exist
        {
            HttpContext.Current.Session.Abandon();
            HttpContext.Current.Session.Clear();
            HttpContext.Current.Response.Redirect("Login.aspx");

        }

        // Code disables caching by browser.
        Response.Cache.SetCacheability(HttpCacheability.NoCache);// this tells the client not to cache responses in the History folder, so that when you use the back/forward buttons the client requests a new version of the response each time.
        Response.Cache.SetExpires(DateTime.UtcNow.AddHours(-1));
        Response.Cache.SetNoStore();
       



        if (Session["id"] == null)
            Response.Redirect("Login.aspx");

        string test_id = (string)Session["view_testid"];
        if (Session["view_testid"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        string student_ID = (string)Session["student_id"];
        SqlConnection con = obj.getcon();
        con.Open();
        SqlCommand cmd = new SqlCommand("Select answer from student_vs_testsession_details where student_id ='" + student_ID + "' and testsession_id='" + test_id + "'", con);
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {

            string answer = dr[0].ToString();
            byte[] newFileData = Encoding.ASCII.GetBytes(answer);

            string fileString = System.Text.Encoding.UTF8.GetString(newFileData);
            string[] score_details = fileString.Split(new string[] { "  ", "\n" }, StringSplitOptions.None);

            foreach (var line in score_details)
            {

                ListBox1.Items.Add(line);
            }
        }

        con.Close();

    }

}
