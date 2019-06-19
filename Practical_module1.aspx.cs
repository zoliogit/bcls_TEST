
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
using System.Collections.Generic;
using System.IO;
using System.Net;
using System.Windows.Forms;// for message box
using System.Text;
using System.Web.Script.Services;
using System.Web.Services;
using CheckBox = System.Web.UI.WebControls.CheckBox;
using System.Web.Script.Serialization;

public partial class Pracical_module1 : System.Web.UI.Page
{

    MainClass obj = new MainClass();
    string year, t_date;
    bool if_zero_exists;
    string STUDENT_ID, TESTSESSION_ID, module_no, remark, student_id, test_id, module;
    string instructor, result;
    string rhythm_strip_path;
    protected void Page_Load(object sender, EventArgs e)
    {
        //MASTER PAGE IS NOT APPLIED
        if (Session["id"] == null)
            Response.Redirect("Login.aspx");
        
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
       


        string name = (string)Session["staffname"]; //TO GET THE WELCOME MESSAGE
        lb_welcome.Text = "Welcome " + name.ToUpper() + "!";

        lb_attempt1_result.Enabled = false;
        lb_attempt2_result.Enabled = false;
        lb_attempt3_result.Enabled = false;
        btn_submit.ImageUrl = "images/BtnSubmit.png";
        btn_submit2.ImageUrl = "images/BtnSubmit.png";
        bt_allpass.ImageUrl = "images/CheckAllBtn.png";
        bt_allpass2.ImageUrl = "images/CheckAllBtn.png";
        Button4.ImageUrl = "images/BackToModulesBtn.png";
        
        string st_id = (string)Session["p_studentid"];
        string ss_testid = (string)Session["view_testid"];

        student_id = (string)Session["p_studentid"];
        test_id = (string)Session["view_testid"];

        if (Session["view_testid"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        SqlConnection con7 = obj.getcon();
        con7.Open();
        SqlCommand cmd18 = new SqlCommand("select test_date from testsession_details where testsession_id='" + test_id + "' ", con7);
        SqlDataReader dr18 = cmd18.ExecuteReader();
        while (dr18.Read())
        {
            t_date = dr18[0].ToString();
            year = t_date.Split('-')[2];

        }
        con7.Close();
        string RootFolderName = ConfigurationManager.AppSettings["BCLSResultsFolder"];//D:/Hosting/10676289/html/bclstest/results
       bool is_folder_exists = FtpDirectoryExists1(RootFolderName + "/" + year + "/" + test_id + "/" + student_id + "/practical");

        if (!IsPostBack)
        {

            lb_attempt1_result.Text = "Referred";//initially all attempt is referred
            lb_attempt2_result.Text = "Referred";
            lb_attempt3_result.Text = "Referred";

            Session["f_name"] = null;

            ///// bool is_folder_exists = FtpDirectoryExists1("~/results/" + year + "/" + test_id + "/" + student_id + "/practical");
            if (is_folder_exists == true)
            {
                getfile(test_id, student_id);//if any Rhythmfile is uploaded its link will be showed on page load itself
            }
        }
        else
        {
            if (is_folder_exists == true)
            {
                getfile(test_id, student_id);//if any Rhythmfile is uploaded its link will be showed on page load itself
            }
        }


        string m1_nric = (string)Session["p_studentnric"];
        string m1_studentname = (string)Session["p_studentname"];
        instructor = (string)Session["staffid"];


        Label5.Text = m1_studentname.ToUpper();
        Label6.Text = m1_nric;

        SqlConnection con = obj.getcon();
        con.Open();

        module = "module1";
        ArrayList al2 = new ArrayList();
        if (!IsPostBack)
        {

            SqlCommand cmd2 = new SqlCommand("Select attempt from practicaltest_details where student_id='" + st_id + "' and testsession_id='" + ss_testid + "' and module_num='" + module + "' ", con);
            SqlDataReader dr2 = cmd2.ExecuteReader();
            if (dr2.HasRows == true)
            {
                while (dr2.Read()) //if any one attempt is started then checkboxes and textboxes of other attempts should make disabled.
                {


                    al2.Add(dr2.GetString(0));
                    foreach (string s1 in al2)
                    {
                        if (s1 == "c1")
                        {
                            CheckBox1.Checked = true;
                        }
                        if (s1 == "c2")
                        {
                            CheckBox2.Checked = true;
                        }
                        if (s1 == "c3")
                        {
                            CheckBox3.Checked = true;
                        }
                        if (s1 == "c4")
                        {
                            CheckBox4.Checked = true;
                        }
                        if (s1 == "c5")
                        {
                            CheckBox5.Checked = true;
                        }
                        if (s1 == "c6")
                        {
                            CheckBox6.Checked = true;
                        }
                        if (s1 == "c7")
                        {
                            CheckBox7.Checked = true;
                        }
                        if (s1 == "c8")
                        {
                            CheckBox8.Checked = true;
                        }
                        if (s1 == "c9")
                        {
                            CheckBox9.Checked = true;
                        }

                        if (s1 == "c10")
                        {
                            CheckBox10.Checked = true;
                        }
                        if (s1 == "c11")
                        {
                            CheckBox11.Checked = true;
                        }
                        if (s1 == "c12")
                        {
                            CheckBox12.Checked = true;
                        }
                        if (s1 == "c13")
                        {
                            CheckBox13.Checked = true;
                        }
                        if (s1 == "c14")
                        {
                            CheckBox14.Checked = true;
                        }
                        if (s1 == "c15")
                        {
                            CheckBox15.Checked = true;
                        }
                        if (s1 == "c16")
                        {
                            CheckBox16.Checked = true;
                        }
                        if (s1 == "c17")
                        {
                            CheckBox17.Checked = true;
                        }

                        if (s1 == "c18")
                        {
                            CheckBox18.Checked = true;
                        }

                        if (s1 == "c19")
                        {
                            CheckBox19.Checked = true;
                        }
                        if (s1 == "c20")
                        {
                            CheckBox20.Checked = true;
                        }
                        if (s1 == "c21")
                        {
                            CheckBox21.Checked = true;
                        }
                        if (s1 == "c23")
                        {
                            CheckBox23.Checked = true;
                        }
                        if (s1 == "c22")
                        {
                            CheckBox22.Checked = true;
                        }
                        if (s1 == "c24")
                        {
                            CheckBox24.Checked = true;
                        }
                        if (s1 == "c25")
                        {
                            CheckBox25.Checked = true;
                        }
                        if (s1 == "c26")
                        {
                            CheckBox26.Checked = true;
                        }
                        if (s1 == "c27")
                        {
                            CheckBox27.Checked = true;
                        }
                        if (s1 == "c28")
                        {
                            CheckBox28.Checked = true;
                        }
                        if (s1 == "c29")
                        {
                            CheckBox29.Checked = true;
                        }
                        if (s1 == "c30")
                        {
                            CheckBox30.Checked = true;
                        }
                        if (s1 == "c31")
                        {
                            CheckBox31.Checked = true;
                        }
                        if (s1 == "c32")
                        {
                            CheckBox32.Checked = true;
                        }
                        if (s1 == "c33")
                        {
                            CheckBox33.Checked = true;
                        }
                        if (s1 == "c34")
                        {
                            CheckBox34.Checked = true;
                        }
                        if (s1 == "c35")
                        {
                            CheckBox35.Checked = true;
                        }
                        if (s1 == "c36")
                        {
                            CheckBox36.Checked = true;
                        }
                        if (s1 == "c37")
                        {
                            CheckBox37.Checked = true;
                        }
                        if (s1 == "c38")
                        {
                            CheckBox38.Checked = true;
                        }
                        if (s1 == "c39")
                        {
                            CheckBox39.Checked = true;
                        }
                    }
                }
            }

            SqlCommand cmd6 = new SqlCommand("Select attempt,date,result,instructor_id,remark,ventilations,compressions,time_for_5cycles from practicaltest_summary where student_id='" + st_id + "' and testsession_id='" + ss_testid + "' and module_num='" + module + "'  ", con);
            SqlDataReader dr6 = cmd6.ExecuteReader();
            if (dr6.HasRows == true)
            {
                while (dr6.Read())
                {
                    {
                        if (dr6[0].ToString() == "1")
                        {
                            TextBox4.Text = dr6[4].ToString();
                            TextBox4.Enabled = false;
                            TextBox4.Visible = true;

                            instructor1.Text = dr6[3].ToString();
                            instructor1.Enabled = false;
                            instructor1.Visible = true;

                            tb_ventilation1.Text = dr6[5].ToString();
                            tb_ventilation1.Enabled = false;
                            tb_compression1.Text = dr6[6].ToString();
                            tb_compression1.Enabled = false;
                            tb_cycle1.Text = dr6[7].ToString();
                            tb_cycle1.Enabled = false;


                            TextBox1.Text = dr6[1].ToString();
                            TextBox1.Enabled = false;
                            TextBox3.Enabled = false;

                            lb_attempt1_result.Text = dr6[2].ToString();


                        }

                        if (dr6[0].ToString() == "2")
                        {
                            TextBox5.Text = dr6[4].ToString();
                            TextBox5.Enabled = false;
                            TextBox5.Visible = true;

                            instructor2.Text = dr6[3].ToString();
                            instructor2.Enabled = false;
                            instructor2.Visible = true;


                            TextBox2.Text = dr6[1].ToString();
                            TextBox2.Enabled = false;
                            TextBox1.Enabled = false;
                            TextBox3.Enabled = false;

                            tb_ventilation2.Text = dr6[5].ToString();
                            tb_ventilation2.Enabled = false;
                            tb_compression2.Text = dr6[6].ToString();
                            tb_compression2.Enabled = false;
                            tb_cycle2.Text = dr6[7].ToString();
                            tb_cycle2.Enabled = false;

                            tb_ventilation1.Enabled = false;
                            tb_compression1.Enabled = false;
                            tb_cycle1.Enabled = false;


                            lb_attempt2_result.Text = dr6[2].ToString();
                        }

                        if (dr6[0].ToString() == "3")
                        {
                            TextBox6.Text = dr6[4].ToString();
                            TextBox6.Enabled = false;
                            TextBox6.Visible = true;

                            instructor3.Text = dr6[3].ToString();
                            instructor3.Enabled = false;
                            instructor3.Visible = true;

                            TextBox3.Text = dr6[1].ToString();
                            TextBox3.Enabled = false;
                            TextBox2.Enabled = false;
                            TextBox1.Enabled = false;

                            tb_ventilation3.Text = dr6[5].ToString();
                            tb_ventilation3.Enabled = false;
                            tb_compression3.Text = dr6[6].ToString();
                            tb_compression3.Enabled = false;
                            tb_cycle3.Text = dr6[7].ToString();
                            tb_cycle3.Enabled = false;

                            tb_ventilation1.Enabled = false;
                            tb_compression1.Enabled = false;
                            tb_cycle1.Enabled = false;
                            tb_ventilation2.Enabled = false;
                            tb_compression2.Enabled = false;
                            tb_cycle2.Enabled = false;

                            lb_attempt3_result.Text = dr6[2].ToString();

                        }
                        if (dr6[0].ToString() == "0")
                        {
                            SqlCommand cmd15 = new SqlCommand("Select max(attempt) from practicaltest_summary where student_id='" + st_id + "' and testsession_id='" + ss_testid + "' and module_num='" + module + "'  ", con);
                            SqlDataReader dr15 = cmd15.ExecuteReader();
                            if (dr15.HasRows)
                            {
                                while (dr15.Read())
                                {
                                    string max_attempt = dr15[0].ToString();
                                    if (max_attempt == "1")
                                    {
                                        TextBox4.Enabled = false;
                                        TextBox6.Enabled = false;

                                        TextBox5.Text = dr6[4].ToString();
                                        instructor2.Text = dr6[3].ToString();
                                        TextBox2.Text = dr6[1].ToString();
                                        tb_ventilation2.Text = dr6[5].ToString();
                                        tb_compression2.Text = dr6[6].ToString();
                                        tb_cycle2.Text = dr6[7].ToString();
                                        lb_attempt2_result.Text = dr6[2].ToString();

                                        tb_ventilation3.Visible = false;
                                        tb_compression3.Visible = false;
                                        tb_cycle3.Visible = false;

                                        Req_venti3.Visible = false;
                                        Req_cycle3.Visible = false;
                                        Req_compression3.Visible = false;
                                    }
                                    else if (max_attempt == "2")
                                    {
                                        TextBox4.Enabled = false;
                                        TextBox5.Enabled = false;

                                        TextBox6.Text = dr6[4].ToString();
                                        instructor3.Text = dr6[3].ToString();

                                        TextBox3.Text = dr6[1].ToString();
                                        TextBox2.Enabled = false;
                                        TextBox1.Enabled = false;
                                        tb_ventilation3.Text = dr6[5].ToString();
                                        tb_compression3.Text = dr6[6].ToString();
                                        tb_cycle3.Text = dr6[7].ToString();
                                        TextBox3.Text = dr6[1].ToString();
                                        TextBox6.Text = dr6[4].ToString();
                                        instructor3.Text = dr6[3].ToString();
                                        lb_attempt3_result.Text = dr6[2].ToString();
                                    }
                                    if (max_attempt == "0")
                                    {
                                        tb_ventilation2.Visible = false;
                                        tb_compression2.Visible = false;
                                        tb_cycle2.Visible = false;
                                        tb_ventilation3.Visible = false;
                                        tb_compression3.Visible = false;
                                        tb_cycle3.Visible = false;
                                        Req_venti2.Visible = false;
                                        Req_cycle2.Visible = false;
                                        Req_compression2.Visible = false;
                                        Req_venti3.Visible = false;
                                        Req_cycle3.Visible = false;
                                        Req_compression3.Visible = false;

                                        TextBox5.Enabled = false;
                                        TextBox6.Enabled = false;

                                        TextBox4.Text = dr6[4].ToString();
                                        instructor1.Text = dr6[3].ToString();
                                        instructor1.Visible = true;
                                        TextBox1.Text = dr6[1].ToString();
                                        TextBox2.Enabled = false;
                                        TextBox1.Enabled = false;
                                        tb_ventilation1.Text = dr6[5].ToString();
                                        tb_compression1.Text = dr6[6].ToString();
                                        tb_cycle1.Text = dr6[7].ToString();
                                        TextBox1.Text = dr6[1].ToString();
                                        TextBox4.Text = dr6[4].ToString();
                                        instructor1.Text = dr6[3].ToString();
                                        lb_attempt1_result.Text = dr6[2].ToString();
                                    }

                                }
                            }
                        }
                    }
                }
            }

            else//just started
            {
                tb_ventilation2.Visible = false;
                tb_compression2.Visible = false;
                tb_cycle2.Visible = false;
                tb_ventilation3.Visible = false;
                tb_compression3.Visible = false;
                tb_cycle3.Visible = false;
                Req_venti2.Visible = false;
                Req_cycle2.Visible = false;
                Req_compression2.Visible = false;
                Req_venti3.Visible = false;
                Req_cycle3.Visible = false;
                Req_compression3.Visible = false;

                TextBox4.Enabled = true;
                TextBox5.Enabled = false;
                TextBox6.Enabled = false;


                instructor1.Text = instructor;
                instructor1.Enabled = false;
                instructor1.Visible = true;

                tb_ventilation2.Enabled = false;
                tb_compression2.Enabled = false;
                tb_cycle2.Enabled = false;

                tb_ventilation3.Enabled = false;
                tb_compression3.Enabled = false;
                tb_cycle3.Enabled = false;

                TextBox3.Enabled = false;
                TextBox1.Enabled = false;
                TextBox2.Enabled = false;

            }
        }
        SqlCommand cmd1 = new SqlCommand("Select attempt,date,result from practicaltest_summary where student_id='" + st_id + "' and testsession_id='" + ss_testid + "' and module_num='" + module + "' and attempt=(select max(attempt) from practicaltest_summary where student_id='" + st_id + "' and testsession_id='" + ss_testid + "' and module_num='" + module + "' )", con);
        SqlDataReader dr = cmd1.ExecuteReader();
        if (dr.HasRows == true)
        {
            while (dr.Read())
            {
                string s = dr[0].ToString();

                if (s == "1")
                {
                    tb_ventilation3.Visible = false;
                    tb_compression3.Visible = false;
                    tb_cycle3.Visible = false;
                    Req_venti3.Visible = false;
                    Req_cycle3.Visible = false;
                    Req_compression3.Visible = false;

                    instructor2.Text = instructor;
                    instructor2.Enabled = false;
                    instructor2.Visible = true;

                    TextBox4.Enabled = false;
                    TextBox5.Enabled = true;
                    TextBox6.Enabled = false;

                    TextBox2.Text = DateTime.Now.ToString("dd-MM-yyyy");
                    for (int i = 1; i < 38; i += 3)
                    {
                        CheckBox cb = (CheckBox)Page.FindControl("CheckBox" + i);
                        cb.Enabled = false;
                    }
                    for (int i = 3; i < 40; i += 3)
                    {
                        CheckBox cb = (CheckBox)Page.FindControl("CheckBox" + i);
                        cb.Enabled = false;
                    }

                    tb_ventilation1.Enabled = false;
                    tb_compression1.Enabled = false;
                    tb_cycle1.Enabled = false;

                    tb_ventilation3.Enabled = false;
                    tb_compression3.Enabled = false;
                    tb_cycle3.Enabled = false;
                }

                if (s == "2")
                {

                    instructor3.Text = instructor;
                    instructor3.Enabled = false;
                    instructor3.Visible = true;
                    TextBox3.Text = DateTime.Now.ToString("dd-MM-yyyy");
                    TextBox4.Enabled = false;
                    TextBox5.Enabled = false;
                    TextBox6.Enabled = true;

                    for (int i = 1; i < 38; i += 3)
                    {
                        CheckBox cb = (CheckBox)Page.FindControl("CheckBox" + i);
                        cb.Enabled = false;
                    }
                    for (int i = 2; i < 39; i += 3)
                    {
                        CheckBox cb = (CheckBox)Page.FindControl("CheckBox" + i);
                        cb.Enabled = false;
                    }
                    for (int i = 3; i < 40; i += 3)
                    {
                        CheckBox cb = (CheckBox)Page.FindControl("CheckBox" + i);
                        cb.Enabled = true;
                    }

                    tb_ventilation2.Enabled = false;
                    tb_compression2.Enabled = false;
                    tb_cycle2.Enabled = false;

                    tb_ventilation1.Enabled = false;
                    tb_compression1.Enabled = false;
                    tb_cycle1.Enabled = false;

                    SqlConnection con9 = obj.getcon(); //if same invigilator start the 3rd attempt
                    con9.Open();
                    SqlCommand cmd9 = new SqlCommand("select instructor_id from practicaltest_summary where attempt='1' and testsession_id='" + test_id + "' and student_id='" + student_id + "' and module_num='module1' and instructor_id =(select instructor_id  from  practicaltest_summary where  attempt='2' and testsession_id='" + test_id + "' and student_id='" + student_id + "' and module_num='module1'  ) ", con9);

                    SqlDataReader dr9 = cmd9.ExecuteReader();
                    if (dr9.HasRows)
                    {
                        while (dr9.Read())
                        {
                            string previous_staff = dr9[0].ToString();
                            if (previous_staff == instructor)
                            {
                                btn_submit.Visible = false; //no need to show submit and check all buttons
                                btn_submit2.Visible = false;
                                bt_allpass.Visible = false;
                                bt_allpass2.Visible = false;


                                tb_ventilation3.Visible = false;
                                tb_compression3.Visible = false;
                                tb_cycle3.Visible = false;
                                Req_venti3.Visible = false;
                                Req_cycle3.Visible = false;
                                Req_compression3.Visible = false;


                                TextBox4.Enabled = false;
                                TextBox5.Enabled = false;
                                TextBox6.Enabled = false;

                                tb_ventilation1.Enabled = false;
                                tb_compression1.Enabled = false;
                                tb_cycle1.Enabled = false;

                                tb_ventilation2.Enabled = false;
                                tb_compression2.Enabled = false;
                                tb_cycle2.Enabled = false;

                                tb_ventilation3.Enabled = false;
                                tb_compression3.Enabled = false;
                                tb_cycle3.Enabled = false;

                                for (int i = 1; i < 38; i += 3)
                                {
                                    CheckBox cb = (CheckBox)Page.FindControl("CheckBox" + i);
                                    cb.Enabled = false;
                                }
                                for (int i = 2; i < 39; i += 3)
                                {
                                    CheckBox cb = (CheckBox)Page.FindControl("CheckBox" + i);
                                    cb.Enabled = false;
                                }
                                for (int i = 3; i < 40; i += 3)
                                {
                                    CheckBox cb = (CheckBox)Page.FindControl("CheckBox" + i);
                                    cb.Enabled = false;
                                }

                            }
                        }
                    } con9.Close();
                }

                if (s == "3")
                {

                    btn_submit.Visible = false;
                    btn_submit2.Visible = false;
                    bt_allpass.Visible = false;
                    bt_allpass2.Visible = false;

                    TextBox4.Enabled = false;
                    TextBox5.Enabled = false;
                    TextBox6.Enabled = false;

                    tb_ventilation1.Enabled = false;
                    tb_compression1.Enabled = false;
                    tb_cycle1.Enabled = false;

                    tb_ventilation2.Enabled = false;
                    tb_compression2.Enabled = false;
                    tb_cycle2.Enabled = false;

                    tb_ventilation3.Enabled = false;
                    tb_compression3.Enabled = false;
                    tb_cycle3.Enabled = false;

                    for (int i = 1; i < 38; i += 3)
                    {
                        CheckBox cb = (CheckBox)Page.FindControl("CheckBox" + i);
                        cb.Enabled = false;
                    }
                    for (int i = 2; i < 39; i += 3)
                    {
                        CheckBox cb = (CheckBox)Page.FindControl("CheckBox" + i);
                        cb.Enabled = false;
                    }
                    for (int i = 3; i < 40; i += 3)
                    {
                        CheckBox cb = (CheckBox)Page.FindControl("CheckBox" + i);
                        cb.Enabled = false;
                    }

                }
                if (s == "0")
                {
                    tb_ventilation2.Visible = false;
                    tb_compression2.Visible = false;
                    tb_cycle2.Visible = false;
                    tb_ventilation3.Visible = false;
                    tb_compression3.Visible = false;
                    tb_cycle3.Visible = false;

                    instructor1.Text = instructor;
                    instructor1.Enabled = false;
                    instructor1.Visible = true;
                    for (int i = 2; i < 39; i += 3)
                    {
                        CheckBox cb = (CheckBox)Page.FindControl("CheckBox" + i);
                        cb.Enabled = false;
                    }
                    for (int i = 3; i < 40; i += 3)
                    {
                        CheckBox cb = (CheckBox)Page.FindControl("CheckBox" + i);
                        cb.Enabled = false;
                    }
                }

            }

        }
        else //if just started
        {
            TextBox1.Text = DateTime.Now.ToString("dd-MM-yyyy");
            TextBox4.Enabled = true;
            TextBox5.Enabled = false;
            TextBox6.Enabled = false;

            tb_ventilation2.Visible = false;
            tb_compression2.Visible = false;
            tb_cycle2.Visible = false;
            tb_ventilation3.Visible = false;
            tb_compression3.Visible = false;
            tb_cycle3.Visible = false;

            Req_venti2.Visible = false;
            Req_cycle2.Visible = false;
            Req_compression2.Visible = false;
            Req_venti3.Visible = false;
            Req_cycle3.Visible = false;
            Req_compression3.Visible = false;



            tb_ventilation2.Enabled = false;
            tb_compression2.Enabled = false;
            tb_cycle2.Enabled = false;

            tb_ventilation3.Enabled = false;
            tb_compression3.Enabled = false;
            tb_cycle3.Enabled = false;

            for (int i = 3; i < 40; i += 3)
            {
                CheckBox cb = (CheckBox)Page.FindControl("CheckBox" + i);
                cb.Enabled = false;
            }
            for (int i = 2; i < 39; i += 3)
            {
                CheckBox cb = (CheckBox)Page.FindControl("CheckBox" + i);
                cb.Enabled = false;
            }
        }



        //if one attempt passed ,then buttons should not be visible
        SqlCommand cmd44 = new SqlCommand("Select result,attempt from practicaltest_summary where student_id='" + st_id + "' and testsession_id='" + ss_testid + "' and module_num='module1' and attempt<>'0' ", con);
        SqlDataReader dr44 = cmd44.ExecuteReader();

        while (dr44.Read())
        {
            string last_result = dr44[0].ToString();
            string last_attempt1 = dr44[1].ToString();
            if (last_result == "Passed")
            {
                bt_allpass.Visible = false;
                bt_allpass2.Visible = false;

                btn_submit.Visible = false;
                btn_submit2.Visible = false;
                if (last_attempt1 == "1")
                {
                    for (int i = 3; i < 40; i += 3)
                    {
                        CheckBox cb = (CheckBox)Page.FindControl("CheckBox" + i);
                        cb.Enabled = false;
                    }
                    for (int i = 2; i < 39; i += 3)
                    {
                        CheckBox cb = (CheckBox)Page.FindControl("CheckBox" + i);
                        cb.Enabled = false;
                    }
                    tb_ventilation2.Visible = false;
                    tb_compression2.Visible = false;
                    tb_cycle2.Visible = false;
                    tb_ventilation3.Visible = false;
                    tb_compression3.Visible = false;
                    tb_cycle3.Visible = false;
                    Req_venti2.Visible = false;
                    Req_cycle2.Visible = false;
                    Req_compression2.Visible = false;
                    Req_venti3.Visible = false;
                    Req_cycle3.Visible = false;
                    Req_compression3.Visible = false;
                    TextBox5.Enabled = false;
                    TextBox6.Enabled = false;

                }
                if (last_attempt1 == "2")
                {
                    for (int i = 3; i < 40; i += 3)
                    {
                        CheckBox cb = (CheckBox)Page.FindControl("CheckBox" + i);
                        cb.Enabled = false;
                    }


                    tb_ventilation3.Visible = false;
                    tb_compression3.Visible = false;
                    tb_cycle3.Visible = false;

                    Req_venti3.Visible = false;
                    Req_cycle3.Visible = false;
                    Req_compression3.Visible = false;
                    TextBox6.Enabled = false;


                }
                break;
            }


        } 
        con.Close();
    }



    protected void Button4_Click(object sender, ImageClickEventArgs e)
    {
       
            bt_Save_Click(sender, e);
      
        Response.Redirect("Practical_test.aspx");
    }

    public void module_attempt(string st_id, string sess_id, string mod, string attempt, int qn, string attempt_num)
    {
        SqlConnection con = obj.getcon();
        con.Open();
        SqlCommand cmd10 = new SqlCommand("Select attempt_num from practicaltest_details where student_id='" + st_id + "' and testsession_id='" + sess_id + "' and module_num='" + mod + "' and attempt='" + attempt + "' and question_num='" + qn + "' ", con);
        SqlDataReader dr10 = cmd10.ExecuteReader();
        if (dr10.HasRows)
        {

            while (dr10.Read())
            {
                if (dr10[0].ToString() == "0")
                {
                    string save_attempt = "0";
                    SqlCommand cmd3 = new SqlCommand("update practicaltest_details set testsession_id='" + sess_id + "',student_id='" + st_id + "',module_num='" + mod + "',question_num='" + qn + "',attempt='" + attempt + "',attempt_num='" + attempt_num + "' where student_id='" + st_id + "' and testsession_id='" + sess_id + "' and module_num='" + mod + "' and attempt='" + attempt + "' and attempt_num='" + save_attempt + "' ", con);
                    cmd3.ExecuteNonQuery();
                }
            }
        }
        else
        {

            SqlCommand cmd1 = new SqlCommand("insert into practicaltest_details (testsession_id,student_id,module_num,question_num,attempt,attempt_num) values ( '" + sess_id + "' ,'" + st_id + "','" + mod + "','" + qn + "','" + attempt + "','" + attempt_num + "' )", con);
            cmd1.ExecuteNonQuery();

        }
        con.Close();
    }

    public void module_summary(string st_id, string sess_id, string mod, string date, string staff_id, string attempt, string result, string remark, string compression, string ventilation, string cycle, string Practical_status)
    {

        SqlConnection con = obj.getcon();
        con.Open();

        SqlCommand cmd_for_zero_exists = new SqlCommand("Select attempt from practicaltest_summary where student_id='" + st_id + "' and testsession_id='" + sess_id + "' and module_num='" + mod + "' and attempt='0' ", con);
        SqlDataReader dr_for_zero_exists = cmd_for_zero_exists.ExecuteReader();
        if (dr_for_zero_exists.HasRows)
        {
            if_zero_exists = true;
        }

        SqlCommand cmd1 = new SqlCommand("Select max(attempt) from practicaltest_summary where student_id='" + st_id + "' and testsession_id='" + sess_id + "' and module_num='" + mod + "' ", con);
        SqlDataReader dr1 = cmd1.ExecuteReader();
        if (dr1.HasRows)
        {
            while (dr1.Read())
            {
                if (dr1[0].ToString() == "0" || if_zero_exists)
                {
                    string save_attempt = "0";
                    SqlCommand cmd3 = new SqlCommand("update practicaltest_summary set testsession_id= '" + sess_id + "' ,student_id='" + st_id + "' ,module_num='" + mod + "',attempt='" + attempt + "',date='" + date + "',result='" + result + "',instructor_id='" + staff_id + "',remark='" + remark + "',	ventilations='" + ventilation + "',compressions='" + compression + "',time_for_5cycles='" + cycle + "',practical_status='" + Practical_status + "' where student_id='" + STUDENT_ID + "' and testsession_id='" + sess_id + "' and module_num='" + mod + "' and attempt='" + save_attempt + "' ", con);
                    cmd3.ExecuteNonQuery();

                }
                else
                {

                    SqlCommand cmd12 = new SqlCommand("insert into practicaltest_summary (testsession_id,student_id,module_num,attempt,date,result,instructor_id,remark,ventilations,compressions,time_for_5cycles,practical_status) values ( '" + sess_id + "' ,'" + st_id + "','" + mod + "','" + attempt + "','" + date + "','" + result + "','" + staff_id + "' ,'" + remark + "','" + ventilation + "','" + compression + "','" + cycle + "','" + Practical_status + "')", con);
                    cmd12.ExecuteNonQuery();
                }
            }
        }
        else
        {
            SqlCommand cmd2 = new SqlCommand("insert into practicaltest_summary (testsession_id,student_id,module_num,attempt,date,result,instructor_id,remark,	ventilations,compressions,time_for_5cycles,practical_status) values ( '" + sess_id + "' ,'" + st_id + "','" + mod + "','" + attempt + "','" + date + "','" + result + "','" + staff_id + "' ,'" + remark + "','" + ventilation + "','" + compression + "','" + cycle + "','" + Practical_status + "')", con);
            cmd2.ExecuteNonQuery();
            SqlCommand cmd13 = new SqlCommand("update student_vs_testsession_details set practical_status='" + Practical_status + "' where student_id='" + STUDENT_ID + "' and testsession_id='" + sess_id + "' ", con);
            cmd13.ExecuteNonQuery();
        }

        con.Close();



    }
    public void make_checbox_invisible(string STUDENT_ID, string TESTSESSION_ID, string module_no)
    {
        SqlConnection con = obj.getcon();
        con.Open();

        SqlCommand cmd1 = new SqlCommand("Select attempt,date,result from practicaltest_summary where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt=(select max(attempt) from practicaltest_summary where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' )", con);
        SqlDataReader dr = cmd1.ExecuteReader();
        if (dr.HasRows == true)
        {
            while (dr.Read())
            {
                string s = dr[0].ToString();
                if (s == "1")
                {

                    TextBox4.Enabled = false;
                    TextBox6.Enabled = false;
                    for (int i = 1; i < 38; i += 3)
                    {
                        CheckBox cb = (CheckBox)Page.FindControl("CheckBox" + i);
                        cb.Enabled = false;
                    }

                    for (int i = 3; i < 40; i += 3)
                    {
                        CheckBox cb = (CheckBox)Page.FindControl("CheckBox" + i);
                        cb.Enabled = false;
                    }

                }

                if (s == "2")
                {


                    TextBox4.Enabled = false;
                    TextBox5.Enabled = false;
                    TextBox6.Enabled = false;

                    for (int i = 1; i < 38; i += 3)
                    {
                        CheckBox cb = (CheckBox)Page.FindControl("CheckBox" + i);
                        cb.Enabled = false;
                    }
                    for (int i = 2; i < 39; i += 3)
                    {
                        CheckBox cb = (CheckBox)Page.FindControl("CheckBox" + i);
                        cb.Enabled = false;
                    }

                }

                if (s == "3")
                {
                    TextBox4.Enabled = false;
                    TextBox5.Enabled = false;
                    TextBox6.Enabled = false;

                    for (int i = 1; i < 38; i += 3)
                    {
                        CheckBox cb = (CheckBox)Page.FindControl("CheckBox" + i);
                        cb.Enabled = false;
                    }
                    for (int i = 2; i < 39; i += 3)
                    {
                        CheckBox cb = (CheckBox)Page.FindControl("CheckBox" + i);
                        cb.Enabled = false;
                    }
                    for (int i = 3; i < 40; i += 3)
                    {
                        CheckBox cb = (CheckBox)Page.FindControl("CheckBox" + i);
                        cb.Enabled = false;
                    }

                }
                if (s == "0")
                {

                    TextBox5.Enabled = false;
                    TextBox6.Enabled = false;

                    for (int i = 2; i < 39; i += 3)
                    {
                        CheckBox cb = (CheckBox)Page.FindControl("CheckBox" + i);
                        cb.Enabled = false;
                    }
                    for (int i = 3; i < 40; i += 3)
                    {
                        CheckBox cb = (CheckBox)Page.FindControl("CheckBox" + i);
                        cb.Enabled = false;
                    }
                }

            }

        }
        else
        {
            TextBox4.Enabled = true;
            TextBox5.Enabled = false;
            TextBox6.Enabled = false;

            for (int i = 2; i < 39; i += 3)
            {
                CheckBox cb = (CheckBox)Page.FindControl("CheckBox" + i);
                cb.Enabled = false;
            }
            for (int i = 3; i < 40; i += 3)
            {
                CheckBox cb = (CheckBox)Page.FindControl("CheckBox" + i);
                cb.Enabled = false;
            }

        }


        con.Close();
    }
    protected void UploadButton_Click(object sender, EventArgs e)
    {
        Label1.Visible = false;
        string student_id = (string)Session["p_studentid"];
        string test_id = (string)Session["view_testid"];
        string filename = Path.GetFileName(FileUpload1.FileName);
        int fileSize = FileUpload1.PostedFile.ContentLength;
        string RootFolderName = ConfigurationManager.AppSettings["BCLSResultsFolder"];//D:/Hosting/10676289/html/bclstest/results

        if ((Path.GetExtension(filename) == ".pdf" || Path.GetExtension(filename) == ".ssx") && (fileSize <= (1.049e+6)))
        // if ((FileUpload1.PostedFile.ContentType.ToLower() == "application/pdf" || FileUpload1.PostedFile.ContentType.ToLower() == "application/ssx" )&& fileSize <= (1.049e+6)) //FILE NOT ACCEPTABLE WHEN SIZE >1MB
        {
            try
            {

                string practical = "practical";
               
                var path = RootFolderName+"/" + year + "/" + test_id + "/" + student_id + "/" + practical + "";

              //  var path = Server.MapPath("~/results/" + year + "/" + test_id + "/" + student_id + "/" + practical + "");
                var directory = new DirectoryInfo(path);
                if (directory.Exists == false)
                {
                    directory.Create();
                }
                //string filename = Path.GetFileName(FileUpload1.FileName);
                FileUpload1.SaveAs(RootFolderName+"/" + year + "/" + test_id + "/" + student_id + "/" + practical + "/"+ filename);
                Label1.Visible = true;
                Label1.Text = "Upload status: File uploaded!";
                Label1.ForeColor = System.Drawing.Color.Green;
                Session["f_name"] = null;

            }
            catch (Exception ex)
            {
                Label1.Visible = true;
                Label1.ForeColor = System.Drawing.Color.Red;
                Label1.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;

            }

        }

        else
        {
            Label1.ForeColor = System.Drawing.Color.Red;
            Label1.Visible = true;
            Label1.Text = "File size/format is not acceptable.Only pdf and ssx files of less than 1MB can be uploaded*";

        }
        bool is_folder_exists = FtpDirectoryExists1(RootFolderName+"/" + year + "/" + test_id + "/" + student_id + "/practical");
        if (is_folder_exists == true)
        {
            getfile(test_id, student_id);
        }

    }
 
    public void getfile(string test_id, string student_id)
    {
        try
        {
            string RootFolderName = ConfigurationManager.AppSettings["BCLSResultsFolder"];//D:/Hosting/10676289/html/bclstest/results

            string[] filesPath = Directory.GetFiles(RootFolderName + "/" + year + "/" + test_id + "/" + student_id + "/practical/");
            ArrayList allFiles = new ArrayList();
            LinkButton lnk;
            Panel1.Controls.Clear();
           // Panel1.Visible = false;
            //while (Panel1.Controls.Count > 0)
            //{
            //    Panel1.Controls[0].Dispose();
            //}
          //  Panel1.Visible = true;

            foreach (string path in filesPath)
            {
                if (Session["f_name"] != null)
                {
                    allFiles = (ArrayList)Session["f_name"];
                }
                allFiles.Add(path);
                string file = Path.GetFileName(path);
               
                //HyperLink hl = new HyperLink();
                //hl.Text = file;
                //hl.ID = file;
                //hl.Target = "_blank";
                // hl.NavigateUrl = RootFolderName + "/" + year + "/" + test_id + "/" + student_id + "/practical/" + file + "";

                rhythm_strip_path = RootFolderName + "/" + year + "/" + test_id + "/" + student_id + "/practical/" + file + "";

                Panel1.Controls.Add(new LiteralControl("<div>"));
           lnk  = new LinkButton();

                lnk.ID = file;
                lnk.Text = file;
                lnk.Click += new EventHandler(DynamicRythmStripClicked);
                lnk.CausesValidation = false;
                Panel1.Controls.Add(lnk);
                Panel1.Controls.Add(new LiteralControl("</div>"));
            }
        }
        catch (Exception ex)
        {
            var message = new JavaScriptSerializer().Serialize(ex.Message.ToString());
            var script = string.Format("alert({0});", message);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", script, true);
            return;
        }

    }

  

    private void DynamicRythmStripClicked(object sender, EventArgs e)
    {
        try
        {
          
            //Page.ClientScript.RegisterStartupScript(this.GetType(), "OpenWindow", "window.open('" + path + "','_newtab');", true);
            // string Geturl = "~/download/cpract_usermanual.pdf";
            if (rhythm_strip_path != string.Empty)
            {
                WebClient User = new WebClient();
                //Byte[] FileBuffer = User.DownloadData(Server.MapPath(path));
                Byte[] FileBuffer = User.DownloadData(rhythm_strip_path);
                if (FileBuffer != null)
                {
                    Response.ContentType = "application/pdf";
                    //Response.AddHeader("Content-Disposition", "attachment; filename=Filename.extension");
                    // Response.AddHeader("Content-Disposition", "attachment; filename=cpract_usermanual.pdf");

                    Response.AddHeader("content-length", FileBuffer.Length.ToString());
                    Response.BinaryWrite(FileBuffer);
                }
            }
            
                
        }
        catch (Exception ex)
        {
            var message = new JavaScriptSerializer().Serialize(ex.Message.ToString());
            var script = string.Format("alert({0});", message);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", script, true);
          
        }


    }

    //public void is_passed_both_test(string s_studentid, string s_testid)
    //{
    //    SqlConnection con12 = obj.getcon();
    //    con12.Open();
    //    string result = "Passed";
    //    SqlCommand cmd2 = new SqlCommand("select count(result) from practicaltest_summary where student_id='" + s_studentid + "' and testsession_id='" + s_testid + "' and practical_status='" + result + "' ", con12);
    //    SqlDataReader dr2 = cmd2.ExecuteReader();
    //    while (dr2.Read())
    //    {
    //        if (Convert.ToInt32(dr2[0]) >= 4)
    //        {
    //            SqlCommand cmd100 = new SqlCommand("select test_vs_student_status   from  student_vs_testsession_details where student_id='" + s_studentid + "'  and testsession_id='" + s_testid + "'  and test_vs_student_status='Passed' ", con12);
    //            SqlDataReader dr100 = cmd100.ExecuteReader();
    //            if (dr100.HasRows)
    //            {
    //                SqlCommand cmd111 = new SqlCommand("update student_details set date_of_pass=getdate() where student_id='" + s_studentid + "' ", con12);
    //                cmd111.ExecuteNonQuery();
    //            }
    //        }
    //    }
    //    con12.Close();
    //}


    public bool FtpDirectoryExists1(string directoryPath)
    {

        var path = directoryPath;
       // var path = Server.MapPath(directoryPath);
        var directory = new DirectoryInfo(path);
        if (directory.Exists == false)
        {
            return false;
        }
        else
        {
            return true;
        }
    }


    protected void bt_Save_Click(object sender, EventArgs e)
    {
        SqlConnection con = obj.getcon();
        con.Open();
        string staff_id = (string)Session["staffid"];
        STUDENT_ID = (string)Session["p_studentid"];
        TESTSESSION_ID = (string)Session["view_testid"];
        module_no = "module1";
        ArrayList al3 = new ArrayList();

        SqlCommand cmd33 = new SqlCommand("delete from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='module1' and attempt_num='0'", con);
        cmd33.ExecuteNonQuery();

        SqlCommand cmd3 = new SqlCommand("Select max(attempt) from practicaltest_summary where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' ", con);
        SqlDataReader dr3 = cmd3.ExecuteReader();

        while (dr3.Read())
        {

            string last_attempt_no = dr3[0].ToString();
            if (last_attempt_no == "1")
            {
                remark = TextBox5.Text;
                instructor2.Text = instructor;

                TextBox2.Text = DateTime.Now.ToString("dd-MM-yyyy");
                string attempt = "0";
                TextBox5.Enabled = true;

                if (CheckBox2.Checked && CheckBox5.Checked && CheckBox8.Checked && CheckBox11.Checked && CheckBox14.Checked && CheckBox17.Checked && CheckBox20.Checked && CheckBox23.Checked && CheckBox26.Checked && CheckBox29.Checked && CheckBox32.Checked && CheckBox35.Checked && CheckBox38.Checked)
                {
                    lb_attempt2_result.Text = "Passed";
                    result = lb_attempt2_result.Text;
                }
                else
                {
                    lb_attempt2_result.Text = "Referred";
                    result = lb_attempt2_result.Text;
                }

                if (CheckBox2.Checked || CheckBox5.Checked || CheckBox8.Checked || CheckBox11.Checked || CheckBox14.Checked || CheckBox17.Checked || CheckBox20.Checked || CheckBox23.Checked || CheckBox26.Checked || CheckBox29.Checked || CheckBox32.Checked || CheckBox35.Checked || CheckBox38.Checked)
                {

                    string Practical_status = "Saved";

                    module_summary(STUDENT_ID, TESTSESSION_ID, module_no, TextBox2.Text, staff_id, attempt, result, remark, tb_compression2.Text, tb_ventilation2.Text, tb_cycle2.Text, Practical_status);
                    make_checbox_invisible(STUDENT_ID, TESTSESSION_ID, module_no);
                }
                else
                {
                    SqlCommand cmd_check1_summary = new SqlCommand("select * from practicaltest_summary where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='" + attempt + "' and practical_status='Saved' ", con);
                    SqlDataReader dr_check1_summary = cmd_check1_summary.ExecuteReader();
                    dr_check1_summary.Read();
                    if (dr_check1_summary.HasRows)
                    {
                        SqlCommand cmd_check1_delete_summary = new SqlCommand("delete from practicaltest_summary where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='" + attempt + "' and practical_status='Saved' ", con);
                        cmd_check1_delete_summary.ExecuteNonQuery();
                    }
                }

                if (CheckBox23.Checked == true)
                {
                    string c23 = "c23";
                    module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c23, 8, attempt);
                    CheckBox23.Checked = true;
                }
                else
                {
                    SqlCommand cmd_check23 = new SqlCommand("select * from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c23' and attempt_num='0' ", con);
                    SqlDataReader dr_check23 = cmd_check23.ExecuteReader();
                    dr_check23.Read();
                    if (dr_check23.HasRows)
                    {
                        SqlCommand cmd_check23_delete = new SqlCommand("delete from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c23' and attempt_num='0' ", con);
                        cmd_check23_delete.ExecuteNonQuery();
                    }

                }
                if (CheckBox2.Checked == true)
                {

                    string c2 = "c2";
                    module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c2, 1, attempt);
                    CheckBox2.Checked = true;
                }
                else
                {
                    SqlCommand cmd_check2 = new SqlCommand("select * from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c2' and attempt_num='0' ", con);
                    SqlDataReader dr_check2 = cmd_check2.ExecuteReader();
                    dr_check2.Read();
                    if (dr_check2.HasRows)
                    {
                        SqlCommand cmd_check2_delete = new SqlCommand("delete from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c2' and attempt_num='0' ", con);
                        cmd_check2_delete.ExecuteNonQuery();
                    }

                }
                if (CheckBox5.Checked == true)
                {
                    string c5 = "c5";
                    module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c5, 2, attempt);
                    CheckBox5.Checked = true;
                }
                else
                {
                    SqlCommand cmd_check5 = new SqlCommand("select * from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c5' and attempt_num='0' ", con);
                    SqlDataReader dr_check5 = cmd_check5.ExecuteReader();
                    dr_check5.Read();
                    if (dr_check5.HasRows)
                    {
                        SqlCommand cmd_check5_delete = new SqlCommand("delete from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c5' and attempt_num='0' ", con);
                        cmd_check5_delete.ExecuteNonQuery();
                    }

                }
                if (CheckBox8.Checked == true)
                {
                    string c8 = "c8";
                    module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c8, 3, attempt);
                    CheckBox8.Checked = true;
                }
                else
                {
                    SqlCommand cmd_check8 = new SqlCommand("select * from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c8' and attempt_num='0' ", con);
                    SqlDataReader dr_check8 = cmd_check8.ExecuteReader();
                    dr_check8.Read();
                    if (dr_check8.HasRows)
                    {
                        SqlCommand cmd_check8_delete = new SqlCommand("delete from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c8' and attempt_num='0' ", con);
                        cmd_check8_delete.ExecuteNonQuery();
                    }

                }
                if (CheckBox11.Checked == true)
                {
                    string c11 = "c11";
                    module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c11, 4, attempt);
                    CheckBox11.Checked = true;
                }
                else
                {
                    SqlCommand cmd_check11 = new SqlCommand("select * from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c11' and attempt_num='0' ", con);
                    SqlDataReader dr_check11 = cmd_check11.ExecuteReader();
                    dr_check11.Read();
                    if (dr_check11.HasRows)
                    {
                        SqlCommand cmd_check11_delete = new SqlCommand("delete from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c11' and attempt_num='0' ", con);
                        cmd_check11_delete.ExecuteNonQuery();
                    }

                }
                if (CheckBox14.Checked == true)
                {

                    string c14 = "c14";
                    module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c14, 5, attempt);
                    CheckBox14.Checked = true;
                }
                else
                {
                    SqlCommand cmd_check14 = new SqlCommand("select * from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c14' and attempt_num='0' ", con);
                    SqlDataReader dr_check14 = cmd_check14.ExecuteReader();
                    dr_check14.Read();
                    if (dr_check14.HasRows)
                    {
                        SqlCommand cmd_check14_delete = new SqlCommand("delete from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c14' and attempt_num='0' ", con);
                        cmd_check14_delete.ExecuteNonQuery();
                    }

                }
                if (CheckBox17.Checked == true)
                {
                    string c17 = "c17";
                    module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c17, 6, attempt);
                    CheckBox17.Checked = true;
                }
                else
                {
                    SqlCommand cmd_check17 = new SqlCommand("select * from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c17' and attempt_num='0' ", con);
                    SqlDataReader dr_check17 = cmd_check17.ExecuteReader();
                    dr_check17.Read();
                    if (dr_check17.HasRows)
                    {
                        SqlCommand cmd_check17_delete = new SqlCommand("delete from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c17' and attempt_num='0' ", con);
                        cmd_check17_delete.ExecuteNonQuery();
                    }

                }

                if (CheckBox20.Checked == true)
                {
                    string c20 = "c20";
                    module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c20, 7, attempt);
                    CheckBox20.Checked = true;
                }
                else
                {
                    SqlCommand cmd_check20 = new SqlCommand("select * from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c20' and attempt_num='0' ", con);
                    SqlDataReader dr_check20 = cmd_check20.ExecuteReader();
                    dr_check20.Read();
                    if (dr_check20.HasRows)
                    {
                        SqlCommand cmd_check20_delete = new SqlCommand("delete from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c20' and attempt_num='0' ", con);
                        cmd_check20_delete.ExecuteNonQuery();
                    }

                }

                if (CheckBox26.Checked == true)
                {
                    string c26 = "c26";
                    module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c26, 9, attempt);
                    CheckBox26.Checked = true;
                }
                else
                {
                    SqlCommand cmd_check26 = new SqlCommand("select * from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c26' and attempt_num='0' ", con);
                    SqlDataReader dr_check26 = cmd_check26.ExecuteReader();
                    dr_check26.Read();
                    if (dr_check26.HasRows)
                    {
                        SqlCommand cmd_check26_delete = new SqlCommand("delete from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c26' and attempt_num='0' ", con);
                        cmd_check26_delete.ExecuteNonQuery();
                    }

                }

                if (CheckBox29.Checked == true)
                {
                    string c29 = "c29";
                    module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c29, 10, attempt);
                    CheckBox29.Checked = true;
                }
                else
                {
                    SqlCommand cmd_check29 = new SqlCommand("select * from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c29' and attempt_num='0' ", con);
                    SqlDataReader dr_check29 = cmd_check29.ExecuteReader();
                    dr_check29.Read();
                    if (dr_check29.HasRows)
                    {
                        SqlCommand cmd_check29_delete = new SqlCommand("delete from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c29' and attempt_num='0' ", con);
                        cmd_check29_delete.ExecuteNonQuery();
                    }

                }

                if (CheckBox32.Checked == true)
                {
                    string c32 = "c32";

                    module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c32, 11, attempt);
                    CheckBox32.Checked = true;
                }
                else
                {
                    SqlCommand cmd_check32 = new SqlCommand("select * from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c32' and attempt_num='0' ", con);
                    SqlDataReader dr_check32 = cmd_check32.ExecuteReader();
                    dr_check32.Read();
                    if (dr_check32.HasRows)
                    {
                        SqlCommand cmd_check32_delete = new SqlCommand("delete from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c32' and attempt_num='0' ", con);
                        cmd_check32_delete.ExecuteNonQuery();
                    }

                }
                if (CheckBox35.Checked == true)
                {

                    string c35 = "c35";

                    module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c35, 12, attempt);
                    CheckBox35.Checked = true;
                }
                else
                {
                    SqlCommand cmd_check35 = new SqlCommand("select * from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c35' and attempt_num='0' ", con);
                    SqlDataReader dr_check35 = cmd_check35.ExecuteReader();
                    dr_check35.Read();
                    if (dr_check35.HasRows)
                    {
                        SqlCommand cmd_check35_delete = new SqlCommand("delete from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c35' and attempt_num='0' ", con);
                        cmd_check35_delete.ExecuteNonQuery();
                    }

                }
                if (CheckBox38.Checked == true)
                {

                    string c38 = "c38";

                    module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c38, 13, attempt);
                    CheckBox38.Checked = true;
                }
                else
                {
                    SqlCommand cmd_check38 = new SqlCommand("select * from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c38' and attempt_num='0' ", con);
                    SqlDataReader dr_check38 = cmd_check38.ExecuteReader();
                    dr_check38.Read();
                    if (dr_check38.HasRows)
                    {
                        SqlCommand cmd_check38_delete = new SqlCommand("delete from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c38' and attempt_num='0' ", con);
                        cmd_check38_delete.ExecuteNonQuery();
                    }

                }
            }
            else if (last_attempt_no == "2")
            {
                remark = TextBox6.Text;

                instructor3.Text = instructor;
                instructor3.Enabled = true;
                instructor3.Visible = true;

                TextBox3.Text = DateTime.Now.ToString("dd-MM-yyyy");
                string attempt = "0";

                if (CheckBox3.Checked && CheckBox6.Checked && CheckBox9.Checked && CheckBox12.Checked && CheckBox15.Checked && CheckBox18.Checked && CheckBox21.Checked && CheckBox24.Checked && CheckBox27.Checked && CheckBox30.Checked && CheckBox33.Checked && CheckBox36.Checked && CheckBox39.Checked)
                {
                    lb_attempt3_result.Text = "Passed";
                    result = lb_attempt3_result.Text;
                }
                else
                {
                    lb_attempt3_result.Text = "Referred";
                    result = lb_attempt3_result.Text;
                }



                if (CheckBox3.Checked || CheckBox6.Checked || CheckBox9.Checked || CheckBox12.Checked || CheckBox15.Checked || CheckBox18.Checked || CheckBox21.Checked || CheckBox24.Checked || CheckBox27.Checked || CheckBox30.Checked || CheckBox33.Checked || CheckBox36.Checked || CheckBox39.Checked)
                {
                    string Practical_status = "Saved";
                    module_summary(STUDENT_ID, TESTSESSION_ID, module_no, TextBox3.Text, staff_id, attempt, result, remark, tb_compression3.Text, tb_ventilation3.Text, tb_cycle3.Text, Practical_status);
                    make_checbox_invisible(STUDENT_ID, TESTSESSION_ID, module_no);
                }
                else
                {
                    SqlCommand cmd_check2_summary = new SqlCommand("select * from practicaltest_summary where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='" + attempt + "' and practical_status='Saved' ", con);
                    SqlDataReader dr_check2_summary = cmd_check2_summary.ExecuteReader();
                    dr_check2_summary.Read();
                    if (dr_check2_summary.HasRows)
                    {
                        SqlCommand cmd_check2_delete_summary = new SqlCommand("delete from practicaltest_summary where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='" + attempt + "' and practical_status='Saved' ", con);
                        cmd_check2_delete_summary.ExecuteNonQuery();
                    }
                }


                TextBox6.Enabled = true;

                if (CheckBox3.Checked == true)
                {
                    string c3 = "c3";
                    module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c3, 1, attempt);
                    CheckBox3.Checked = true;
                }

                else
                {
                    SqlCommand cmd_check3 = new SqlCommand("select * from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c3' and attempt_num='0' ", con);
                    SqlDataReader dr_check3 = cmd_check3.ExecuteReader();
                    dr_check3.Read();
                    if (dr_check3.HasRows)
                    {
                        SqlCommand cmd_check3_delete = new SqlCommand("delete from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c3' and attempt_num='0' ", con);
                        cmd_check3_delete.ExecuteNonQuery();
                    }


                }

                if (CheckBox6.Checked == true)
                {
                    string c6 = "c6";

                    module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c6, 2, attempt);
                    CheckBox6.Checked = true;
                }
                else
                {
                    SqlCommand cmd_check6 = new SqlCommand("select * from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c6' and attempt_num='0' ", con);
                    SqlDataReader dr_check6 = cmd_check6.ExecuteReader();
                    dr_check6.Read();
                    if (dr_check6.HasRows)
                    {
                        SqlCommand cmd_check6_delete = new SqlCommand("delete from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c6' and attempt_num='0' ", con);
                        cmd_check6_delete.ExecuteNonQuery();
                    }


                }

                if (CheckBox9.Checked == true)
                {

                    string c9 = "c9";
                    module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c9, 3, attempt);
                    CheckBox9.Checked = true;
                }
                else
                {
                    SqlCommand cmd_check9 = new SqlCommand("select * from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c9' and attempt_num='0' ", con);
                    SqlDataReader dr_check9 = cmd_check9.ExecuteReader();
                    dr_check9.Read();
                    if (dr_check9.HasRows)
                    {
                        SqlCommand cmd_check9_delete = new SqlCommand("delete from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c9' and attempt_num='0' ", con);
                        cmd_check9_delete.ExecuteNonQuery();
                    }


                }

                if (CheckBox12.Checked == true)
                {

                    string c12 = "c12";

                    module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c12, 4, attempt);
                    CheckBox12.Checked = true;
                }

                else
                {
                    SqlCommand cmd_check12 = new SqlCommand("select * from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c12' and attempt_num='0' ", con);
                    SqlDataReader dr_check12 = cmd_check12.ExecuteReader();
                    dr_check12.Read();
                    if (dr_check12.HasRows)
                    {
                        SqlCommand cmd_check12_delete = new SqlCommand("delete from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c12' and attempt_num='0' ", con);
                        cmd_check12_delete.ExecuteNonQuery();
                    }


                }
                if (CheckBox15.Checked == true)
                {

                    string c15 = "c15";

                    module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c15, 5, attempt);
                    CheckBox15.Checked = true;
                }

                else
                {
                    SqlCommand cmd_check15 = new SqlCommand("select * from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c15' and attempt_num='0' ", con);
                    SqlDataReader dr_check15 = cmd_check15.ExecuteReader();
                    dr_check15.Read();
                    if (dr_check15.HasRows)
                    {
                        SqlCommand cmd_check15_delete = new SqlCommand("delete from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c15' and attempt_num='0' ", con);
                        cmd_check15_delete.ExecuteNonQuery();
                    }


                }
                if (CheckBox18.Checked == true)
                {

                    string c18 = "c18";

                    module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c18, 6, attempt);
                    CheckBox18.Checked = true;
                }
                else
                {
                    SqlCommand cmd_check18 = new SqlCommand("select * from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c18' and attempt_num='0' ", con);
                    SqlDataReader dr_check18 = cmd_check18.ExecuteReader();
                    dr_check18.Read();
                    if (dr_check18.HasRows)
                    {
                        SqlCommand cmd_check18_delete = new SqlCommand("delete from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c18' and attempt_num='0' ", con);
                        cmd_check18_delete.ExecuteNonQuery();
                    }
                }

                if (CheckBox21.Checked == true)
                {

                    string c21 = "c21";
                    module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c21, 7, attempt);
                    CheckBox21.Checked = true;
                }
                else
                {
                    SqlCommand cmd_check21 = new SqlCommand("select * from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c21' and attempt_num='0' ", con);
                    SqlDataReader dr_check21 = cmd_check21.ExecuteReader();
                    dr_check21.Read();
                    if (dr_check21.HasRows)
                    {
                        SqlCommand cmd_check21_delete = new SqlCommand("delete from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c21' and attempt_num='0' ", con);
                        cmd_check21_delete.ExecuteNonQuery();
                    }
                }
                if (CheckBox24.Checked == true)
                {

                    string c24 = "c24";
                    module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c24, 8, attempt);
                    CheckBox24.Checked = true;
                }
                else
                {
                    SqlCommand cmd_check24 = new SqlCommand("select * from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c24' and attempt_num='0' ", con);
                    SqlDataReader dr_check24 = cmd_check24.ExecuteReader();
                    dr_check24.Read();
                    if (dr_check24.HasRows)
                    {
                        SqlCommand cmd_check24_delete = new SqlCommand("delete from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c24' and attempt_num='0' ", con);
                        cmd_check24_delete.ExecuteNonQuery();
                    }
                }

                if (CheckBox27.Checked == true)
                {
                    string c27 = "c27";
                    TextBox3.Text = DateTime.Now.ToString("dd-MM-yyyy");
                    module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c27, 9, attempt);
                    CheckBox27.Checked = true;
                }
                else
                {
                    SqlCommand cmd_check27 = new SqlCommand("select * from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c27' and attempt_num='0' ", con);
                    SqlDataReader dr_check27 = cmd_check27.ExecuteReader();
                    dr_check27.Read();
                    if (dr_check27.HasRows)
                    {
                        SqlCommand cmd_check27_delete = new SqlCommand("delete from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c27' and attempt_num='0' ", con);
                        cmd_check27_delete.ExecuteNonQuery();
                    }
                }
                if (CheckBox30.Checked == true)
                {

                    string c30 = "c30";
                    module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c30, 10, attempt);
                    CheckBox30.Checked = true;
                }
                else
                {
                    SqlCommand cmd_check30 = new SqlCommand("select * from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c30' and attempt_num='0' ", con);
                    SqlDataReader dr_check30 = cmd_check30.ExecuteReader();
                    dr_check30.Read();
                    if (dr_check30.HasRows)
                    {
                        SqlCommand cmd_check30_delete = new SqlCommand("delete from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c30' and attempt_num='0' ", con);
                        cmd_check30_delete.ExecuteNonQuery();
                    }
                }
                if (CheckBox33.Checked == true)
                {
                    string c33 = "c33";
                    module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c33, 11, attempt);
                    CheckBox33.Checked = true;
                }
                else
                {
                    SqlCommand cmd_check33 = new SqlCommand("select * from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c33' and attempt_num='0' ", con);
                    SqlDataReader dr_check33 = cmd_check33.ExecuteReader();
                    dr_check33.Read();
                    if (dr_check33.HasRows)
                    {
                        SqlCommand cmd_check33_delete = new SqlCommand("delete from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c33' and attempt_num='0' ", con);
                        cmd_check33_delete.ExecuteNonQuery();
                    }
                }
                if (CheckBox36.Checked == true)
                {
                    string c36 = "c36";
                    module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c36, 12, attempt);
                    CheckBox36.Checked = true;
                }
                else
                {
                    SqlCommand cmd_check36 = new SqlCommand("select * from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c33' and attempt_num='0' ", con);
                    SqlDataReader dr_check36 = cmd_check36.ExecuteReader();
                    dr_check36.Read();
                    if (dr_check36.HasRows)
                    {
                        SqlCommand cmd_check36_delete = new SqlCommand("delete from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c36' and attempt_num='0' ", con);
                        cmd_check36_delete.ExecuteNonQuery();
                    }
                }
                if (CheckBox39.Checked == true)
                {
                    string c39 = "c39";
                    module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c39, 13, attempt);
                    CheckBox39.Checked = true;
                }
                else
                {
                    SqlCommand cmd_check39 = new SqlCommand("select * from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c39' and attempt_num='0' ", con);
                    SqlDataReader dr_check39 = cmd_check39.ExecuteReader();
                    dr_check39.Read();
                    if (dr_check39.HasRows)
                    {
                        SqlCommand cmd_check39_delete = new SqlCommand("delete from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c39' and attempt_num='0' ", con);
                        cmd_check39_delete.ExecuteNonQuery();
                    }
                }
            }
            else if (last_attempt_no == "3")
            {
            }
            else//if just started the first attempt
            {
                remark = TextBox4.Text;
                TextBox1.Text = DateTime.Now.ToString("dd-MM-yyyy");
                string attempt = "0";
                if (CheckBox1.Checked && CheckBox4.Checked && CheckBox7.Checked && CheckBox10.Checked && CheckBox13.Checked && CheckBox16.Checked && CheckBox19.Checked && CheckBox22.Checked && CheckBox25.Checked && CheckBox28.Checked && CheckBox31.Checked && CheckBox34.Checked && CheckBox37.Checked)
                {
                    lb_attempt1_result.Text = "Passed";
                    result = lb_attempt1_result.Text;
                }
                else
                {
                    lb_attempt1_result.Text = "Referred";
                    result = lb_attempt1_result.Text;
                }

                string compression = tb_compression1.Text;
                string ventilation = tb_ventilation1.Text;
                string cycle = tb_cycle1.Text;


                if (CheckBox1.Checked || CheckBox4.Checked || CheckBox7.Checked || CheckBox10.Checked || CheckBox13.Checked || CheckBox16.Checked || CheckBox19.Checked || CheckBox22.Checked || CheckBox25.Checked || CheckBox28.Checked || CheckBox31.Checked || CheckBox34.Checked || CheckBox37.Checked)
                {

                    string Practical_status = "Saved";
                    module_summary(STUDENT_ID, TESTSESSION_ID, module_no, TextBox1.Text, staff_id, attempt, result, remark, compression, ventilation, cycle, Practical_status);
                    make_checbox_invisible(STUDENT_ID, TESTSESSION_ID, module_no);
                }
                else
                {
                    SqlCommand cmd_check1_summary = new SqlCommand("select * from practicaltest_summary where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='" + attempt + "' and practical_status='Saved' ", con);
                    SqlDataReader dr_check1_summary = cmd_check1_summary.ExecuteReader();
                    dr_check1_summary.Read();
                    if (dr_check1_summary.HasRows)
                    {
                        SqlCommand cmd_check1_delete_summary = new SqlCommand("delete from practicaltest_summary where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='" + attempt + "' and practical_status='Saved' ", con);
                        cmd_check1_delete_summary.ExecuteNonQuery();
                    }
                }



                if (CheckBox1.Checked == true)
                {
                    string c1 = "c1";
                    module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c1, 1, attempt);

                    CheckBox1.Checked = true;
                }
                else
                {
                    SqlCommand cmd_check1 = new SqlCommand("select * from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c1' and attempt_num='0' ", con);
                    SqlDataReader dr_check1 = cmd_check1.ExecuteReader();
                    dr_check1.Read();
                    if (dr_check1.HasRows)
                    {
                        SqlCommand cmd_check1_delete = new SqlCommand("delete from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c1' and attempt_num='0' ", con);
                        cmd_check1_delete.ExecuteNonQuery();
                    }


                }
                if (CheckBox4.Checked == true)
                {

                    string c4 = "c4";
                    module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c4, 2, attempt);

                    CheckBox4.Checked = true;
                }
                else
                {
                    SqlCommand cmd_check4 = new SqlCommand("select * from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c4' and attempt_num='0' ", con);
                    SqlDataReader dr_check4 = cmd_check4.ExecuteReader();
                    dr_check4.Read();
                    if (dr_check4.HasRows)
                    {
                        SqlCommand cmd_check4_delete = new SqlCommand("delete from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c4' and attempt_num='0' ", con);
                        cmd_check4_delete.ExecuteNonQuery();
                    }


                }
                if (CheckBox7.Checked == true)
                {


                    string c7 = "c7";

                    module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c7, 3, attempt);

                    CheckBox7.Checked = true;
                }
                else
                {
                    SqlCommand cmd_check7 = new SqlCommand("select * from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c7' and attempt_num='0' ", con);
                    SqlDataReader dr_check7 = cmd_check7.ExecuteReader();
                    dr_check7.Read();
                    if (dr_check7.HasRows)
                    {
                        SqlCommand cmd_check7_delete = new SqlCommand("delete from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c7' and attempt_num='0' ", con);
                        cmd_check7_delete.ExecuteNonQuery();
                    }


                }

                if (CheckBox10.Checked == true)
                {

                    string c10 = "c10";

                    module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c10, 4, attempt);

                    CheckBox10.Checked = true;
                }
                else
                {
                    SqlCommand cmd_check10 = new SqlCommand("select * from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c10' and attempt_num='0' ", con);
                    SqlDataReader dr_check10 = cmd_check10.ExecuteReader();
                    dr_check10.Read();
                    if (dr_check10.HasRows)
                    {
                        SqlCommand cmd_check10_delete = new SqlCommand("delete from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c10' and attempt_num='0' ", con);
                        cmd_check10_delete.ExecuteNonQuery();
                    }


                }
                if (CheckBox13.Checked == true)
                {

                    string c13 = "c13";

                    module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c13, 5, attempt);

                    CheckBox13.Checked = true;
                }
                else
                {
                    SqlCommand cmd_check13 = new SqlCommand("select * from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c13' and attempt_num='0' ", con);
                    SqlDataReader dr_check13 = cmd_check13.ExecuteReader();
                    dr_check13.Read();
                    if (dr_check13.HasRows)
                    {
                        SqlCommand cmd_check13_delete = new SqlCommand("delete from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c13' and attempt_num='0' ", con);
                        cmd_check13_delete.ExecuteNonQuery();
                    }


                }
                if (CheckBox16.Checked == true)
                {

                    string c16 = "c16";
                    module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c16, 6, attempt);

                    CheckBox16.Checked = true;
                }
                else
                {
                    SqlCommand cmd_check16 = new SqlCommand("select * from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c16' and attempt_num='0' ", con);
                    SqlDataReader dr_check16 = cmd_check16.ExecuteReader();
                    dr_check16.Read();
                    if (dr_check16.HasRows)
                    {
                        SqlCommand cmd_check16_delete = new SqlCommand("delete from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c16' and attempt_num='0' ", con);
                        cmd_check16_delete.ExecuteNonQuery();
                    }


                }

                if (CheckBox19.Checked == true)
                {

                    string c19 = "c19";

                    module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c19, 7, attempt);

                    CheckBox19.Checked = true;
                }
                else
                {
                    SqlCommand cmd_check19 = new SqlCommand("select * from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c19' and attempt_num='0' ", con);
                    SqlDataReader dr_check19 = cmd_check19.ExecuteReader();
                    dr_check19.Read();
                    if (dr_check19.HasRows)
                    {
                        SqlCommand cmd_check19_delete = new SqlCommand("delete from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c19' and attempt_num='0' ", con);
                        cmd_check19_delete.ExecuteNonQuery();
                    }


                }
                if (CheckBox22.Checked == true)
                {

                    string c22 = "c22";
                    module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c22, 8, attempt);
                    CheckBox22.Checked = true;
                }
                else
                {
                    SqlCommand cmd_check22 = new SqlCommand("select * from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c22' and attempt_num='0' ", con);
                    SqlDataReader dr_check22 = cmd_check22.ExecuteReader();
                    dr_check22.Read();
                    if (dr_check22.HasRows)
                    {
                        SqlCommand cmd_check22_delete = new SqlCommand("delete from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c22' and attempt_num='0' ", con);
                        cmd_check22_delete.ExecuteNonQuery();
                    }


                }
                if (CheckBox25.Checked == true)
                {

                    string c25 = "c25";
                    module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c25, 9, attempt);
                    CheckBox25.Checked = true;
                }
                else
                {
                    SqlCommand cmd_check25 = new SqlCommand("select * from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c25' and attempt_num='0' ", con);
                    SqlDataReader dr_check25 = cmd_check25.ExecuteReader();
                    dr_check25.Read();
                    if (dr_check25.HasRows)
                    {
                        SqlCommand cmd_check25_delete = new SqlCommand("delete from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c25' and attempt_num='0' ", con);
                        cmd_check25_delete.ExecuteNonQuery();
                    }


                }
                if (CheckBox28.Checked == true)
                {

                    string c28 = "c28";
                    module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c28, 10, attempt);
                    CheckBox28.Checked = true;
                }
                else
                {
                    SqlCommand cmd_check28 = new SqlCommand("select * from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c28' and attempt_num='0' ", con);
                    SqlDataReader dr_check28 = cmd_check28.ExecuteReader();
                    dr_check28.Read();
                    if (dr_check28.HasRows)
                    {
                        SqlCommand cmd_check28_delete = new SqlCommand("delete from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c28' and attempt_num='0' ", con);
                        cmd_check28_delete.ExecuteNonQuery();
                    }

                }
                if (CheckBox31.Checked == true)
                {

                    string c31 = "c31";
                    module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c31, 11, attempt);
                    CheckBox31.Checked = true;
                }
                else
                {
                    SqlCommand cmd_check31 = new SqlCommand("select * from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c31' and attempt_num='0' ", con);
                    SqlDataReader dr_check31 = cmd_check31.ExecuteReader();
                    dr_check31.Read();
                    if (dr_check31.HasRows)
                    {
                        SqlCommand cmd_check31_delete = new SqlCommand("delete from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c31' and attempt_num='0' ", con);
                        cmd_check31_delete.ExecuteNonQuery();
                    }

                }
                if (CheckBox34.Checked == true)
                {

                    string c34 = "c34";
                    module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c34, 12, attempt);
                    CheckBox34.Checked = true;
                }
                else
                {
                    SqlCommand cmd_check34 = new SqlCommand("select * from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c34' and attempt_num='0' ", con);
                    SqlDataReader dr_check34 = cmd_check34.ExecuteReader();
                    dr_check34.Read();
                    if (dr_check34.HasRows)
                    {
                        SqlCommand cmd_check34_delete = new SqlCommand("delete from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c34' and attempt_num='0' ", con);
                        cmd_check34_delete.ExecuteNonQuery();
                    }

                }
                if (CheckBox37.Checked == true)
                {

                    string c37 = "c37";

                    module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c37, 13, attempt);

                    CheckBox37.Checked = true;
                }
                else
                {
                    SqlCommand cmd_check37 = new SqlCommand("select * from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c37' and attempt_num='0' ", con);
                    SqlDataReader dr_check37 = cmd_check37.ExecuteReader();
                    dr_check37.Read();
                    if (dr_check37.HasRows)
                    {
                        SqlCommand cmd_check37_delete = new SqlCommand("delete from practicaltest_details where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' and attempt='c37' and attempt_num='0' ", con);
                        cmd_check37_delete.ExecuteNonQuery();
                    }

                }
            }
        }
        con.Close();

    }
    protected void btn_submit_click(object sender, ImageClickEventArgs e)
    {

        string confirmValue122 = Request.Form["confirm_value"];
        if (confirmValue122 == "OK")
        {
            SqlConnection con = obj.getcon();
            con.Open();

            string staff_id = (string)Session["staffid"];
            STUDENT_ID = (string)Session["p_studentid"];
            TESTSESSION_ID = (string)Session["view_testid"];
            module_no = "module1";
            ArrayList al3 = new ArrayList();

            SqlCommand cmd3 = new SqlCommand("Select max(attempt) from practicaltest_summary where student_id='" + STUDENT_ID + "' and testsession_id='" + TESTSESSION_ID + "' and module_num='" + module_no + "' ", con);
            SqlDataReader dr3 = cmd3.ExecuteReader();

            while (dr3.Read())
            {
                string last_attempt_no = dr3[0].ToString();
                if (last_attempt_no == "1")
                {

                    TextBox2.Text = DateTime.Now.ToString("dd-MM-yyyy");
                    string attempt = "2";

                    if (CheckBox2.Checked && CheckBox5.Checked && CheckBox8.Checked && CheckBox11.Checked && CheckBox14.Checked && CheckBox17.Checked && CheckBox20.Checked && CheckBox23.Checked && CheckBox26.Checked && CheckBox29.Checked && CheckBox32.Checked && CheckBox35.Checked && CheckBox38.Checked && tb_compression2.Text != "" && tb_cycle2.Text != "" && tb_ventilation2.Text != "")
                    {
                        lb_attempt2_result.Text = "Passed";
                        result = lb_attempt2_result.Text;
                    }
                    else
                    {
                        lb_attempt2_result.Text = "Referred";
                        result = lb_attempt2_result.Text;
                    }
                    remark = TextBox5.Text;

                    if (result == "Referred")// if the status is "Referred" and comments length is not 10 characters
                    {
                        if (remark.Length < 10)
                        {
                            string script = "<script type=\"text/javascript\">alert('Submission UN-SUCCESSFUL. Remarks (minimum 10 characters) compulsory when submitting referred students');</script>";
                            ClientScript.RegisterClientScriptBlock(this.GetType(), "Alert", script);
                        }
                        else
                        {
                            bt_allpass.Visible = false;
                            bt_allpass2.Visible = false;
                            btn_submit.Visible = false;
                            btn_submit2.Visible = false;
                            string Practical_status = lb_attempt2_result.Text;
                            module_summary(STUDENT_ID, TESTSESSION_ID, module_no, TextBox2.Text, staff_id, attempt, result, remark, tb_compression2.Text, tb_ventilation2.Text, tb_cycle2.Text, Practical_status);
                            make_checbox_invisible(STUDENT_ID, TESTSESSION_ID, module_no);


                            TextBox5.Enabled = false;
                            TextBox6.Enabled = false;

                            instructor2.Text = instructor;
                            instructor2.Enabled = false;
                            instructor2.Visible = true;
                            TextBox2.Enabled = false;

                            tb_compression2.Enabled = false;
                            tb_cycle2.Enabled = false;
                            tb_ventilation2.Enabled = false;
                            if (CheckBox23.Checked == true)
                            {
                                string c23 = "c23";
                                module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c23, 8, attempt);
                                CheckBox23.Enabled = false;
                                CheckBox23.Checked = true;
                            }
                            if (CheckBox2.Checked == true)
                            {
                                string c2 = "c2";
                                module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c2, 1, attempt);
                                CheckBox2.Enabled = false;
                                CheckBox2.Checked = true;
                            }
                            if (CheckBox5.Checked == true)
                            {
                                string c5 = "c5";
                                module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c5, 2, attempt);
                                CheckBox5.Enabled = false;
                                CheckBox5.Checked = true;
                            }

                            if (CheckBox8.Checked == true)
                            {
                                string c8 = "c8";
                                module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c8, 3, attempt);
                                CheckBox8.Enabled = false;
                                CheckBox8.Checked = true;
                            }
                            if (CheckBox11.Checked == true)
                            {
                                string c11 = "c11";
                                module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c11, 4, attempt);
                                CheckBox11.Enabled = false;
                                CheckBox11.Checked = true;
                            }
                            if (CheckBox14.Checked == true)
                            {

                                string c14 = "c14";
                                module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c14, 5, attempt);
                                CheckBox14.Enabled = false;
                                CheckBox14.Checked = true;
                            }
                            if (CheckBox17.Checked == true)
                            {
                                string c17 = "c17";
                                module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c17, 6, attempt);
                                CheckBox17.Enabled = false;
                                CheckBox17.Checked = true;
                            }

                            if (CheckBox20.Checked == true)
                            {
                                string c20 = "c20";

                                module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c20, 7, attempt);
                                CheckBox20.Enabled = false;
                                CheckBox20.Checked = true;
                            }

                            if (CheckBox26.Checked == true)
                            {
                                string c26 = "c26";
                                module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c26, 9, attempt);
                                CheckBox26.Enabled = false;
                                CheckBox26.Checked = true;
                            }
                            if (CheckBox29.Checked == true)
                            {
                                string c29 = "c29";
                                module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c29, 10, attempt);
                                CheckBox29.Enabled = false;
                                CheckBox29.Checked = true;
                            }

                            if (CheckBox32.Checked == true)
                            {
                                string c32 = "c32";
                                module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c32, 11, attempt);
                                CheckBox32.Enabled = false;
                                CheckBox32.Checked = true;
                            }
                            if (CheckBox35.Checked == true)
                            {
                                string c35 = "c35";
                                module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c35, 12, attempt);
                                CheckBox35.Enabled = false;
                                CheckBox35.Checked = true;
                            }
                            if (CheckBox38.Checked == true)
                            {
                                string c38 = "c38";
                                module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c38, 13, attempt);

                                CheckBox38.Enabled = false;
                                CheckBox38.Checked = true;
                            }


                        }
                    }
                    else //passed
                    {
                        bt_allpass.Visible = false;
                        bt_allpass2.Visible = false;
                        btn_submit.Visible = false;
                        btn_submit2.Visible = false;
                       
                        string Practical_status = lb_attempt2_result.Text;
                        module_summary(STUDENT_ID, TESTSESSION_ID, module_no, TextBox2.Text, staff_id, attempt, result, remark, tb_compression2.Text, tb_ventilation2.Text, tb_cycle2.Text, Practical_status);
                        make_checbox_invisible(STUDENT_ID, TESTSESSION_ID, module_no);


                        TextBox5.Enabled = false;
                        TextBox6.Enabled = false;

                        instructor2.Text = instructor;
                        instructor2.Enabled = false;
                        instructor2.Visible = true;
                        TextBox2.Enabled = false;

                        tb_compression2.Enabled = false;
                        tb_cycle2.Enabled = false;
                        tb_ventilation2.Enabled = false;
                        if (CheckBox23.Checked == true)
                        {
                            string c23 = "c23";
                            module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c23, 8, attempt);
                            CheckBox23.Enabled = false;
                            CheckBox23.Checked = true;
                        }
                        if (CheckBox2.Checked == true)
                        {
                            string c2 = "c2";
                            module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c2, 1, attempt);
                            CheckBox2.Enabled = false;
                            CheckBox2.Checked = true;
                        }
                        if (CheckBox5.Checked == true)
                        {
                            string c5 = "c5";
                            module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c5, 2, attempt);
                            CheckBox5.Enabled = false;
                            CheckBox5.Checked = true;
                        }

                        if (CheckBox8.Checked == true)
                        {
                            string c8 = "c8";
                            module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c8, 3, attempt);
                            CheckBox8.Enabled = false;
                            CheckBox8.Checked = true;
                        }
                        if (CheckBox11.Checked == true)
                        {
                            string c11 = "c11";
                            module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c11, 4, attempt);
                            CheckBox11.Enabled = false;
                            CheckBox11.Checked = true;
                        }
                        if (CheckBox14.Checked == true)
                        {

                            string c14 = "c14";
                            module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c14, 5, attempt);
                            CheckBox14.Enabled = false;
                            CheckBox14.Checked = true;
                        }
                        if (CheckBox17.Checked == true)
                        {
                            string c17 = "c17";
                            module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c17, 6, attempt);
                            CheckBox17.Enabled = false;
                            CheckBox17.Checked = true;
                        }

                        if (CheckBox20.Checked == true)
                        {
                            string c20 = "c20";

                            module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c20, 7, attempt);
                            CheckBox20.Enabled = false;
                            CheckBox20.Checked = true;
                        }

                        if (CheckBox26.Checked == true)
                        {
                            string c26 = "c26";
                            module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c26, 9, attempt);
                            CheckBox26.Enabled = false;
                            CheckBox26.Checked = true;
                        }
                        if (CheckBox29.Checked == true)
                        {
                            string c29 = "c29";
                            module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c29, 10, attempt);
                            CheckBox29.Enabled = false;
                            CheckBox29.Checked = true;
                        }

                        if (CheckBox32.Checked == true)
                        {
                            string c32 = "c32";
                            module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c32, 11, attempt);
                            CheckBox32.Enabled = false;
                            CheckBox32.Checked = true;
                        }
                        if (CheckBox35.Checked == true)
                        {
                            string c35 = "c35";
                            module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c35, 12, attempt);
                            CheckBox35.Enabled = false;
                            CheckBox35.Checked = true;
                        }
                        if (CheckBox38.Checked == true)
                        {
                            string c38 = "c38";
                            module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c38, 13, attempt);

                            CheckBox38.Enabled = false;
                            CheckBox38.Checked = true;
                        }

                    }


                }

                else if (last_attempt_no == "2")
                {

                    remark = TextBox6.Text;

                    TextBox3.Text = DateTime.Now.ToString("dd-MM-yyyy");
                    string attempt = "3";

                    if (CheckBox3.Checked && CheckBox6.Checked && CheckBox9.Checked && CheckBox12.Checked && CheckBox15.Checked && CheckBox18.Checked && CheckBox21.Checked && CheckBox24.Checked && CheckBox27.Checked && CheckBox30.Checked && CheckBox33.Checked && CheckBox36.Checked && CheckBox39.Checked && tb_compression3.Text != "" && tb_cycle3.Text != "" && tb_ventilation3.Text != "")
                    {
                        lb_attempt3_result.Text = "Passed";
                        result = lb_attempt3_result.Text;
                    }
                    else
                    {
                        lb_attempt3_result.Text = "Referred";
                        result = lb_attempt3_result.Text;
                    }

                    if (result == "Referred")// if the status is "Referred" and comments length is not 10 characters
                    {
                        if (remark.Length < 10)
                        {
                            string script = "<script type=\"text/javascript\">alert('Submission UN-SUCCESSFUL. Remarks (minimum 10 characters) compulsory when submitting referred students');</script>";
                            ClientScript.RegisterClientScriptBlock(this.GetType(), "Alert", script);
                        }
                        else
                        {
                            bt_allpass.Visible = false;
                            bt_allpass2.Visible = false;
                            btn_submit.Visible = false;
                            btn_submit2.Visible = false;
                            string Practical_status = lb_attempt3_result.Text;
                            module_summary(STUDENT_ID, TESTSESSION_ID, module_no, TextBox3.Text, staff_id, attempt, result, remark, tb_compression3.Text, tb_ventilation3.Text, tb_cycle3.Text, Practical_status);
                            make_checbox_invisible(STUDENT_ID, TESTSESSION_ID, module_no);

                            TextBox6.Enabled = false;
                            TextBox5.Enabled = false;
                            TextBox4.Enabled = false;

                            instructor3.Text = instructor;
                            instructor3.Enabled = true;
                            instructor3.Visible = true;

                            tb_compression3.Enabled = false;
                            tb_cycle3.Enabled = false;
                            tb_ventilation3.Enabled = false;
                            if (CheckBox3.Checked == true)
                            {
                                string c3 = "c3";
                                module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c3, 1, attempt);

                                CheckBox3.Enabled = false;
                                CheckBox3.Checked = true;
                            }
                            if (CheckBox6.Checked == true)
                            {
                                string c6 = "c6";
                                module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c6, 2, attempt);

                                CheckBox6.Enabled = false;
                                CheckBox6.Checked = true;
                            }

                            if (CheckBox9.Checked == true)
                            {
                                string c9 = "c9";
                                module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c9, 3, attempt);
                                CheckBox9.Enabled = false;
                                CheckBox9.Checked = true;
                            }
                            if (CheckBox12.Checked == true)
                            {
                                string c12 = "c12";
                                module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c12, 4, attempt);
                                CheckBox12.Enabled = false;
                                CheckBox12.Checked = true;
                            }
                            if (CheckBox15.Checked == true)
                            {
                                string c15 = "c15";
                                module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c15, 5, attempt);
                                CheckBox15.Enabled = false;
                                CheckBox15.Checked = true;
                            }
                            if (CheckBox18.Checked == true)
                            {
                                string c18 = "c18";
                                module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c18, 6, attempt);

                                CheckBox18.Enabled = false;
                                CheckBox18.Checked = true;
                            }
                            if (CheckBox21.Checked == true)
                            {
                                string c21 = "c21";
                                module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c21, 7, attempt);
                                CheckBox21.Enabled = false;
                                CheckBox21.Checked = true;
                            }
                            if (CheckBox24.Checked == true)
                            {
                                string c24 = "c24";
                                module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c24, 8, attempt);

                                CheckBox24.Enabled = false;
                                CheckBox24.Checked = true;
                            }
                            if (CheckBox27.Checked == true)
                            {
                                string c27 = "c27";
                                TextBox3.Text = DateTime.Now.ToString("dd-MM-yyyy");
                                module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c27, 9, attempt);

                                CheckBox27.Enabled = false;
                                CheckBox27.Checked = true;
                            }
                            if (CheckBox30.Checked == true)
                            {
                                string c30 = "c30";
                                module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c30, 10, attempt);

                                CheckBox30.Enabled = false;
                                CheckBox30.Checked = true;
                            }
                            if (CheckBox33.Checked == true)
                            {
                                string c33 = "c33";
                                module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c33, 11, attempt);

                                CheckBox33.Enabled = false;
                                CheckBox33.Checked = true;
                            }

                            if (CheckBox36.Checked == true)
                            {
                                string c36 = "c36";
                                module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c36, 12, attempt);
                                CheckBox36.Enabled = false;
                                CheckBox36.Checked = true;
                            }
                            if (CheckBox39.Checked == true)
                            {

                                string c39 = "c39";
                                module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c39, 13, attempt);
                                CheckBox39.Enabled = false;
                                CheckBox39.Checked = true;
                            }

                            SqlConnection con99 = obj.getcon(); //if all attempt referred
                            con99.Open();
                            SqlCommand cmd99 = new SqlCommand("select practical_status from practicaltest_summary where attempt='1' and testsession_id='" + TESTSESSION_ID + "' and student_id='" + STUDENT_ID + "' and module_num='module1' and practical_status =(select practical_status from  practicaltest_summary where  attempt='2' and testsession_id='" + TESTSESSION_ID + "' and student_id='" + STUDENT_ID + "' and module_num='module1'  ) ", con99);

                            SqlDataReader dr99 = cmd99.ExecuteReader();
                            if (dr99.HasRows)
                            {
                                while (dr99.Read())
                                {
                                    if (dr99[0].ToString() == "Referred" && lb_attempt3_result.Text == "Referred")
                                    {
                                        SqlCommand cmd38 = new SqlCommand("update practicaltest_summary set practical_status='Failed' where testsession_id='" + TESTSESSION_ID + "' and student_id='" + STUDENT_ID + "' and module_num= 'module1'", con99);
                                        cmd38.ExecuteNonQuery();
                                    }
                                }

                            }
                            con99.Close();

                        }
                    }

                    else
                    {

                        bt_allpass.Visible = false;
                        bt_allpass2.Visible = false;
                        btn_submit.Visible = false;
                        btn_submit2.Visible = false;
                        string Practical_status = lb_attempt3_result.Text;
                        module_summary(STUDENT_ID, TESTSESSION_ID, module_no, TextBox3.Text, staff_id, attempt, result, remark, tb_compression3.Text, tb_ventilation3.Text, tb_cycle3.Text, Practical_status);
                        make_checbox_invisible(STUDENT_ID, TESTSESSION_ID, module_no);

                        TextBox6.Enabled = false;
                        TextBox5.Enabled = false;
                        TextBox4.Enabled = false;

                        instructor3.Text = instructor;
                        instructor3.Enabled = true;
                        instructor3.Visible = true;

                        tb_compression3.Enabled = false;
                        tb_cycle3.Enabled = false;
                        tb_ventilation3.Enabled = false;
                        if (CheckBox3.Checked == true)
                        {
                            string c3 = "c3";
                            module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c3, 1, attempt);

                            CheckBox3.Enabled = false;
                            CheckBox3.Checked = true;
                        }
                        if (CheckBox6.Checked == true)
                        {
                            string c6 = "c6";
                            module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c6, 2, attempt);

                            CheckBox6.Enabled = false;
                            CheckBox6.Checked = true;
                        }

                        if (CheckBox9.Checked == true)
                        {
                            string c9 = "c9";
                            module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c9, 3, attempt);
                            CheckBox9.Enabled = false;
                            CheckBox9.Checked = true;
                        }
                        if (CheckBox12.Checked == true)
                        {
                            string c12 = "c12";
                            module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c12, 4, attempt);
                            CheckBox12.Enabled = false;
                            CheckBox12.Checked = true;
                        }
                        if (CheckBox15.Checked == true)
                        {
                            string c15 = "c15";
                            module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c15, 5, attempt);
                            CheckBox15.Enabled = false;
                            CheckBox15.Checked = true;
                        }
                        if (CheckBox18.Checked == true)
                        {
                            string c18 = "c18";
                            module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c18, 6, attempt);

                            CheckBox18.Enabled = false;
                            CheckBox18.Checked = true;
                        }
                        if (CheckBox21.Checked == true)
                        {
                            string c21 = "c21";
                            module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c21, 7, attempt);
                            CheckBox21.Enabled = false;
                            CheckBox21.Checked = true;
                        }
                        if (CheckBox24.Checked == true)
                        {
                            string c24 = "c24";
                            module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c24, 8, attempt);

                            CheckBox24.Enabled = false;
                            CheckBox24.Checked = true;
                        }
                        if (CheckBox27.Checked == true)
                        {
                            string c27 = "c27";
                            TextBox3.Text = DateTime.Now.ToString("dd-MM-yyyy");
                            module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c27, 9, attempt);

                            CheckBox27.Enabled = false;
                            CheckBox27.Checked = true;
                        }
                        if (CheckBox30.Checked == true)
                        {
                            string c30 = "c30";
                            module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c30, 10, attempt);

                            CheckBox30.Enabled = false;
                            CheckBox30.Checked = true;
                        }
                        if (CheckBox33.Checked == true)
                        {
                            string c33 = "c33";
                            module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c33, 11, attempt);

                            CheckBox33.Enabled = false;
                            CheckBox33.Checked = true;
                        }

                        if (CheckBox36.Checked == true)
                        {
                            string c36 = "c36";
                            module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c36, 12, attempt);
                            CheckBox36.Enabled = false;
                            CheckBox36.Checked = true;
                        }
                        if (CheckBox39.Checked == true)
                        {

                            string c39 = "c39";
                            module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c39, 13, attempt);
                            CheckBox39.Enabled = false;
                            CheckBox39.Checked = true;
                        }
                    }

                }
                else //if just started the 1'st attempt
                {



                    TextBox1.Text = DateTime.Now.ToString("dd-MM-yyyy");
                    string attempt = "1";
                    remark = TextBox4.Text;

                    if (CheckBox1.Checked && CheckBox4.Checked && CheckBox7.Checked && CheckBox10.Checked && CheckBox13.Checked && CheckBox16.Checked && CheckBox19.Checked && CheckBox22.Checked && CheckBox25.Checked && CheckBox28.Checked && CheckBox31.Checked && CheckBox34.Checked && CheckBox37.Checked && tb_compression1.Text != "" && tb_cycle1.Text != "" && tb_ventilation1.Text != "")
                    {
                        lb_attempt1_result.Text = "Passed";
                        result = lb_attempt1_result.Text;
                    }
                    else
                    {
                        lb_attempt1_result.Text = "Referred";
                        result = lb_attempt1_result.Text;
                    }

                    if (result == "Referred")// if the status is "Referred" and comments length is not 10 characters
                    {

                        if (remark.Length < 10)
                        {

                            string script = "<script type=\"text/javascript\">alert('Submission UN-SUCCESSFUL. Remarks (minimum 10 characters) compulsory when submitting referred students');</script>";
                            ClientScript.RegisterClientScriptBlock(this.GetType(), "Alert", script);

                        }

                        else
                        {

                            bt_allpass.Visible = false;
                            bt_allpass2.Visible = false;
                            btn_submit.Visible = false;
                            btn_submit2.Visible = false;
                            string Practical_status = lb_attempt1_result.Text;
                            module_summary(STUDENT_ID, TESTSESSION_ID, module_no, TextBox1.Text, staff_id, attempt, result, remark, tb_compression1.Text, tb_ventilation1.Text, tb_cycle1.Text, Practical_status);
                            make_checbox_invisible(STUDENT_ID, TESTSESSION_ID, module_no);
                            TextBox4.Enabled = false;
                            TextBox5.Enabled = false;
                            TextBox6.Enabled = false;
                            tb_compression1.Enabled = false;
                            tb_cycle1.Enabled = false;
                            tb_ventilation1.Enabled = false;

                            if (CheckBox1.Checked == true)
                            {

                                string c1 = "c1";
                                module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c1, 1, attempt);

                                CheckBox1.Enabled = false;
                                CheckBox1.Checked = true;
                            }
                            if (CheckBox4.Checked == true)
                            {
                                string c4 = "c4";
                                module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c4, 2, attempt);

                                CheckBox4.Enabled = false;
                                CheckBox4.Checked = true;
                            }
                            if (CheckBox7.Checked == true)
                            {
                                string c7 = "c7";
                                module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c7, 3, attempt);
                                CheckBox7.Enabled = false;
                                CheckBox7.Checked = true;
                            }

                            if (CheckBox10.Checked == true)
                            {

                                string c10 = "c10";

                                module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c10, 4, attempt);
                                CheckBox10.Enabled = false;
                                CheckBox10.Checked = true;
                            }
                            if (CheckBox13.Checked == true)
                            {

                                string c13 = "c13";
                                module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c13, 5, attempt);

                                CheckBox13.Enabled = false;
                                CheckBox13.Checked = true;
                            }
                            if (CheckBox16.Checked == true)
                            {

                                string c16 = "c16";
                                module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c16, 6, attempt);

                                CheckBox16.Enabled = false;
                                CheckBox16.Checked = true;
                            }

                            if (CheckBox19.Checked == true)
                            {
                                string c19 = "c19";

                                module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c19, 7, attempt);

                                CheckBox19.Enabled = false;
                                CheckBox19.Checked = true;
                            }
                            if (CheckBox22.Checked == true)
                            {
                                string c22 = "c22";

                                module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c22, 8, attempt);

                                CheckBox22.Enabled = false;
                                CheckBox22.Checked = true;
                            }
                            if (CheckBox25.Checked == true)
                            {
                                string c25 = "c25";

                                module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c25, 9, attempt);

                                CheckBox25.Enabled = false;
                                CheckBox25.Checked = true;
                            }
                            if (CheckBox28.Checked == true)
                            {

                                string c28 = "c28";

                                module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c28, 10, attempt);

                                CheckBox28.Enabled = false;
                                CheckBox28.Checked = true;
                            }
                            if (CheckBox31.Checked == true)
                            {

                                string c31 = "c31";

                                module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c31, 11, attempt);

                                CheckBox31.Enabled = false;
                                CheckBox31.Checked = true;
                            }
                            if (CheckBox34.Checked == true)
                            {

                                string c34 = "c34";

                                module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c34, 12, attempt);

                                CheckBox34.Enabled = false;
                                CheckBox34.Checked = true;
                            }
                            if (CheckBox37.Checked == true)
                            {
                                string c37 = "c37";
                                module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c37, 13, attempt);
                                CheckBox37.Enabled = false;
                                CheckBox37.Checked = true;
                            }
                            //}
                        }
                    }
                    else // IF PASSED
                    {
                        bt_allpass.Visible = false;
                        bt_allpass2.Visible = false;
                        btn_submit.Visible = false;
                        btn_submit2.Visible = false;
                        string Practical_status = lb_attempt1_result.Text;
                        module_summary(STUDENT_ID, TESTSESSION_ID, module_no, TextBox1.Text, staff_id, attempt, result, remark, tb_compression1.Text, tb_ventilation1.Text, tb_cycle1.Text, Practical_status);
                        make_checbox_invisible(STUDENT_ID, TESTSESSION_ID, module_no);


                        TextBox4.Enabled = false;
                        TextBox5.Enabled = false;
                        TextBox6.Enabled = false;

                        tb_compression1.Enabled = false;
                        tb_cycle1.Enabled = false;
                        tb_ventilation1.Enabled = false;

                        if (CheckBox1.Checked == true)
                        {

                            string c1 = "c1";
                            module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c1, 1, attempt);

                            CheckBox1.Enabled = false;
                            CheckBox1.Checked = true;
                        }
                        if (CheckBox4.Checked == true)
                        {
                            string c4 = "c4";
                            module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c4, 2, attempt);

                            CheckBox4.Enabled = false;
                            CheckBox4.Checked = true;
                        }
                        if (CheckBox7.Checked == true)
                        {
                            string c7 = "c7";
                            module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c7, 3, attempt);
                            CheckBox7.Enabled = false;
                            CheckBox7.Checked = true;
                        }

                        if (CheckBox10.Checked == true)
                        {

                            string c10 = "c10";

                            module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c10, 4, attempt);
                            CheckBox10.Enabled = false;
                            CheckBox10.Checked = true;
                        }
                        if (CheckBox13.Checked == true)
                        {

                            string c13 = "c13";
                            module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c13, 5, attempt);

                            CheckBox13.Enabled = false;
                            CheckBox13.Checked = true;
                        }
                        if (CheckBox16.Checked == true)
                        {

                            string c16 = "c16";
                            module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c16, 6, attempt);

                            CheckBox16.Enabled = false;
                            CheckBox16.Checked = true;
                        }

                        if (CheckBox19.Checked == true)
                        {
                            string c19 = "c19";

                            module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c19, 7, attempt);

                            CheckBox19.Enabled = false;
                            CheckBox19.Checked = true;
                        }
                        if (CheckBox22.Checked == true)
                        {
                            string c22 = "c22";

                            module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c22, 8, attempt);

                            CheckBox22.Enabled = false;
                            CheckBox22.Checked = true;
                        }
                        if (CheckBox25.Checked == true)
                        {
                            string c25 = "c25";

                            module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c25, 9, attempt);

                            CheckBox25.Enabled = false;
                            CheckBox25.Checked = true;
                        }
                        if (CheckBox28.Checked == true)
                        {

                            string c28 = "c28";

                            module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c28, 10, attempt);

                            CheckBox28.Enabled = false;
                            CheckBox28.Checked = true;
                        }
                        if (CheckBox31.Checked == true)
                        {

                            string c31 = "c31";

                            module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c31, 11, attempt);

                            CheckBox31.Enabled = false;
                            CheckBox31.Checked = true;
                        }
                        if (CheckBox34.Checked == true)
                        {

                            string c34 = "c34";

                            module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c34, 12, attempt);

                            CheckBox34.Enabled = false;
                            CheckBox34.Checked = true;
                        }
                        if (CheckBox37.Checked == true)
                        {
                            string c37 = "c37";
                            module_attempt(STUDENT_ID, TESTSESSION_ID, module_no, c37, 13, attempt);
                            CheckBox37.Enabled = false;
                            CheckBox37.Checked = true;
                        }
                    }

                }

            } 
            con.Close();

            obj.is_passed_both_test(student_id, test_id);//for to update the date of passing to student_details table
           
        }
        Session["f_name"] = null;
        string RootFolderName = ConfigurationManager.AppSettings["BCLSResultsFolder"];//D:/Hosting/10676289/html/bclstest/results

        bool is_folder_exists = FtpDirectoryExists1(RootFolderName+"/" + year + "/" + TESTSESSION_ID + "/" + STUDENT_ID + "/practical");
        if (is_folder_exists == true)
        {
            getfile(TESTSESSION_ID, STUDENT_ID);
        }

    }




    protected void bt_allpass_Click(object sender, ImageClickEventArgs e)
    {
        string confirmValue_allpass = Request.Form["confirm_value"];
        if (confirmValue_allpass == "OK")
        {
            SqlConnection con = obj.getcon();
            con.Open();
            SqlCommand cmd_allpass = new SqlCommand("Select max(attempt) from practicaltest_summary where student_id='" + student_id + "' and testsession_id='" + test_id + "' and module_num='" + module + "'  ", con);
            SqlDataReader dr_allpass = cmd_allpass.ExecuteReader();
            if (dr_allpass.HasRows)
            {
                while (dr_allpass.Read())
                {
                    string max_attempt = dr_allpass[0].ToString();
                    if (max_attempt == "1")
                    {
                        for (int i = 2; i < 38; i += 3)
                        {
                            CheckBox cb = (CheckBox)Page.FindControl("CheckBox" + i);
                            cb.Checked = true;
                        }


                    }
                    else if (max_attempt == "2")
                    {

                        for (int i = 3; i < 39; i += 3)
                        {
                            CheckBox cb = (CheckBox)Page.FindControl("CheckBox" + i);
                            cb.Checked = true;
                        }
                        lb_attempt1_result.Text = "Passed";
                    }
                    if (max_attempt == "0" || max_attempt == "")
                    {
                        for (int i = 1; i < 37; i += 3)
                        {
                            CheckBox cb = (CheckBox)Page.FindControl("CheckBox" + i);
                            cb.Checked = true;
                        }

                    }

                }
            }

            else
            {
                for (int i = 1; i < 37; i += 3)
                {
                    CheckBox cb = (CheckBox)Page.FindControl("CheckBox" + i);
                    cb.Checked = true;
                }


            }
            con.Close();
        }
    }
}

