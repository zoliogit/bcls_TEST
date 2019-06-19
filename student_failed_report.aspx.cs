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
//using System.Windows.Forms;
using System.Drawing;
using System.Collections.Generic;

public partial class student_failed_report : System.Web.UI.Page
{
    MainClass obj = new MainClass();
    string login_staff_ID;
    string st_role;
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

        string name = (string)Session["staffname"]; //TO GET THE WELCOME MESSAGE

        String logintime = (string)Session["lasttime"];

        st_role = (string)Session["staffrole"];
        login_staff_ID = (string)Session["staffname"];

        // Code disables caching by browser.
        Response.Cache.SetCacheability(HttpCacheability.NoCache);// this tells the client not to cache responses in the History folder, so that when you use the back/forward buttons the client requests a new version of the response each time.
        Response.Cache.SetExpires(DateTime.UtcNow.AddHours(-1));
        Response.Cache.SetNoStore();
       
        SqlConnection con9 = obj.getcon();
        con9.Open();
        SqlDataAdapter adapter = new SqlDataAdapter("select e.student_id,UPPER(e.student_name) as student_name,e.student_nric,e.student_group,f.test_vs_student_status,g.testsession_id,g.test_date,f.reason_for_follow_up,f.logistics,f.instruction_for_students,f.comments_by_CI,f.responsible_CI  from student_details e, student_vs_testsession_details f,testsession_details g where e.student_id=f.student_id and f.testsession_id=g.testsession_id and g.testsession_status='Completed' and (e.date_of_pass  is null ) order by g.testsession_id DESC,e.student_name ", con9);
        DataSet ds = new DataSet();
        adapter.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
        con9.Close();

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

    protected void bt_session_details_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Active_testsessiondetails.aspx");
    }

    protected void Button3_Click(object sender, ImageClickEventArgs e)
    {
        Session.Abandon();
        Response.Redirect("Login.aspx");
    }
    protected void bt_reports_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Report.aspx");
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        foreach (TableCell tc in e.Row.Cells)
        {

            tc.Attributes["style"] = "border-color: #98272d";

        }

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            SqlConnection con = obj.getcon();
            con.Open();
            Label lnk = e.Row.FindControl("label_practical_status") as Label;

            //   Label lnk = (Label)e.Row.FindControl("label_practical_status");
            // Label lnk = (Label)e.Row.FindControl("label_practical_status");//practical status link


            string Namecolumnvalue1 = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "student_id"));
            string Namecolumnvalue2 = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "testsession_id"));
            //  string test_id = (string)Session["view_testid"];

            string[] link = new string[] { "- ", "- ", "- ", "- " };

            SqlCommand cmd = new SqlCommand("select practical from student_vs_testsession_details where student_id='" + Namecolumnvalue1 + "'and testsession_id='" + Namecolumnvalue2 + "' ", con);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                if (dr[0].ToString() == "1")//practical==1 if that student is assigned for practical test.other wise it will be zero.
                {
                    SqlCommand cmd106 = new SqlCommand("select practical_status,module_num,attempt from practicaltest_summary where student_id='" + Namecolumnvalue1 + "' and testsession_id='" + Namecolumnvalue2 + "' ", con);
                    SqlDataReader dr106 = cmd106.ExecuteReader();
                    if (dr106.HasRows)
                    {
                        SqlCommand cmd66 = new SqlCommand("select min(attempt) from practicaltest_summary where student_id ='" + Namecolumnvalue1 + "' and testsession_id='" + Namecolumnvalue2 + "' and module_num='module1' ", con);
                        SqlDataReader dr66 = cmd66.ExecuteReader();
                        while (dr66.Read())
                        {
                            if (dr66[0].ToString() != "0")
                            {
                                SqlCommand cmd69 = new SqlCommand("Select practical_status from  practicaltest_summary where student_id ='" + Namecolumnvalue1 + "' and  testsession_id='" + Namecolumnvalue2 + "'  and module_num='module1' and attempt= (select max(attempt) from practicaltest_summary where student_id ='" + Namecolumnvalue1 + "' and testsession_id='" + Namecolumnvalue2 + "' and module_num='module1') ", con);
                                SqlDataReader dr69 = cmd69.ExecuteReader();
                                if (dr69.HasRows)
                                {
                                    while (dr69.Read())
                                    {

                                        if (dr69[0].ToString() == "Passed")
                                        {
                                            link[0] = "P ";

                                        }
                                        else if (dr69[0].ToString() == "Referred")
                                        {
                                            link[0] = "R ";

                                        }

                                        else if (dr69[0].ToString() == "Failed")
                                        {
                                            link[0] = "F ";
                                        }
                                        else
                                        {
                                            link[0] = "- ";
                                        }
                                    }
                                }


                            }
                            else
                            {
                                link[0] = "S ";

                            }
                        }
                        SqlCommand cmd86 = new SqlCommand("select min(attempt) from practicaltest_summary where student_id ='" + Namecolumnvalue1 + "' and testsession_id='" + Namecolumnvalue2 + "' and module_num='module2' ", con);
                        SqlDataReader dr86 = cmd86.ExecuteReader();
                        while (dr86.Read())
                        {
                            if (dr86[0].ToString() != "0")
                            {
                                SqlCommand cmd85 = new SqlCommand("Select practical_status from  practicaltest_summary where student_id ='" + Namecolumnvalue1 + "' and  testsession_id='" + Namecolumnvalue2 + "'  and module_num='module2' and attempt= (select max(attempt) from practicaltest_summary where student_id ='" + Namecolumnvalue1 + "' and testsession_id='" + Namecolumnvalue2 + "' and module_num='module2') ", con);
                                SqlDataReader dr85 = cmd85.ExecuteReader();
                                if (dr85.HasRows)
                                {
                                    while (dr85.Read())
                                    {

                                        if (dr85[0].ToString() == "Passed")
                                        {
                                            link[1] = "P ";

                                        }
                                        else if (dr85[0].ToString() == "Referred")
                                        {
                                            link[1] = "R ";

                                        }

                                        else if (dr85[0].ToString() == "Failed")
                                        {
                                            link[1] = "F ";
                                        }
                                        else
                                        {
                                            link[1] = "- ";
                                        }
                                    }
                                }


                            }
                            else
                            {
                                link[1] = "S ";

                            }
                        }

                        SqlCommand cmd22 = new SqlCommand("select min(attempt) from practicaltest_summary where student_id ='" + Namecolumnvalue1 + "' and testsession_id='" + Namecolumnvalue2 + "' and module_num='module3' ", con);
                        SqlDataReader dr22 = cmd22.ExecuteReader();
                        while (dr22.Read())
                        {
                            if (dr22[0].ToString() != "0")
                            {
                                SqlCommand cmd12 = new SqlCommand("Select practical_status from  practicaltest_summary where student_id ='" + Namecolumnvalue1 + "' and  testsession_id='" + Namecolumnvalue2 + "'  and module_num='module3' and attempt= (select max(attempt) from practicaltest_summary where student_id ='" + Namecolumnvalue1 + "' and testsession_id='" + Namecolumnvalue2 + "' and module_num='module3') ", con);
                                SqlDataReader dr12 = cmd12.ExecuteReader();
                                if (dr12.HasRows)
                                {
                                    while (dr12.Read())
                                    {

                                        if (dr12[0].ToString() == "Passed")
                                        {
                                            link[2] = "P ";

                                        }
                                        else if (dr12[0].ToString() == "Referred")
                                        {
                                            link[2] = "R ";

                                        }

                                        else if (dr12[0].ToString() == "Failed")
                                        {
                                            link[2] = "F ";
                                        }
                                        else
                                        {
                                            link[2] = "- ";
                                        }
                                    }
                                }


                            }
                            else
                            {
                                link[2] = "S ";

                            }
                        }


                        SqlCommand cmd9 = new SqlCommand("select min(attempt) from practicaltest_summary where student_id ='" + Namecolumnvalue1 + "' and testsession_id='" + Namecolumnvalue2 + "' and module_num='module4' ", con);
                        SqlDataReader dr9 = cmd9.ExecuteReader();
                        while (dr9.Read())
                        {
                            if (dr9[0].ToString() != "0")
                            {
                                SqlCommand cmd21 = new SqlCommand("Select practical_status from  practicaltest_summary where student_id ='" + Namecolumnvalue1 + "' and  testsession_id='" + Namecolumnvalue2 + "'  and module_num='module4' and attempt= (select max(attempt) from practicaltest_summary where student_id ='" + Namecolumnvalue1 + "' and testsession_id='" + Namecolumnvalue2 + "' and module_num='module4') ", con);
                                SqlDataReader dr21 = cmd21.ExecuteReader();
                                if (dr21.HasRows)
                                {
                                    while (dr21.Read())
                                    {

                                        if (dr21[0].ToString() == "Passed")
                                        {
                                            link[3] = "P ";

                                        }
                                        else if (dr21[0].ToString() == "Referred")
                                        {
                                            link[3] = "R ";

                                        }

                                        else if (dr21[0].ToString() == "Failed")
                                        {
                                            link[3] = "F ";
                                        }
                                        else
                                        {
                                            link[3] = "- ";
                                        }
                                    }
                                }


                            }
                            else
                            {
                                link[3] = "S ";

                            }
                        }

                        string link_values = link[0] + link[1] + link[2] + link[3];
                       
                        lnk.Text = link_values;
                    }
                    else
                    {
                        lnk.Text = "Not Started";
                        lnk.Visible = true;
                    }
                }
                else
                {
                    lnk.Visible = false;
                }


            }
            con.Close();
        }

    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "select_date") //click on scheduled date
        {

            GridViewRow selectedRow = (GridViewRow)((LinkButton)e.CommandSource).NamingContainer;
            //to get the value in the TEST ID column
            string testID = selectedRow.Cells[1].Text;

            Session["S_id"] = testID;

            SqlConnection con88 = obj.getcon();
            con88.Open();
            SqlCommand cmd = new SqlCommand("Select * from testsession_details where testsession_id =@View_ID", con88);
            cmd.Parameters.Add(new SqlParameter("View_ID", testID));
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                Session["view_time"] = dr[1].ToString();
                Session["view_date"] = dr[2].ToString();
                Session["view_duration"] = dr[11].ToString();
                Session["view_questions"] = dr[3].ToString();
                Session["view_testid"] = dr[5].ToString();
                Session["view_chiefinstructor"] = dr[9].ToString();

            }
            con88.Close();
            Response.Redirect("CI_Report.aspx");

        }
    }
}
