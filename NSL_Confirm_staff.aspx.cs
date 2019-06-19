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
public partial class NSL_Confirm_staff : System.Web.UI.Page
{
    MainClass obj = new MainClass();
    int FLAG = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        string st_role = (string)Session["staffrole"];
        string name = (string)Session["staffname"];

        bt_confirm.ImageUrl = "images/BtnConfirm.png";


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

        String logintime = (string)Session["lasttime"];


        string s_id = (string)Session["S_id"];
        string s_role = (string)Session["role"];
        string s_name = (string)Session["name"];
       

        lb_confirmid.Text = s_id;
        lb_confirmrole.Text = s_role;
        lb_confirmname.Text = s_name;

        // Code disables caching by browser.
        Response.Cache.SetCacheability(HttpCacheability.NoCache);// this tells the client not to cache responses in the History folder, so that when you use the back/forward buttons the client requests a new version of the response each time.
        Response.Cache.SetExpires(DateTime.UtcNow.AddHours(-1));
        Response.Cache.SetNoStore();
       
    }


    protected void Button3_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("NSL_Login.aspx");
    }

   
    protected void bt_staff_details_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("NSL_StaffDetails.aspx");
    }
 
    protected void bt_confirm_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
           //string np_staff = (string)Session["is_Npstaff"];
            string c_id = lb_confirmid.Text;
            string c_role = lb_confirmrole.Text;
            string c_name = lb_confirmname.Text;
            SqlConnection con = obj.getcon();
            con.Open();


            string confirmValue = Request.Form["confirm_value"];
            if (confirmValue == "Yes")
            {

                SqlCommand cmd1 = new SqlCommand("select staff_id from NSL_staff_details where  staff_id='"+c_id+"' ", con);
                SqlDataReader dr1 = cmd1.ExecuteReader();
                if (dr1.HasRows)
                {
                    FLAG = 1; //IF STAFF ALRREADY EXISTS
                 
                   //ScriptManager.RegisterStartupScript(this, this.GetType(), "redirect", "alert('Staff with this ID  is already exists!'); window.location='" + Request.ApplicationPath + "/NSL_add_newstaff.aspx'", true);
                    Page.ClientScript.RegisterStartupScript(this.GetType(), Guid.NewGuid().ToString(), "alert('Staff with this ID  is already exists!');window.location='NSL_add_newstaff.aspx';", true);
                }

                if (FLAG == 0)//insert staff
                {
                    SqlCommand cmd = new SqlCommand("insert NSL_staff_details (staff_id,staff_name,staff_role)values(@STAFF_id,@STAFF_NAME,@STAFF_ROLE)", con);
                    cmd.Parameters.Add(new SqlParameter("STAFF_id", c_id));
                    cmd.Parameters.Add(new SqlParameter("STAFF_NAME", c_name));
                    cmd.Parameters.Add(new SqlParameter("STAFF_ROLE", c_role));
                   
                    int val = cmd.ExecuteNonQuery();
                    Response.Redirect("NSL_add_newstaff.aspx");

                }
            }
            else if (confirmValue == "No")
            {
                Session["nc_id"] = c_id;
                Session["nc_name"] = c_name;
               Session["nc_role"] = c_role;

                Response.Redirect("NSL_add_newstaff.aspx");

            }
            con.Close();

        }
        catch (Exception ex)
        {

          //  Response.Write(ex);
        }
    }

}
