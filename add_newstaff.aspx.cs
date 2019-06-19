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

public partial class add_newstaff : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        Button1.ImageUrl = "images/BtnContinue (1).png";

        string st_role = (string)Session["staffrole"];
        String logintime = (string)Session["lasttime"];
        string name = (string)Session["staffname"]; //TO GET THE WELCOME MESSAGE


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
       
        if (!IsPostBack)
        {
            if (Session["nc_id"] != null && Session["nc_name"] != null & Session["nc_s_emp_no"] != null && Session["nc_role"] != null)
            {
                string staff_id = (string)Session["nc_id"];
                string staff_name = (string)Session["nc_name"];
                string staff_emp_no = (string)Session["nc_s_emp_no"];
                string staff_nric = (string)Session["nc_staff_nric"];

                TextBox1.Text = staff_id;
                TextBox2.Text = staff_name;
                TextBox3.Text = staff_emp_no;
                TextBox4.Text = staff_nric;
                DropDownList1.SelectedValue = (string)Session["nc_role"];

                Session["nc_id"] = null;
                Session["nc_name"] = null;
                Session["nc_s_emp_no"] = null;
                Session["nc_staff_nric"] = null;
                Session["nc_role"] = null;
            }
            if ((string)Session["is_Npstaff"] == "1")
            {
                CheckBox1.Checked = true;
            }
            else
            {
                CheckBox1.Checked = false;
            }
        }
    }


    protected void Button1_Click(object sender, ImageClickEventArgs e)
    {
        if (!CheckBox1.Checked && DropDownList1.SelectedValue != "Instructor" && DropDownList1.SelectedValue != "Guest")//Only Instructor or Guest are Non Np
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('Non NP staff can assign as instuctor/guest only')", true);

        }
        else
        {



            Session["S_id"] = TextBox1.Text;
            Session["name"] = TextBox2.Text;
            Session["s_emp_no"] = TextBox3.Text;
            Session["staff_nric"] = TextBox4.Text;
            Session["role"] = DropDownList1.SelectedValue;


            if (CheckBox1.Checked)
            {
                Session["is_Npstaff"] = "1";
            }
            else
            {
                Session["is_Npstaff"] = "0";
            }
            Response.Redirect("confirm_staff.aspx");
        }
    }
}
