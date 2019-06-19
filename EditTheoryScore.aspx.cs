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
using System.IO;
using System.Net;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.Text;
public partial class EditTheoryScore : System.Web.UI.Page
{
    MainClass obj = new MainClass();
    string student_ID, student_Name,login_staffname;
    string test_id;
    string score_todb, ans_db, score_db;
    string text, message;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["id"] == null)
            Response.Redirect("Login.aspx");

       test_id = (string)Session["view_testid"];
        if (Session["view_testid"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        student_ID = (string)Session["student_id"];
        student_Name = (string)Session["editscore_studentname"];
       lb_sessionid.Text=test_id;
        lb_studentid.Text=student_ID;
        login_staffname = (string)Session["staff_name_for_edit_score"];
        Button4.ImageUrl = "images/BackToStudentListBtn.png";
        bt_submit.ImageUrl = "images/UpdateBtn.png";

        // Code disables caching by browser.
        Response.Cache.SetCacheability(HttpCacheability.NoCache);// this tells the client not to cache responses in the History folder, so that when you use the back/forward buttons the client requests a new version of the response each time.
        Response.Cache.SetExpires(DateTime.UtcNow.AddHours(-1));
        Response.Cache.SetNoStore();
       
    }
    protected void bt_submit_Click(object sender, ImageClickEventArgs e)
    {
        string confirmValue = Request.Form["confirm_value"];
        if (confirmValue == "Yes")
        {
            lb_studentid.Text = student_ID;
            lb_sessionid.Text = test_id;

            SqlConnection con7 = obj.getcon();
            con7.Open();
            //  string theory_score1 = tb_score1.Text;

            score_todb = tb_score1.Text;
            using (SqlCommand cmd71 = con7.CreateCommand())
            {



                //cmd71.CommandText =" update student_vs_testsession_details set   score='" + score_todb + "' , answer= @answer where testsession_id='" + test_id + "' and student_id ='" + student_ID + "' ";
                //cmd71.Parameters.Add("@answer", SqlDbType.NVarChar).Value =message;
                //cmd71.ExecuteNonQuery();




                SqlCommand cmd88 = new SqlCommand("select score,answer from student_vs_testsession_details  where student_id ='" + student_ID + "' and testsession_id='" + test_id + "' ", con7);
                SqlDataReader dr88 = cmd88.ExecuteReader();
                if (dr88.HasRows)
                {
                    dr88.Read();
                    //  string submittime = "Submitted at:" + DateTime.Now.ToString() + System.Environment.NewLine;
                    score_db = dr88[0].ToString();
                    ans_db = dr88[1].ToString();
                    text = "----------------------------------------------------------------\r\n----------------------------------------------------------------\n";
                   // message = "Theory Test was conducted offline for " + student_Name + " in test session ID " + test_id + ". Marks were entered by " + login_staffname + " on " + DateTime.Now.ToString() + System.Environment.NewLine;
                    message = "Theory Test was conducted offline for " + student_Name + " in test session ID " + test_id + ". Mark "+score_todb+ " was entered by " + login_staffname + " on " + DateTime.Now.ToString() + System.Environment.NewLine;

                    if (score_db != "")
                    {
                       
                        string final_result = message + text;
                        using (SqlCommand cmd72 = con7.CreateCommand())
                        {

                            cmd72.CommandText = "update student_vs_testsession_details set   score='" + score_db + "'+','+'" + score_todb + "' , answer= @answer where testsession_id='" + test_id + "' and student_id ='" + student_ID + "' ";
                            cmd72.Parameters.Add("@answer", SqlDbType.NVarChar).Value = final_result + ans_db;
                            cmd72.ExecuteNonQuery();
                        }
                    }
                    else
                    {
                        string initial_result = message;
                        SqlCommand cmd75 = new SqlCommand("update student_vs_testsession_details set score='" + score_todb + "' , answer='" + message + "' where testsession_id='" + test_id+ "' and student_id ='" + student_ID+ "' ", con7);
                        cmd75.ExecuteNonQuery();

                    }


                }







                if (Convert.ToInt32(tb_score1.Text) >= 24)
                {
                    string s_test_student_status = "Passed";
                    SqlCommand cmd11 = new SqlCommand("update student_vs_testsession_details set test_vs_student_status='" + s_test_student_status + "' where testsession_id='" + test_id + "' and student_id ='" + student_ID + "' ", con7);
                    cmd11.ExecuteNonQuery();
                    obj.is_passed_both_test(student_ID, test_id);//for to update the date of passing to student_details table
                }
                else
                {
                    string s_test_student_statuss = "Failed";
                    SqlCommand cmd11 = new SqlCommand("update student_vs_testsession_details set  test_vs_student_status='" + s_test_student_statuss + "' where testsession_id='" + test_id + "' and student_id ='" + student_ID + "' ", con7);
                    cmd11.ExecuteNonQuery();
                }

                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('Theory Score is updated successfully')", true);
                con7.Close();
                Response.Redirect("view_test.aspx");

            }

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

    //            SqlCommand cmd101 = new SqlCommand("select score from  student_vs_testsession_details where student_id='" + s_studentid + "'  and testsession_id='" + s_testid + "'   ", con12);
    //            SqlDataReader dr101 = cmd101.ExecuteReader();
    //            if (dr101.HasRows)
    //            {
    //                while (dr101.Read())
    //                {
    //                    string score_detail = dr101[0].ToString();
    //                    int comma = score_detail.IndexOf(',');
    //                    string last_score = score_detail;
    //                    if (string.IsNullOrEmpty(last_score) == false)
    //                    {
    //                        if (comma != -1)
    //                        {
    //                            string[] tokens = score_detail.Split(',');
    //                            last_score = tokens[tokens.Length - 1];

    //                        }

    //                        if (Convert.ToInt32(last_score) >= 24)
    //                        {

    //                            SqlCommand cmd111 = new SqlCommand("update student_details set date_of_pass=getdate() where student_id='" + s_studentid + "' ", con12);
    //                            cmd111.ExecuteNonQuery();
    //                        }
    //                    }
    //                }
    //            }


    //        }
    //    }
    //    con12.Close();
    //}
    protected void Button4_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("view_test.aspx");

    }

   
}
