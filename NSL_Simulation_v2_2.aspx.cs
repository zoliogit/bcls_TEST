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
public partial class NSL_Simulation_v2_2 : System.Web.UI.Page
{
    MainClass obj = new MainClass();
    string STAFF_id;
    string clicked_simulation_type;
    protected void Page_Load(object sender, EventArgs e)
    {

        string name = (string)Session["staffname"];
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

        btn_go.ImageUrl = "images/BtnContinue (1).png";

        clicked_simulation_type = Session["clicked_simulation_type"].ToString();

        if (!IsPostBack)
        {

            Bind_practial_DropDown();

        }


    }
    private void Bind_practial_DropDown()
    {
        SqlConnection con2 = obj.getcon();
        con2.Open();
        //for to bind all the chiefinsructor's name to dropdown list
        SqlCommand cmd_dl = new SqlCommand("Select Distinct p_group_name FROM  NSL_staff_vs_practical_group_v2_2  where staff_id = '" + STAFF_id + "' ", con2);
        SqlDataAdapter da_dl = new SqlDataAdapter(cmd_dl);
        DataSet ds = new DataSet();
        da_dl.Fill(ds);
        dl_practical_group.DataSource = ds;

        dl_practical_group.DataTextField = "p_group_name";
        dl_practical_group.DataValueField = "p_group_name";
        dl_practical_group.DataBind();
        //dl_practical_group.Items.Insert(0, new ListItem("--Show All--", "0"));
        //dl_group.Items.Insert(0, new ListItem("--Show All--", "0"));

        SqlCommand cmd111 = new SqlCommand("select distinct student_group from NSL_student_details_v2_2 where practical_group ='" + dl_practical_group.SelectedItem + "' and  IsActive='1' ", con2);
        SqlDataAdapter da111 = new SqlDataAdapter(cmd111);
        DataSet ds111 = new DataSet();
        da111.Fill(ds111);

        dl_group.DataSource = ds111;
        dl_group.DataTextField = "student_group";
        dl_group.DataValueField = "student_group";
        dl_group.DataBind();






        SqlCommand cmd22 = new SqlCommand();
        cmd22.Connection = con2;
        DataSet ds22 = new DataSet();

        cmd22.CommandText = "select student_id,UPPER(student_name) as student_name ,practical_group,student_group,percent_score_sim1,percent_score_sim2,percent_score_sim3,percent_score_mgc from NSL_student_details_v2_2 where  IsActive='1' and  practical_group=@p_group and student_group=@student_group  ORDER BY student_name ";
        //   SqlParameter param1 = new SqlParameter("@status1", STAFF_id);
        SqlParameter param2 = new SqlParameter("@student_group", dl_group.SelectedValue);
        SqlParameter param3 = new SqlParameter("@p_group", dl_practical_group.SelectedValue);

        //  cmd22.Parameters.Add(param1);
        cmd22.Parameters.Add(param2);
        cmd22.Parameters.Add(param3);
        SqlDataAdapter adapter22 = new SqlDataAdapter(cmd22);

        adapter22.Fill(ds22);
        GridView1.DataSource = ds22;
        GridView1.DataBind();
        //// Condition to check if dataset tables contains data or not
        if (ds22.Tables[0].Rows.Count == 0)
        {
            btn_go.Visible = false;

        }
        else
        {
            btn_go.Visible = true;

        }
        con2.Close();
    }
    protected void dl_practical_group_SelectedIndexChanged(object sender, EventArgs e)
    {
        string selected_p_group = dl_practical_group.SelectedItem.Text;
        SqlConnection con = obj.getcon();
        con.Open();
        SqlCommand cmd = new SqlCommand("select distinct student_group from NSL_student_details_v2_2 where practical_group='" + dl_practical_group.SelectedItem + "' and  IsActive='1' ", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);

        dl_group.DataSource = ds;
        dl_group.DataTextField = "student_group";
        dl_group.DataValueField = "student_group";
        dl_group.DataBind();
        // dl_group.Items.Insert(0, new ListItem("-- All --", "0"));

        SqlCommand cmd22 = new SqlCommand();
        cmd22.Connection = con;
        DataSet ds22 = new DataSet();



        cmd22.CommandText = "select student_id,UPPER(student_name) as student_name ,practical_group,student_group,percent_score_sim1,percent_score_sim2,percent_score_sim3,percent_score_mgc from NSL_student_details_v2_2 where  IsActive='1' and  practical_group=@p_group and student_group=@student_group   ORDER BY student_name ";
        //   SqlParameter param1 = new SqlParameter("@status1", STAFF_id);
        SqlParameter param2 = new SqlParameter("@student_group", dl_group.SelectedValue);
        SqlParameter param3 = new SqlParameter("@p_group", dl_practical_group.SelectedValue);

        // cmd22.Parameters.Add(param1);
        cmd22.Parameters.Add(param2);
        cmd22.Parameters.Add(param3);
        SqlDataAdapter adapter22 = new SqlDataAdapter(cmd22);

        adapter22.Fill(ds22);
        GridView1.DataSource = ds22;
        GridView1.DataBind();
        //// Condition to check if dataset tables contains data or not
        if (ds22.Tables[0].Rows.Count == 0)
        {
            btn_go.Visible = false;

        }
        else
        {
            btn_go.Visible = true;

        }
        con.Close();
    }

    protected void ddlgroup_SelectedIndexChanged(object sender, EventArgs e)
    {


        SqlConnection con9 = obj.getcon();
        con9.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con9;
        DataSet ds = new DataSet();
        //if (dl_group.SelectedValue != "0")
        //{
        cmd.CommandText = "select student_id,UPPER(student_name) as student_name ,practical_group,student_group,percent_score_sim1,percent_score_sim2,percent_score_sim3,percent_score_mgc from NSL_student_details_v2_2 where  IsActive='1' and student_group=@student_group and practical_group=@p_group ORDER BY student_name ";
        //   SqlParameter param1 = new SqlParameter("@status1", STAFF_id);
        SqlParameter param2 = new SqlParameter("@student_group", dl_group.SelectedValue);
        SqlParameter param3 = new SqlParameter("@p_group", dl_practical_group.SelectedValue);

        //  cmd.Parameters.Add(param1);
        cmd.Parameters.Add(param2);
        cmd.Parameters.Add(param3);
        SqlDataAdapter adapter = new SqlDataAdapter(cmd);

        adapter.Fill(ds);



        GridView1.DataSource = ds;
        GridView1.DataBind();
        //// Condition to check if dataset tables contains data or not
        if (ds.Tables[0].Rows.Count == 0)
        {
            btn_go.Visible = false;

        }
        else
        {
            btn_go.Visible = true;

        }
        con9.Close();





    }
    protected void continue_Click(object sender, ImageClickEventArgs e)
    {
        if (dl_group.SelectedValue == "")
        {

            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('Please select a SIM group to continue the test .')", true);
            return;
        }

        Session["selected_group"] = dl_group.SelectedValue;
        Session["selected_p_group"] = dl_practical_group.SelectedValue;
        if (clicked_simulation_type == "sim1")
        {
            SqlConnection con = obj.getcon();
            con.Open();

            SqlCommand cmd = new SqlCommand("Select sim1,option_sim1 from NSL_student_details_v2_2 where student_group='" + dl_group.SelectedValue + "' and practical_group='" + dl_practical_group.SelectedValue + "' and  IsActive='1'  ", con);
            SqlDataReader dr2 = cmd.ExecuteReader();
            if (dr2.HasRows == true)
            {
                while (dr2.Read())
                {

                    string sim1_score = dr2[0].ToString();
                    string sim1_option = dr2[1].ToString();

                    if ((dr2[1].ToString() == "") || (dr2[1].ToString() == "Option 1"))
                    {

                        Response.Redirect("NSL_V2_2_Simulation1_G1.aspx");

                    }

                    else if (dr2[1].ToString() == "Option 2")
                    {
                        Response.Redirect("NSL_V2_2_Simulation1_G2.aspx");

                    }
                    else if (dr2[1].ToString() == "Option 3")
                    {
                        Response.Redirect("NSL_V2_2_Simulation1_G3.aspx");

                    }

                }
            }

            con.Close();
        }
        if (clicked_simulation_type == "sim2")
        {
            SqlConnection con = obj.getcon();
            con.Open();

            SqlCommand cmd = new SqlCommand("Select sim2,option_sim2 from NSL_student_details_v2_2 where student_group='" + dl_group.SelectedValue + "' and practical_group='" + dl_practical_group.SelectedValue + "'  and IsActive='1' ", con);
            SqlDataReader dr2 = cmd.ExecuteReader();
            if (dr2.HasRows == true)
            {
                while (dr2.Read())
                {

                    string sim2_score = dr2[0].ToString();
                    string sim2_option = dr2[1].ToString();

                    if ((dr2[1].ToString() == "") || (dr2[1].ToString() == "Option 1"))
                    {

                        Response.Redirect("NSL_V2_2_Simulation2_G1.aspx");

                    }

                    else if (dr2[1].ToString() == "Option 2")
                    {
                        Response.Redirect("NSL_V2_2_Simulation2_G2.aspx");

                    }
                    else if (dr2[1].ToString() == "Option 3")
                    {
                        Response.Redirect("NSL_V2_2_Simulation2_G3.aspx");

                    }

                }
            }

            con.Close();
        }


        if (clicked_simulation_type == "sim3")
        {
            SqlConnection con = obj.getcon();
            con.Open();

            SqlCommand cmd = new SqlCommand("Select sim3,option_sim3 from NSL_student_details_v2_2 where student_group='" + dl_group.SelectedValue + "' and practical_group='" + dl_practical_group.SelectedValue + "' and  IsActive='1'  ", con);
            SqlDataReader dr2 = cmd.ExecuteReader();
            if (dr2.HasRows == true)
            {
                while (dr2.Read())
                {

                    string sim2_score = dr2[0].ToString();
                    string sim2_option = dr2[1].ToString();

                    if ((dr2[1].ToString() == "") || (dr2[1].ToString() == "Option 1"))
                    {

                        Response.Redirect("NSL_V2_2_Simulation3_G1.aspx");

                    }

                    else if (dr2[1].ToString() == "Option 2")
                    {
                        Response.Redirect("NSL_V2_2_Simulation3_G2.aspx");

                    }
                    else if (dr2[1].ToString() == "Option 3")
                    {
                        Response.Redirect("NSL_V2_2_Simulation3_G3.aspx");

                    }

                }
            }

            con.Close();
        }

    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {


    }
}
