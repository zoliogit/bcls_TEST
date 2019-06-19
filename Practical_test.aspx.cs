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
using System.Drawing;


public partial class Practical_test : System.Web.UI.Page
{
    MainClass obj = new MainClass();

    protected void Page_Load(object sender, EventArgs e)
    {

        string name = (string)Session["staffname"]; //TO GET THE WELCOME MESSAGE

        if (Session["id"] == null)
            Response.Redirect("Login.aspx");

        string st_role = (string)Session["staffrole"];
        img_a_cpr.ImageUrl = "images/adutCPR.png";
        img_a_fbao.ImageUrl = "images/adultFBAO.png";
        img_i_cpr.ImageUrl = "images/infantCPR.png";
        img_i_fbao.ImageUrl = "images/infantFBAO.png";
        img_i_AED.ImageUrl= "images/CPR_AED.png";
        Button4.ImageUrl = "images/BackToStudentListBtn.png";

        String logintime = (string)Session["lasttime"];

        string p_studentNRIC = (string)Session["p_studentnric"];
        string p_studentNAME = (string)Session["p_studentname"];
        string p_studentID = (string)Session["p_studentid"];
        string p_testID = (string)Session["view_testid"];

        if (Session["view_testid"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        Label5.Text = p_studentNAME.ToUpper();
        Label6.Text = p_studentNRIC;

        // Code disables caching by browser.
        Response.Cache.SetCacheability(HttpCacheability.NoCache);// this tells the client not to cache responses in the History folder, so that when you use the back/forward buttons the client requests a new version of the response each time.
        Response.Cache.SetExpires(DateTime.UtcNow.AddHours(-1));
        Response.Cache.SetNoStore();
       
        SqlConnection con2 = obj.getcon();
        con2.Open();

        SqlCommand cmd106 = new SqlCommand("select practical_status,module_num,attempt from practicaltest_summary where student_id='" + p_studentID + "' and testsession_id='" + p_testID + "' ", con2);
        SqlDataReader dr106 = cmd106.ExecuteReader();
        if (dr106.HasRows)
        {
              //-------------MODULE 1 ----------------
           

            SqlCommand cmdat1 = new SqlCommand("Select max(attempt) from  practicaltest_summary where student_id ='" + p_studentID + "' and testsession_id='" + p_testID + "' and module_num='module1'", con2);
            SqlDataReader drat1 = cmdat1.ExecuteReader();
            if(drat1.HasRows)
            {
                while (drat1.Read())
                {
                    if (drat1[0].ToString() == "3") //there is a chance for inserting saved row after submitting the last attempt (attempt 3) . So first need to check if we submitted the last atempt..then need to display the submitted status .thats why checking max(attempt)
                    {
                        SqlCommand cmd3 = new SqlCommand("Select practical_status,result from  practicaltest_summary where student_id ='" + p_studentID + "' and  testsession_id='" + p_testID + "'  and module_num='module1' and attempt= (select max(attempt) from practicaltest_summary where student_id ='" + p_studentID + "' and testsession_id='" + p_testID + "' and module_num='module1') ", con2);
                        SqlDataReader dr3 = cmd3.ExecuteReader();
                        while (dr3.Read())
                        {
                            Label22.Text = dr3[1].ToString();


                            if (dr3[0].ToString() == "Passed")
                            {
                                Image1.ImageUrl = "images/greenTickWithPassed.png";
                                Image1.Visible = true;
                                Label22.Visible = false;
                            }
                        }

                    }
                    else
                    {
                        SqlCommand cmd2 = new SqlCommand("Select min(attempt) from  practicaltest_summary where student_id ='" + p_studentID + "' and testsession_id='" + p_testID + "' and module_num='module1'", con2);
                        SqlDataReader dr2 = cmd2.ExecuteReader();

                        while (dr2.Read())
                        {
                            if (dr2[0].ToString() == "0")
                            {
                                Label22.Text = "Saved";

                            }
                            else
                            {
                                SqlCommand cmd3 = new SqlCommand("Select practical_status,result from  practicaltest_summary where student_id ='" + p_studentID + "' and  testsession_id='" + p_testID + "'  and module_num='module1' and attempt= (select max(attempt) from practicaltest_summary where student_id ='" + p_studentID + "' and testsession_id='" + p_testID + "' and module_num='module1') ", con2);
                                SqlDataReader dr3 = cmd3.ExecuteReader();
                                while (dr3.Read())
                                {
                                    Label22.Text = dr3[1].ToString();


                                    if (dr3[0].ToString() == "Passed")
                                    {
                                        Image1.ImageUrl = "images/greenTickWithPassed.png";
                                        Image1.Visible = true;
                                        Label22.Visible = false;
                                    }
                                }
                            }
                        }

                    }
                }

            }

            //-----------MODULE 2 -----------------

              SqlCommand cmdat2 = new SqlCommand("Select max(attempt) from  practicaltest_summary where student_id ='" + p_studentID + "' and testsession_id='" + p_testID + "' and module_num='module2'", con2);
            SqlDataReader drat2 = cmdat2.ExecuteReader();
            if (drat2.HasRows)
            {
                while (drat2.Read())
                {
                    if (drat2[0].ToString() == "3")
                    {

                        SqlCommand cmd311 = new SqlCommand("Select practical_status,result from  practicaltest_summary where student_id ='" + p_studentID + "' and  testsession_id='" + p_testID + "'  and module_num='module2' and attempt= (select max(attempt) from practicaltest_summary where student_id ='" + p_studentID + "' and testsession_id='" + p_testID + "' and module_num='module2') ", con2);
                        SqlDataReader dr311 = cmd311.ExecuteReader();
                        while (dr311.Read())
                        {
                            Label23.Text = dr311[1].ToString();


                            if (dr311[0].ToString() == "Passed")
                            {
                                Image2.ImageUrl = "images/greenTickWithPassed.png";
                                Image2.Visible = true;
                                Label23.Visible = false;
                            }
                        }
                    }
                    else
                    {
                        SqlCommand cmd211 = new SqlCommand("Select min(attempt) from  practicaltest_summary where student_id ='" + p_studentID + "' and testsession_id='" + p_testID + "' and module_num='module2'", con2);
                        SqlDataReader dr211 = cmd211.ExecuteReader();

                        while (dr211.Read())
                        {
                            if (dr211[0].ToString() == "0")
                            {
                                Label23.Text = "Saved";

                            }
                            else
                            {
                                SqlCommand cmd311 = new SqlCommand("Select practical_status,result from  practicaltest_summary where student_id ='" + p_studentID + "' and  testsession_id='" + p_testID + "'  and module_num='module2' and attempt= (select max(attempt) from practicaltest_summary where student_id ='" + p_studentID + "' and testsession_id='" + p_testID + "' and module_num='module2') ", con2);
                                SqlDataReader dr311 = cmd311.ExecuteReader();
                                while (dr311.Read())
                                {
                                    Label23.Text = dr311[1].ToString();


                                    if (dr311[0].ToString() == "Passed")
                                    {
                                        Image2.ImageUrl = "images/greenTickWithPassed.png";
                                        Image2.Visible = true;
                                        Label23.Visible = false;
                                    }
                                }
                            }
                        }



                    }
                }

            }


             //-----------MODULE 3 -----------------

            SqlCommand cmdat3 = new SqlCommand("Select max(attempt) from  practicaltest_summary where student_id ='" + p_studentID + "' and testsession_id='" + p_testID + "' and module_num='module3'", con2);
            SqlDataReader drat3 = cmdat3.ExecuteReader();
            if (drat3.HasRows)
            {
                while (drat3.Read())
                {
                    if (drat3[0].ToString() == "3")
                    {
                        SqlCommand cmd611 = new SqlCommand("Select practical_status,result from  practicaltest_summary where student_id ='" + p_studentID + "' and  testsession_id='" + p_testID + "'  and module_num='module3' and attempt= (select max(attempt) from practicaltest_summary where student_id ='" + p_studentID + "' and testsession_id='" + p_testID + "' and module_num='module3') ", con2);
                        SqlDataReader dr611 = cmd611.ExecuteReader();
                        while (dr611.Read())
                        {
                            Label24.Text = dr611[1].ToString();


                            if (dr611[0].ToString() == "Passed")
                            {
                                Image3.ImageUrl = "images/greenTickWithPassed.png";
                                Image3.Visible = true;
                                Label24.Visible = false;
                            }
                        }
                    }
                    else
                    {
                        SqlCommand cmd511 = new SqlCommand("Select min(attempt) from  practicaltest_summary where student_id ='" + p_studentID + "' and testsession_id='" + p_testID + "' and module_num='module3'", con2);
                        SqlDataReader dr511 = cmd511.ExecuteReader();

                        while (dr511.Read())
                        {
                            if (dr511[0].ToString() == "0")
                            {
                                Label24.Text = "Saved";

                            }
                            else
                            {
                                SqlCommand cmd611 = new SqlCommand("Select practical_status,result from  practicaltest_summary where student_id ='" + p_studentID + "' and  testsession_id='" + p_testID + "'  and module_num='module3' and attempt= (select max(attempt) from practicaltest_summary where student_id ='" + p_studentID + "' and testsession_id='" + p_testID + "' and module_num='module3') ", con2);
                                SqlDataReader dr611 = cmd611.ExecuteReader();
                                while (dr611.Read())
                                {
                                    Label24.Text = dr611[1].ToString();


                                    if (dr611[0].ToString() == "Passed")
                                    {
                                        Image3.ImageUrl = "images/greenTickWithPassed.png";
                                        Image3.Visible = true;
                                        Label24.Visible = false;
                                    }
                                }
                            }
                        }

                    }
                  
                }
            }
           
             //-----------MODULE 4-----------------

            SqlCommand cmdat4 = new SqlCommand("Select max(attempt) from  practicaltest_summary where student_id ='" + p_studentID + "' and testsession_id='" + p_testID + "' and module_num='module4'", con2);
            SqlDataReader drat4 = cmdat4.ExecuteReader();
            if (drat4.HasRows)
            {
                while (drat4.Read())
                {
                    if (drat4[0].ToString() == "3")
                    {
                        SqlCommand cmd911 = new SqlCommand("Select practical_status,result from  practicaltest_summary where student_id ='" + p_studentID + "' and  testsession_id='" + p_testID + "'  and module_num='module4' and attempt= (select max(attempt) from practicaltest_summary where student_id ='" + p_studentID + "' and testsession_id='" + p_testID + "' and module_num='module4') ", con2);
                        SqlDataReader dr911 = cmd911.ExecuteReader();
                        while (dr911.Read())
                        {
                            Label25.Text = dr911[1].ToString();


                            if (dr911[0].ToString() == "Passed")
                            {
                                Image4.ImageUrl = "images/greenTickWithPassed.png";
                                Image4.Visible = true;
                                Label25.Visible = false;
                            }
                        }
                    }
                    else
                    {

                        SqlCommand cmd811 = new SqlCommand("Select min(attempt) from  practicaltest_summary where student_id ='" + p_studentID + "' and testsession_id='" + p_testID + "' and module_num='module4'", con2);
                        SqlDataReader dr811 = cmd811.ExecuteReader();

                        while (dr811.Read())
                        {
                            if (dr811[0].ToString() == "0")
                            {
                                Label25.Text = "Saved";

                            }
                            else
                            {
                                SqlCommand cmd911 = new SqlCommand("Select practical_status,result from  practicaltest_summary where student_id ='" + p_studentID + "' and  testsession_id='" + p_testID + "'  and module_num='module4' and attempt= (select max(attempt) from practicaltest_summary where student_id ='" + p_studentID + "' and testsession_id='" + p_testID + "' and module_num='module4') ", con2);
                                SqlDataReader dr911 = cmd911.ExecuteReader();
                                while (dr911.Read())
                                {
                                    Label25.Text = dr911[1].ToString();


                                    if (dr911[0].ToString() == "Passed")
                                    {
                                        Image4.ImageUrl = "images/greenTickWithPassed.png";
                                        Image4.Visible = true;
                                        Label25.Visible = false;
                                    }
                                }
                            }
                        }
                    }
                }
            }
            //    ----------------------Module 5--------------------
          

            SqlCommand cmdat5 = new SqlCommand("Select max(attempt) from  practicaltest_summary where student_id ='" + p_studentID + "' and testsession_id='" + p_testID + "' and module_num='module5'", con2);
            SqlDataReader drat5 = cmdat5.ExecuteReader();
            if (drat5.HasRows)
            {
                while (drat5.Read())
                {
                    if (drat5[0].ToString() == "3")
                    {

                        SqlCommand cmd511 = new SqlCommand("Select practical_status,result from  practicaltest_summary where student_id ='" + p_studentID + "' and  testsession_id='" + p_testID + "'  and module_num='module5' and attempt= (select max(attempt) from practicaltest_summary where student_id ='" + p_studentID + "' and testsession_id='" + p_testID + "' and module_num='module5') ", con2);
                        SqlDataReader dr511 = cmd511.ExecuteReader();
                        while (dr511.Read())
                        {
                            Label26.Text = dr511[1].ToString();


                            if (dr511[0].ToString() == "Passed")
                            {
                                Image5.ImageUrl = "images/greenTickWithPassed.png";
                                Image5.Visible = true;
                                Label26.Visible = false;
                            }
                        }
                    }
                    else
                    {
                        SqlCommand cmd511 = new SqlCommand("Select min(attempt) from  practicaltest_summary where student_id ='" + p_studentID + "' and testsession_id='" + p_testID + "' and module_num='module5'", con2);
                        SqlDataReader dr511 = cmd511.ExecuteReader();

                        while (dr511.Read())
                        {
                            if (dr511[0].ToString() == "0")
                            {
                                Label26.Text = "Saved";

                            }
                            else
                            {
                                SqlCommand cmd311 = new SqlCommand("Select practical_status,result from  practicaltest_summary where student_id ='" + p_studentID + "' and  testsession_id='" + p_testID + "'  and module_num='module5' and attempt= (select max(attempt) from practicaltest_summary where student_id ='" + p_studentID + "' and testsession_id='" + p_testID + "' and module_num='module5') ", con2);
                                SqlDataReader dr311 = cmd311.ExecuteReader();
                                while (dr311.Read())
                                {
                                    Label26.Text = dr311[1].ToString();


                                    if (dr311[0].ToString() == "Passed")
                                    {
                                        Image5.ImageUrl = "images/greenTickWithPassed.png";
                                        Image5.Visible = true;
                                        Label26.Visible = false;
                                    }
                                }
                            }
                        }



                    }
                }

            }




        }

        con2.Close();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {

        Response.Redirect("Practical_module2.aspx");
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("Login.aspx");
    }
    protected void Button6_Click(object sender, EventArgs e)
    {
        Response.Redirect("Practical_module4.aspx");
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        Response.Redirect("Practical_module3.aspx");
    }

    protected void Button8_Click(object sender, EventArgs e)
    {
        Response.Redirect("Practical_module1.aspx");

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
    protected void img_a_cpr_Click(object sender, ImageClickEventArgs e)
    {

        Response.Redirect("Practical_module1.aspx");
    }
    protected void img_a_fbao_Click(object sender, ImageClickEventArgs e)
    {

        Response.Redirect("Practical_module2.aspx");
    }
    protected void img_i_cpr_Click(object sender, ImageClickEventArgs e)
    {

        Response.Redirect("Practical_module3.aspx");
    }
    protected void img_i_fbao_Click(object sender, ImageClickEventArgs e)
    {

        Response.Redirect("Practical_module4.aspx");
    }
    protected void Button4_Click(object sender, ImageClickEventArgs e)
    {

        Response.Redirect("view_test.aspx");
    }

    protected void img_i_AED_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Practical_module5.aspx");
    }
}

