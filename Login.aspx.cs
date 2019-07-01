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
using System.Net;
using System.IO;
using System.DirectoryServices.Protocols;
using System.DirectoryServices;
using System.Diagnostics;
using System.DirectoryServices.ActiveDirectory;
using System.Text.RegularExpressions;
using System.Web.SessionState;
using System.Reflection;//BindingFlags
using System.Web.Configuration;
using System.Text;

public partial class Login : System.Web.UI.Page
{
    MainClass obj1 = new MainClass(); //object for DB connection

    string s_name;
    string s_role;
    string s_id;
    string password;
    protected void Page_Load(object sender, EventArgs e)
    {

        // Code disables caching by browser.
        Response.Cache.SetCacheability(HttpCacheability.NoCache);// this tells the client not to cache responses in the History folder, so that when you use the back/forward buttons the client requests a new version of the response each time.
        Response.Cache.SetExpires(DateTime.UtcNow.AddHours(-1));
        Response.Cache.SetNoStore();

        Session["id"] = null;
        bt_login.ImageUrl = "images/BtnLogin.png";

        tb_loginid.Attributes.Add("autocomplete", "off");
        tb_password.Attributes.Add("autocomplete", "off");

    }

    protected void bt_login_Click(object sender, ImageClickEventArgs e)
    {
        string userName = hdnfldusername.Value;
        password = hdnfldpassword.Value;
        //string userName = tb_loginid.Text;
        //password = tb_password.Text;
        //Regular expression for password And login id
        Match myMatch_loginid = System.Text.RegularExpressions.Regex.Match(userName, @"^[a-zA-Z0-9]{1,40}$");
        Match myMatch_password = System.Text.RegularExpressions.Regex.Match(password, @"^[a-zA-Z0-9!@#$%*]{1,40}$");
        if (!myMatch_loginid.Success || !myMatch_password.Success)//if username  was incorrect
        {

            lb_invalid.Visible = true;
            tb_password.Text = "";
            hdnfldpassword.Value = "";
            return;
        }



        if (dl_version.SelectedItem.Value == "1")//CPRAct
        {
            ValidateUser(userName, password);
        }
        else if (dl_version.SelectedItem.Value != "1")//SIMPRAct
        {
            ValidateUser_NSL(userName, password);
        }
    }
    private void ValidateUser(string userName, string password)
    {


        SqlConnection con = obj1.getcon();
        con.Open();

        SqlCommand cmd = new SqlCommand("select staff_id,staff_name,staff_role,NPstaff from staff_details where staff_id = @STAFF_id  ", con);
        cmd.Parameters.Add(new SqlParameter("STAFF_id", userName));
        SqlDataReader dr = cmd.ExecuteReader();
        // bool password_valid = NPpasswordCheck_BCLS(userName,password);//NP SERVER
        bool password_valid = ZTpasswordCheck_BCLS(userName, password);//LOCAL SERVER

        if (dr.HasRows && password_valid) //if username and password is correct
        {
            //  Session.Abandon();
            regenerateId();
            Guid guid_string_Id = System.Guid.NewGuid();
            string newID = guid_string_Id.ToString();
            Session["CPRactSessionCheck"] = newID;
            HttpCookie cookie = new HttpCookie("CPRactCookieCheck", newID);

            cookie.Values.Add("TRXID", (string)Session["CPRactSessionCheck"]);
            cookie.Values.Add("EVSS_ID", Session.SessionID);
            Response.Cookies.Add(cookie);
            //        Response.Cookies["CPRactCookieCheck"].Secure = true;//We can enable secure cookie to set true(HTTPs).


            dr.Read();
            s_id = dr[0].ToString();
            s_name = dr[1].ToString();
            s_role = dr[2].ToString();

            if (s_role == "Guest")
            {
                Session["id"] = 01;
            }
            else if (s_role == "Instructor")
            {
                Session["id"] = 11;
            }

            else if (s_role == "Chief Instructor")
            {
                Session["id"] = 21;
            }
            else if (s_role == "Director/Asst Director")//Director/Asst Director
            {

                Session["id"] = 31;
            }
            else//there is a chnace for enter the role through sql query and misspelled
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), Guid.NewGuid().ToString(), "alert('Role assignment unsuccessful, please contact techincal support');window.location='Login.aspx';", true);
                return;
            }

            System.Web.SessionState.SessionIDManager manager = new System.Web.SessionState.SessionIDManager();
            string oldId = manager.GetSessionID(Context);
            //        regenerateId();
            Session["staffname"] = s_name;
            Session["staffid"] = s_id;
            Session["staffrole"] = s_role;
            Session["staff_password"] = password;
            String last_interaction_time = DateTime.Now.ToString("dd/MM/yyyy HH:mm");//TO GET THE CURRENT LOGIN TIME
            Session["lasttime"] = last_interaction_time;
            if (s_role == "Chief Instructor")
            {
                Response.Redirect("follow_up.aspx");
            }
            else
            {
                Response.Redirect("Active_testsessiondetails.aspx");
            }

        }
        else
        {
            lb_invalid.Visible = true;
            tb_password.Text = "";
            hdnfldpassword.Value = "";
            // lb_invalid.Text =" Invalid userID or Password ! "+ " HasRows in DB: "+ dr.HasRows.ToString()+"  Valid LDAP: " + password_valid.ToString() ;
            lb_invalid.Text = " Invalid userID or Password ! ";

        }

        con.Close();
    }
    void regenerateId()
    {
        System.Web.SessionState.SessionIDManager manager = new System.Web.SessionState.SessionIDManager();
        string oldId = manager.GetSessionID(Context);
        string newId = manager.CreateSessionID(Context);
        bool isAdd = false, isRedir = false;
        manager.SaveSessionID(Context, newId, out isRedir, out isAdd);
        HttpApplication ctx = (HttpApplication)HttpContext.Current.ApplicationInstance;
        HttpModuleCollection mods = ctx.Modules;
        System.Web.SessionState.SessionStateModule ssm = (SessionStateModule)mods.Get("Session");
        System.Reflection.FieldInfo[] fields = ssm.GetType().GetFields(BindingFlags.NonPublic | BindingFlags.Instance);
        SessionStateStoreProviderBase store = null;
        System.Reflection.FieldInfo rqIdField = null, rqLockIdField = null, rqStateNotFoundField = null;
        foreach (System.Reflection.FieldInfo field in fields)
        {
            if (field.Name.Equals("_store")) store = (SessionStateStoreProviderBase)field.GetValue(ssm);
            if (field.Name.Equals("_rqId")) rqIdField = field;
            if (field.Name.Equals("_rqLockId")) rqLockIdField = field;
            if (field.Name.Equals("_rqSessionStateNotFound")) rqStateNotFoundField = field;
        }
        object lockId = rqLockIdField.GetValue(ssm);
        if ((lockId != null) && (oldId != null)) store.ReleaseItemExclusive(Context, oldId, lockId);
        rqStateNotFoundField.SetValue(ssm, true);
        rqIdField.SetValue(ssm, newId);
    }

    private bool NPpasswordCheck_BCLS(string userName, string password)
    {
        SqlConnection con_pass = obj1.getcon();
        con_pass.Open();
        try
        {

            SqlCommand cmd_pass = new SqlCommand("select  NPstaff,nonNP_pswd,pswd_time from staff_details where staff_id = @STAFF_id  ", con_pass);
            cmd_pass.Parameters.Add(new SqlParameter("STAFF_id", userName));
            SqlDataReader dr_pass = cmd_pass.ExecuteReader();

            if (dr_pass.HasRows)
            {
                dr_pass.Read();
                bool bitValue = (bool)dr_pass[0];  //is NPstaff ?    
                if (bitValue == false) //NON NP Staff
                {
                    string NONnp_pass = Convert.ToString(dr_pass[1]);
                    if (NONnp_pass == password)
                    {
                        DateTime pswd_time = Convert.ToDateTime(dr_pass[2].ToString()); //password generated time
                        if (pswd_time > DateTime.Now.AddHours(-8))//expire time 8 HRS  
                        {
                            return true;
                        }
                        else  //password is too old
                        {
                            return false;
                        }
                    }
                    { //incorrect password
                        return false;
                    }

                }
                else//if NP
                {

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
            }
            else//incorrect username 
            {
                return false;
            }
        }

        catch (Exception ex)
        {
            return false;
        }
        finally
        {
            con_pass.Close();
        }

    }
    private bool ZTpasswordCheck_BCLS(string userName, string password)
    {
        SqlConnection con_pass = obj1.getcon();
        con_pass.Open();
        try
        {

            SqlCommand cmd_pass = new SqlCommand("select  NPstaff,nonNP_pswd,pswd_time from staff_details where staff_id = @STAFF_id ", con_pass);
            cmd_pass.Parameters.Add(new SqlParameter("STAFF_id", userName));
            SqlDataReader dr_pass = cmd_pass.ExecuteReader();
            if (dr_pass.HasRows)
            {
                dr_pass.Read();

                bool bitValue = (bool)dr_pass[0];  //is NPstaff ?    
                if (bitValue == false) //NON NP Staff
                {
                    string NONnp_pass = Convert.ToString(dr_pass[1]);
                    if (NONnp_pass == password)
                    {


                        DateTime pswd_time = Convert.ToDateTime(dr_pass[2].ToString()); //password generated time

                        if (pswd_time > DateTime.Now.AddHours(-8))//expire time 8 HRS
                        {
                            return true;
                        }
                        else // password is too old 
                        {
                            return false;
                        }
                    }
                    { //incorrect password
                        return false;
                    }

                }
                else  //if NP
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

            }

            else
            {
                return false;
            }
        }
        catch (Exception ex)
        {
            return false;
        }
        finally
        {
            con_pass.Close();
        }
    }

    private void ValidateUser_NSL(string userName, string password)
    {


        SqlConnection con = obj1.getcon();
        con.Open();

        SqlCommand cmd = new SqlCommand("select staff_id,staff_name,staff_role,NPstaff from NSL_staff_details where staff_id = @STAFF_id ", con);
        cmd.Parameters.Add(new SqlParameter("STAFF_id", userName));
        SqlDataReader dr = cmd.ExecuteReader();


        //bool password_valid = obj1.NPpasswordCheck(userName, password); //NP SERVER
        bool password_valid = obj1.ZTpasswordCheck(userName, password); //LOCAL SERVER


        if (dr.HasRows && password_valid) //if username and password is correct
        {

            Guid guid_string_Id = System.Guid.NewGuid();
            string newID = guid_string_Id.ToString();
            Session["CPRactSessionCheck"] = newID;
            HttpCookie cookie = new HttpCookie("CPRactCookieCheck", newID);

            cookie.Values.Add("TRXID", (string)Session["CPRactSessionCheck"]);
            cookie.Values.Add("EVSS_ID", Session.SessionID);
            Response.Cookies.Add(cookie);
            //   Response.Cookies["CPRactCookieCheck"].Secure = true;//We can enable secure cookie to set true(HTTPs).


            dr.Read();
            s_id = dr[0].ToString();
            s_name = dr[1].ToString();
            s_role = dr[2].ToString();

            if (s_role == "NSL Module Leader")
            {
                Session["id"] = 41;
            }
            else if (s_role == "NSL Lecturer")
            {
                Session["id"] = 51;
            }


            Session["staffname"] = s_name;
            Session["staffid"] = s_id;
            Session["staffrole"] = s_role;
            Session["staff_password"] = password;
            String last_interaction_time = DateTime.Now.ToString("dd/MM/yyyy HH:mm");//TO GET THE CURRENT LOGIN TIME
            Session["lasttime"] = last_interaction_time;

            if (dl_version.SelectedItem.Value == "4") //version 3.1
            {

                Session["selected_version"] = dl_version.SelectedValue;
                Response.Redirect("NSL_Group.aspx");
            }
            else if (dl_version.SelectedItem.Value == "2")//version 2.1
            {

                Session["selected_version"] = dl_version.SelectedValue;
                Response.Redirect("NSL_Group_v2_1.aspx");
            }
            else if (dl_version.SelectedItem.Value == "3")//version 2.2
            {

                Session["selected_version"] = dl_version.SelectedValue;
                Response.Redirect("NSL_Group_v2_2.aspx");
            }
            else if (dl_version.SelectedItem.Value == "5")//version 1.1
            {

                Session["selected_version"] = dl_version.SelectedValue;
                Response.Redirect("NSL_Group_v1_1.aspx");
            }



        }
        else
        {
            lb_invalid.Visible = true;
            tb_password.Text = "";
            hdnfldpassword.Value = "";
            lb_invalid.Text = " Invalid userID or Password ! ";

            //lb_invalid.Text = " Invalid userID or Password ! " + "HasRows in DB: " + dr.HasRows.ToString() + "  Valid LDAP: " + password_valid.ToString();

        }

        con.Close();
    }




}
