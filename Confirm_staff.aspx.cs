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

public partial class Confirm_staff : System.Web.UI.Page
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
        string s_emp_num = (string)Session["s_emp_no"];
        string s_nric = (string)Session["staff_nric"];


        lb_confirmid.Text = s_id;
        lb_confirmrole.Text = s_role;
        lb_confirmname.Text = s_name;
        lb_confirm_emp_no.Text = s_emp_num;
        lb_confirm_nric.Text = s_nric;

        // Code disables caching by browser.
        Response.Cache.SetCacheability(HttpCacheability.NoCache);// this tells the client not to cache responses in the History folder, so that when you use the back/forward buttons the client requests a new version of the response each time.
        Response.Cache.SetExpires(DateTime.UtcNow.AddHours(-1));
        Response.Cache.SetNoStore();
       
    }


    protected void Button3_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("Login.aspx");
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
    protected void bt_confirm_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            string np_staff = (string)Session["is_Npstaff"];
            string c_id = lb_confirmid.Text;
            string c_role = lb_confirmrole.Text;
            string c_name = lb_confirmname.Text;
            string c_nric = lb_confirm_nric.Text;
            string c_emp_no = lb_confirm_emp_no.Text;
            SqlConnection con = obj.getcon();
            con.Open();


            string confirmValue = Request.Form["confirm_value"];
            if (confirmValue == "Yes")
            {

                if (np_staff=="0" && c_role != "Instructor" && c_role != "Guest")//Only Instructor or Guest can Non Np
                {
                   // ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('Non NP staff can assign as instuctor/guest only')", true);
                    Page.ClientScript.RegisterStartupScript(this.GetType(), Guid.NewGuid().ToString(), "alert('Non NP staff can assign as instuctor/guest only');window.location='add_newstaff.aspx';", true);

                }
                else
                {

                    SqlCommand cmd1 = new SqlCommand("select staff_id from staff_details where staff_id='" + c_id + "' ", con);
                    SqlDataReader dr1 = cmd1.ExecuteReader();
                    if (dr1.HasRows)
                    {
                        FLAG = 1; //IF STAFF ALRREADY EXISTS
                                  // ScriptManager.RegisterStartupScript(this, this.GetType(), "redirect", "alert('Staff with this ID is already exists!'); window.location='" + Request.ApplicationPath + "/add_newstaff.aspx'", true);
                        Page.ClientScript.RegisterStartupScript(this.GetType(), Guid.NewGuid().ToString(), "alert('Staff with this ID  is already exists!');window.location='add_newstaff.aspx';", true);

                    }



                    if (FLAG == 0)//insert staff
                    {
                        try
                        {


                            SqlCommand cmd = new SqlCommand("insert staff_details (staff_id,staff_name,staff_role,NPstaff,staff_nric,staff_employee_no)values(@STAFF_id,@STAFF_NAME,@STAFF_ROLE,@STAFF_NP,@STAFF_NRIC,@STAFF_EMPNO)", con);
                            cmd.Parameters.Add(new SqlParameter("STAFF_id", c_id));
                            cmd.Parameters.Add(new SqlParameter("STAFF_NAME", c_name));
                            cmd.Parameters.Add(new SqlParameter("STAFF_ROLE", c_role));
                            cmd.Parameters.Add(new SqlParameter("STAFF_NP", np_staff));
                            cmd.Parameters.Add(new SqlParameter("STAFF_NRIC", c_nric));
                            cmd.Parameters.Add(new SqlParameter("STAFF_EMPNO", c_emp_no));

                            int val = cmd.ExecuteNonQuery();
                            Page.ClientScript.RegisterStartupScript(this.GetType(), Guid.NewGuid().ToString(), "alert('Successfully added');window.location='add_newstaff.aspx';", true);
                        }
                        catch (Exception ex)
                        {

                            string exx = ex.ToString();
                            lb_insert_err.Visible = true;
                            lb_insert_err.ForeColor = System.Drawing.Color.Red;
                            lb_insert_err.Text = "Error Status:" + ex.Message;

                        }
                        //    Response.Redirect("add_newstaff.aspx");

                    }
                }
            }
            else if (confirmValue == "No")
            {
                Session["nc_id"] = c_id;
                Session["nc_name"] = c_name;
                Session["nc_s_emp_no"] = c_emp_no;
                Session["nc_staff_nric"] = c_nric;
                Session["nc_role"] = c_role;

                Response.Redirect("add_newstaff.aspx");

            }
            con.Close();

        }
        catch (Exception ex)
        {

            string exx = ex.ToString();
            lb_insert_err.Visible = true;
            lb_insert_err.ForeColor = System.Drawing.Color.Red;
            lb_insert_err.Text = "Error status:" + ex.Message;

        }
    }

}
