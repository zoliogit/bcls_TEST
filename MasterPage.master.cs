using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;

public partial class MasterPage : System.Web.UI.MasterPage
{

    string login_staff_ID;
    string st_role;
    string name;
    protected void Page_Load(object sender, EventArgs e)
    {
   
        compare_cookie_ForSecurity();

        bt_attendance.ImageUrl = "images/BtnWorkbench.png";                 //IMAGE BUTTONS
        bt_createtest.ImageUrl = "images/BtnCreateSession.png";
        bt_details.ImageUrl = "images/BtnStaffDetails.png";
        bt_pasttest.ImageUrl = "images/BtnPastSessions.png";
        bt_questionbank.ImageUrl = "images/BtnQuestionBank.png";
        bt_session_details.ImageUrl = "images/BtnSessionDetails.png";
        Button3.ImageUrl = "images/BtnLogout.png";
        bt_task_to_do.ImageUrl = "images/BtnWorkbench.png";

 
        name = ((string)Session["staffname"]).ToUpper(); //TO GET THE WELCOME MESSAGE
        lb_welcome.Text = "Welcome " + name + "!";


        if (Session["id"] == null)
            Response.Redirect("Login.aspx");

        st_role = (string)Session["staffrole"];
        string login_staff_id = (string)Session["staffid"];
        login_staff_ID = (string)Session["staffname"];

        String logintime = (string)Session["lasttime"];
        lb_logintime.Text = logintime;


        // Code disables caching by browser.
        Response.Cache.SetCacheability(HttpCacheability.NoCache);// this tells the client not to cache responses in the History folder, so that when you use the back/forward buttons the client requests a new version of the response each time.
        Response.Cache.SetExpires(DateTime.UtcNow.AddHours(-1));
        Response.Cache.SetNoStore();
       



        if (st_role == "Instructor" || st_role=="Guest")
        {
            bt_attendance.Visible = false;
            bt_createtest.Visible = false;
            bt_details.Visible = false;
            bt_pasttest.Visible = false;
            bt_questionbank.Visible = false;
        }
        else if (st_role == "Chief Instructor")
        {
            bt_task_to_do.Visible = true;
            bt_attendance.Visible = false;
            bt_details.Visible = false;
            bt_pasttest.Visible = false;
            bt_questionbank.Visible = false;

        }



    }
    public void compare_cookie_ForSecurity()
    {
        if (HttpContext.Current.Request.Cookies["CPRactCookieCheck"] != null) //if cookie exists //if (HttpContext.Current.Request.Cookies["CPRactCookieCheck"] != null) //if cookie exists
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
    protected void bt_reports_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Report.aspx");
    }
    protected void bt_session_details_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Active_testsessiondetails.aspx");
    }
    protected void bt_tasks_to_do_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("follow_up.aspx");
    }
    protected void Button3_Click(object sender, ImageClickEventArgs e)
    {
        Session.Abandon();
        // in case a attacker has forced a cookie with a future expiration date, expire that cookie as well
        Response.Cookies["ASP.NET_SessionId"].Expires = DateTime.Now.AddYears(-30);
        // clears the session state from the server and sets the session state cookie to null. The null value effectively clears the cookie from the browser. 
        Response.Cookies.Add(new HttpCookie("ASP.NET_SessionId", ""));
        Response.Redirect("Login.aspx");
    }


}
