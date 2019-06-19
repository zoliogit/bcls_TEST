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

public partial class NSL_MasterPage : System.Web.UI.MasterPage
{
    string login_staff_ID;
    string st_role;
    string selected_version;
    protected void Page_Load(object sender, EventArgs e)
    {
       compare_cookie_ForSecurity();

                     //IMAGE BUTTONS
        bt_details.ImageUrl = "images/BtnStaffDetails.png";       
        Button3.ImageUrl = "images/BtnLogout.png";
        bt_group.ImageUrl = "images/groupsBtn.png";
        bt_all_groups.ImageUrl = "images/BtnAllGroup.png";
        bt_sim1.ImageUrl = "images/sim1Btn.png";
        Button2.ImageUrl = "images/sim2Btn.png";
       Button4.ImageUrl = "images/sim3Btn.png";
       Button5.ImageUrl = "images/mgcBtn.png";
       bt_student_upload.ImageUrl = "images/uploadBtn.png";

    //  Button4.Enabled = false;
    // Button5.Enabled = false;



        string name = ((string)Session["staffname"]).ToUpper(); //TO GET THE WELCOME MESSAGE
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
       

        if (st_role == "NSL Module Leader")
        {
     
            bt_details.Visible = true; //STAFF

          
        }
        else if (st_role == "NSL Lecturer")
        {

            bt_details.Visible = false; //STAFF
            bt_all_groups.Visible = false;
            bt_student_upload.Visible = false;
          
           // bt_practical_group.Visible = false;
        }

        selected_version = (string)Session["selected_version"];//1 =CPRact ;2= version 2.1 ; 3=version 2.2,4=version 3.1
      if (selected_version == "4")//means v3.1
        {
          Label3.Text = "SIMPract V3.1";
            bt_sim1.ImageUrl = "images/acsBtn.png";
            Button2.ImageUrl = "images/btBtn.png";
            Button4.ImageUrl = "images/tcBtn.png";
            Version3.Visible = true;
         /*   Lbl1.Text = "ACS - Acute Coronary Syndrome";
            Lbl2.Text = "BT - Blood Transfusion";
            Lbl3.Text = "TC - Tracheostomy Care";
            Lbl4.Text = "MGC - Megacode";*/
        }
      else if (selected_version == "2")  //means v2.1
      {
          Button5.Visible= false;//mgc
          Button2.Visible= true;//SIM2//checklists are created but no need to display now
          Button4.Visible = false;//SIM3//checklists are created but no need to display now
          Label3.Text = "SIMPract V2.1";
      }
      else if (selected_version == "3")  //means v2.2
      {

          Button4.Visible = false;//not given now 
          Button5.Visible = false;//mgc
          Label3.Text = "SIMPract V2.2";
      }
        else if (selected_version == "5")  //means v1.1
        {
            bt_sim1.ImageUrl = "images/consolidation1.png";
            Button2.Visible = false;//not given now 
            Button4.Visible = false;//not given now 
            Button5.Visible = false;//mgc
            Label3.Text = "SIMPract V1.1";
        }

    }
    public void compare_cookie_ForSecurity()
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


    }


    protected void bt_staff_details_Click(object sender, ImageClickEventArgs e)
    {
        if (selected_version == "4")
        {
            Response.Redirect("NSL_StaffDetails.aspx");
   
        }
        else if (selected_version == "2")
        {
            Response.Redirect("NSL_StaffDetails_V2_1.aspx");
   
        }
        else if (selected_version == "3")
        {
            Response.Redirect("NSL_StaffDetails_V2_2.aspx");

        }
        else if (selected_version == "5")
        {
            Response.Redirect("NSL_StaffDetails_V1_1.aspx");

        }

    }
  
    protected void Button3_Click(object sender, ImageClickEventArgs e)
    {
        
        Session.Abandon();
        // in case a attacker has forced a cookie with a future expiration date, expire that cookie as well
        Response.Cookies["ASP.NET_SessionId"].Expires = DateTime.Now.AddYears(-30);
      //  clears the session state from the server and sets the session state cookie to null.The null value effectively clears the cookie from the browser. 
        Response.Cookies.Add(new HttpCookie("ASP.NET_SessionId", ""));
        Response.Redirect("Login.aspx");
    }


    protected void bt_group_Click(object sender, ImageClickEventArgs e)
    {
       if(selected_version=="4")
       {
           Response.Redirect("NSL_Group.aspx");
       }
       else if(selected_version=="2")
       {
           Response.Redirect("NSL_Group_v2_1.aspx");
       }
       else if (selected_version == "3")
       {
           Response.Redirect("NSL_Group_v2_2.aspx");
        }
        else if (selected_version == "5")
        {
            Response.Redirect("NSL_Group_v1_1.aspx");
        }

    }
    protected void bt_sim1_Click(object sender, ImageClickEventArgs e)
    {
        Session["clicked_simulation_type"] = "sim1";

        if (selected_version == "4")
        {
            Response.Redirect("NSL_Simulation.aspx");
        }
        else if (selected_version == "2")
        {
            Response.Redirect("NSL_Simulation_v2_1.aspx");
        }
        else if (selected_version == "3")
        {
            Response.Redirect("NSL_Simulation_v2_2.aspx");
        }
        else if (selected_version == "5")
        {
            Response.Redirect("NSL_Simulation_v1_1.aspx");
        }

    }
    protected void bt_sim2_Click(object sender, ImageClickEventArgs e)
    {
        Session["clicked_simulation_type"] = "sim2";
        if (selected_version == "4")
        {
            Response.Redirect("NSL_Simulation.aspx");
        }
        else if (selected_version == "2")
        {
            Response.Redirect("NSL_Simulation_v2_1.aspx");
        }
        else if (selected_version == "3")
        {
            Response.Redirect("NSL_Simulation_v2_2.aspx");
        }
    }
    protected void bt_sim3_Click(object sender, ImageClickEventArgs e)
    {
        Session["clicked_simulation_type"] = "sim3";
        if (selected_version == "4")
        {
            Response.Redirect("NSL_Simulation.aspx");
        }
        else if (selected_version == "2")
        {
            Response.Redirect("NSL_Simulation_v2_1.aspx");
        }
   
    }
    protected void bt_mgc_Click(object sender, ImageClickEventArgs e)
    {
        Session["clicked_simulation_type"] = "mgc";
        if (selected_version == "4")//v3.1
        {
            Response.Redirect("NSL_Simulation.aspx");
        }
       
   
    }

    protected void bt_all_groups_Click(object sender, ImageClickEventArgs e)
    {
        if (selected_version == "4")
        {
            Response.Redirect("NSL_All_Groups.aspx");
        }
        else if (selected_version == "2")
        {
            Response.Redirect("NSL_All_Groups_v2_1.aspx");
        }
        else if (selected_version == "3")
        {
            Response.Redirect("NSL_All_Groups_v2_2.aspx");
        }
        else if (selected_version == "5")
        {
            Response.Redirect("NSL_All_Groups_v1_1.aspx");
        }

    }
 
    protected void bt_student_upload_Click(object sender, EventArgs e)
    {
        Response.Redirect("NSL_student_upload.aspx");
    }
}
