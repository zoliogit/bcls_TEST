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
using System.Net;
using System.Drawing;
using System.Web.Script;
using System.Web.Script.Serialization;
public partial class NSL_V2_1_Simulation1_G1 : System.Web.UI.Page
{
    MainClass obj = new MainClass();
    string STAFF_id;
    string selected_group, selected_p_group;
    int question_score;
    string NSL_type = "Simulation 1";
    int total_score;
    string selected_option = "Option 1";

    protected void Page_Load(object sender, EventArgs e)
    {
        string st_role = (string)Session["staffrole"];

        String logintime = (string)Session["lasttime"];
        STAFF_id = (string)Session["staffid"];
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
        // Code disables caching by browser.
        Response.Cache.SetCacheability(HttpCacheability.NoCache);// this tells the client not to cache responses in the History folder, so that when you use the back/forward buttons the client requests a new version of the response each time.
        Response.Cache.SetExpires(DateTime.UtcNow.AddHours(-1));
        Response.Cache.SetNoStore();
       
        string name = (string)Session["staffname"]; //TO GET THE WELCOME MESSAGE
        lb_welcome.Text = "Welcome " + name.ToUpper() + "!";
        //  lb_assessor.Text = name.ToUpper();

        Button4.ImageUrl = "images/backToGroupsBtn.png";
        selected_group = Session["selected_group"].ToString();
        selected_p_group = Session["selected_p_group"].ToString();

        BindGrid();//to show student details
        if (!IsPostBack)
        {
            for (int i = 1; i <= 29; i++) //part A
            {
                int question_num = i;
                show_table_status(selected_group, NSL_type, question_num, selected_p_group, selected_option);
            }

            get_total_score(selected_group, selected_p_group);
        }
    }

    private void BindGrid()
    {
        SqlConnection con2 = obj.getcon();
        con2.Open();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        SqlDataAdapter adp = new SqlDataAdapter();
        try
        {

            cmd = new SqlCommand("select student_id,UPPER(student_name) as student_name ,student_group from NSL_student_details_v2_1 where student_group =@s_group and IsActive='1' and practical_group=@p_group   ORDER BY student_name  ", con2);
            cmd.Parameters.AddWithValue("@s_group", selected_group);
            cmd.Parameters.AddWithValue("@p_group", selected_p_group);

            adp.SelectCommand = cmd;
            adp.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            else
            {
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Error occured : " + ex.Message.ToString() + "');", true);
        }
        finally
        {
            dt.Clear();
            dt.Dispose();
            cmd.Dispose();
            con2.Close();
        }
    }
    public void show_table_status(string selected_group, string NSL_type, int question_num, string selected_p_group, string selected_option)
    {
        SqlConnection con6 = obj.getcon();
        con6.Open();
        //for to show the check box current status checked/un checked



        SqlCommand cmd = new SqlCommand("Select question_score,remarks from NSL_student_vs_simulation_details_v2_1 where student_group='" + selected_group + "' and 	practical_group='" + selected_p_group + "' and NSL_type='" + NSL_type + "' and question_num='" + question_num + "' and selected_option='" + selected_option + "'  ", con6);
        SqlDataReader dr2 = cmd.ExecuteReader();
        if (dr2.HasRows == true)
        {
            while (dr2.Read())
            {
                string score = dr2[0].ToString();
                RadioButtonList rb = (RadioButtonList)Page.FindControl("RadioButtonList" + question_num);
                string remarks = dr2[1].ToString();
                TextBox lb_remarks = (TextBox)Page.FindControl("Remarks" + question_num);
                if (lb_remarks != null)//may be there is no remarks for some radiobuttons
                {
                    lb_remarks.Text = remarks;
                }
                rb.SelectedValue = score;
            }
        }
        con6.Close();
    }

    public void get_total_score(string selected_group, string selected_p_group)//make enable/disable the buttons 
    {

        SqlConnection con = obj.getcon();
        con.Open();

        SqlCommand cmd = new SqlCommand("Select sim1,submit_date_sim1,percent_score_sim1,submitted_staff_sim1 from NSL_student_details_v2_1 where student_group='" + selected_group + "' and practical_group='" + selected_p_group + "' and  IsActive='1'  ", con);
        SqlDataReader dr2 = cmd.ExecuteReader();
        if (dr2.HasRows == true)
        {
            while (dr2.Read())
            {

                if (dr2[2].ToString() != "")
                {
                    bt_start.Enabled = false;
                    btn_common_save.Visible = false;
                    btn_show_currentscore.Visible = false;
                    btn_submit.Visible = false;
                    dl_option.Enabled = false;
                    lb_total.Text = dr2[0].ToString();
                    lb_date.Text = dr2[1].ToString();
                    // lb_actualscore.Text = dr2[2].ToString() + "%";
                    // lb_actualscore2.Text = dr2[2].ToString();
                    lb_assessor.Text = dr2[3].ToString().ToUpper();

                    float actual_score_float = ((float)Convert.ToInt32(dr2[0].ToString()) / (float)116) * ((float)10 / (float)100) * 100;//Total/116 X 10% 
                    decimal actual_score_decimalValue = Math.Round((decimal)actual_score_float, 1);
                    lb_actualscore.Text = actual_score_decimalValue.ToString() + "%";
                    lb_actualscore2.Text = actual_score_decimalValue.ToString();


                    for (int i = 1; i <= 29; i++)
                    {
                        RadioButtonList rb = (RadioButtonList)Page.FindControl("RadioButtonList" + i);
                        rb.Enabled = false;
                        TextBox lb_remarks = (TextBox)Page.FindControl("Remarks" + i);
                        if (lb_remarks != null)
                        { lb_remarks.Enabled = false; }

                    }


                }

            }
        }

        con.Close();

    }

    protected void Button4_Click(object sender, ImageClickEventArgs e)
    {
        SqlConnection con = obj.getcon();
        con.Open();

        SqlCommand cmd = new SqlCommand("Select distinct sim1 from NSL_student_details_v2_1 where student_group='" + selected_group + "' and practical_group='" + selected_p_group + "' and  IsActive='1' ", con);
        SqlDataReader dr2 = cmd.ExecuteReader();
        if (dr2.HasRows == true)
        {
            while (dr2.Read())
            {
                //int total_score_Db =Convert.ToInt32( dr2[0].ToString());
                if (dr2[0].ToString() == "") //not submitted
                {
                    auto_Save(sender, e); //AUTO SAVE
                }
            }
        }
        con.Close();
        Response.Redirect("NSL_Simulation_v2_1.aspx");
    }
    protected void btn_submit_click(object sender, ImageClickEventArgs e)
    {
        try
        {
            string confirmValue_allpass = Request.Form["confirm_value"];
            if (confirmValue_allpass == "OK")
            {


                for (int i = 1; i <= 29; i++) //part A
                {
                    RadioButtonList rb = (RadioButtonList)Page.FindControl("RadioButtonList" + i);
                    int question_num = i;

                    if (rb.SelectedIndex >= 0)
                    {
                        question_score = Convert.ToInt32(rb.SelectedValue);

                    }
                    TextBox lb_remarks = (TextBox)Page.FindControl("Remarks" + i);
                    string remarks = lb_remarks.Text;

                    submit_score_details(selected_group, question_num, question_score, NSL_type, selected_p_group, selected_option, remarks);
                }


                update_total_score(selected_group, total_score, selected_p_group);
                get_total_score(selected_group, selected_p_group);//FOR MAKING the BUTTONS disable when submitted

                ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Successfully Submitted');", true);

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

    public void update_total_score(string selected_group, int total_score, string selected_p_group)
    {
        float actual_score_float = ((float)total_score / (float)116) * ((float)10 / (float)100) * 100;//Total/116 X 10% 
        decimal actual_score_decimalValue = Math.Round((decimal)actual_score_float, 1);

        SqlConnection con5 = obj.getcon();
        con5.Open();
        // SqlCommand cmd = new SqlCommand("UPDATE  NSL_student_details  SET sim3='" + total_score + "' , submit_date_sim3=getdate(),option_sim3='" + selected_option + "',percent_score_sim3='" + actual_score_decimalValue + "',submitted_staff_sim3='" + STAFF_id + "' where  student_group='" + selected_group + "'  and practical_group='" + selected_p_group + "' ", con5);



        SqlCommand cmd = new SqlCommand("UPDATE  NSL_student_details_v2_1  SET sim1=@total_score , submit_date_sim1=getdate(), option_sim1=@selected_option,percent_score_sim1=@actual_score_decimalValue, submitted_staff_sim1=@STAFF_id  where  student_group=@selected_group  and practical_group=@selected_p_group and  IsActive='1' ", con5);
        cmd.Parameters.AddWithValue("@total_score", total_score);
        //  cmd.Parameters.AddWithValue("@getdate", SqlDbType.DateTime);
        cmd.Parameters.AddWithValue("@selected_option", selected_option);
        cmd.Parameters.AddWithValue("@actual_score_decimalValue", actual_score_decimalValue);
        cmd.Parameters.AddWithValue("@STAFF_id", STAFF_id);
        cmd.Parameters.AddWithValue("@selected_group", selected_group);
        cmd.Parameters.AddWithValue("@selected_p_group", selected_p_group);
        cmd.ExecuteNonQuery();
        con5.Close();
    }

    public void auto_Save(object sender, EventArgs e)
    {

        for (int i = 1; i <= 29; i++) //part A
        {
            RadioButtonList rb = (RadioButtonList)Page.FindControl("RadioButtonList" + i);
            int question_num = i;

            if (rb.SelectedIndex >= 0)
            {
                question_score = Convert.ToInt32(rb.SelectedValue);
                TextBox lb_remarks = (TextBox)Page.FindControl("Remarks" + i);
                string remarks = lb_remarks.Text;
                submit_score_details(selected_group, question_num, question_score, NSL_type, selected_p_group, selected_option, remarks);
            }
        }

    }

    public void submit_score_details(string selected_group, int question_num, int score, string NSL_type, string p_group, string selected_option, string remarks)
    {
        total_score = total_score + score;
        SqlConnection con3 = obj.getcon();
        con3.Open();

        SqlCommand cmd1 = new SqlCommand("Select * from NSL_student_vs_simulation_details_v2_1 where student_group='" + selected_group + "' and practical_group='" + p_group + "' and NSL_type='" + NSL_type + "' and question_num='" + question_num + "' and selected_option='" + selected_option + "' ", con3);
        SqlDataReader dr1 = cmd1.ExecuteReader();
        if (dr1.HasRows)
        {
            //SqlCommand cmd = new SqlCommand("UPDATE  NSL_student_vs_simulation_details set question_score='" + score + "', remarks='" + remarks + "' where student_group='" + selected_group + "' and practical_group='" + p_group + "' and NSL_type='" + NSL_type + "' and question_num='" + question_num + "' and selected_option='" + selected_option + "'  ", con3);
            //cmd.ExecuteNonQuery();

            SqlCommand cmd = new SqlCommand("UPDATE  NSL_student_vs_simulation_details_v2_1 set question_score=@score , remarks=@remarks where student_group=@selected_group and practical_group=@p_group and NSL_type=@NSL_type and question_num=@question_num and selected_option=@selected_option ", con3);
            cmd.Parameters.AddWithValue("@score", score);
            cmd.Parameters.AddWithValue("@remarks", remarks);
            cmd.Parameters.AddWithValue("@selected_group", selected_group);
            cmd.Parameters.AddWithValue("@p_group", p_group);
            cmd.Parameters.AddWithValue("@NSL_type", NSL_type);
            cmd.Parameters.AddWithValue("@question_num", question_num);
            cmd.Parameters.AddWithValue("@selected_option", selected_option);
            int i = cmd.ExecuteNonQuery();

        }
        else
        {
            SqlCommand cmd = new SqlCommand("insert into NSL_student_vs_simulation_details_v2_1  (student_group,	NSL_type,question_num,question_score,practical_group,selected_option,remarks) values (@ans,@ans1,@ans2,@ans3,@ans5,@ans6,@ans7)", con3);
            cmd.Parameters.AddWithValue("@ans", selected_group);
            cmd.Parameters.AddWithValue("@ans1", NSL_type);
            cmd.Parameters.AddWithValue("@ans2", question_num);
            cmd.Parameters.AddWithValue("@ans3", score);
            cmd.Parameters.AddWithValue("@ans5", selected_p_group);
            cmd.Parameters.AddWithValue("@ans6", selected_option);
            cmd.Parameters.AddWithValue("@ans7", remarks);
            int i = cmd.ExecuteNonQuery();

        }

        con3.Close();



    }
    protected void Bt_start_Click(object sender, EventArgs e)
    {
        auto_Save(sender, e); //AUTO SAVE



        if (dl_option.SelectedItem.Value == "1")
        {

            Session["selected_option"] = dl_option.SelectedValue;
            Session["selected_group"] = selected_group;
            Response.Redirect("NSL_V2_1_Simulation1_G1.aspx");
        }
        else if (dl_option.SelectedItem.Value == "2")
        {

            Session["selected_option"] = dl_option.SelectedValue;
            Session["selected_group"] = selected_group;
            Response.Redirect("NSL_V2_1_Simulation1_G2.aspx");
        }

        else if (dl_option.SelectedItem.Value == "3")
        {

            Session["selected_option"] = dl_option.SelectedValue;
            Session["selected_group"] = selected_group;
            Response.Redirect("NSL_V2_1_Simulation1_G3.aspx");
        }
    }
    protected void onclick_Save(object sender, ImageClickEventArgs e)
    {
        string confirmValue_save = Request.Form["confirm_value"];
        if (confirmValue_save == "OK")
        {

            auto_Save(sender, e); //AUTO SAVE
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Successfully Saved');", true);
        }
    }
}
