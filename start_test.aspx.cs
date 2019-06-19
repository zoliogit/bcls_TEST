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

public partial class start_test : System.Web.UI.Page
{
    MainClass obj = new MainClass(); 
     bool has_q_in_activecode;
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
       
      
        var chars = "ABCDEFGHJKLMNPQRSTUVWXYZ23456789";
        var random = new Random();
        var activation_code = new string(
            Enumerable.Repeat(chars, 8)
                      .Select(s => s[random.Next(s.Length)])
                      .ToArray());
        Label1.Text = activation_code;

       string test_starttime= DateTime.Now.ToString();

       string sessionID=(string)Session["view_testid"];
           if (Session["view_testid"] == null)
        {
            Response.Redirect("Login.aspx");
        }
       
       Label5.Text = sessionID;

        SqlConnection con = obj.getcon();
        con.Open();
       

          SqlCommand cmd39 = new SqlCommand("delete activetest_code_vs_qnum where testsession_id='" +sessionID + "' ", con);
          cmd39.ExecuteNonQuery();
          SqlCommand cmd = new SqlCommand("update testsession_details set active_testsession_code='" + activation_code+ "',active_testsession_time='" + test_starttime + "' where testsession_id='" + sessionID + "' ", con);
          cmd.ExecuteNonQuery();

        SqlCommand cmd35 = new SqlCommand("select question_num from question_bank_details  where question_num  in (select top 10 question_num  from question_bank_details where category=5 order by newid()) or  question_num  in (select top 2 question_num  from question_bank_details where category =0 order by newid())  or  question_num  in (select top 5 question_num  from question_bank_details where category =1 order by newid()) or  question_num  in (select top 5 question_num  from question_bank_details where category =2 order by newid()) or  question_num  in (select top 3 question_num  from question_bank_details where category =3 order by newid()) or  question_num  in (select top 2 question_num  from question_bank_details where category =4 order by newid()) or  question_num  in (select top 3 question_num  from question_bank_details where category =6 order by newid()) order by newid()", con);

        //SqlCommand cmd35 = new SqlCommand("select question_num from question_bank_details  where question_num  in (select top 10 question_num  from question_bank_details where category=5 order by newid()) or  question_num  in (select top 5 question_num  from question_bank_details where category =0 order by newid())  or  question_num  in (select top 5 question_num  from question_bank_details where category =1 order by newid()) or  question_num  in (select top 5 question_num  from question_bank_details where category =2 order by newid()) or  question_num  in (select top 3 question_num  from question_bank_details where category =3 order by newid()) or  question_num  in (select top 2 question_num  from question_bank_details where category =4 order by newid()) order by newid()", con);
             SqlDataReader dr35 = cmd35.ExecuteReader();
              while (dr35.Read())
              { 
                  string question_no = dr35[0].ToString();                             
                  SqlCommand cmd36 = new SqlCommand("insert activetest_code_vs_qnum (testsession_id,question_num,active_testsession_code) values ('" + sessionID + "','" + question_no + "','" + activation_code + "')", con);
                  int val = cmd36.ExecuteNonQuery();
              
              }
  
        con.Close();
      


    }
    
  
}
