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
public partial class NSL_All_Groups_v2_2 : System.Web.UI.Page
{
    MainClass obj = new MainClass();
    string STAFF_id, name;
    protected void Page_Load(object sender, EventArgs e)
    {
        name = (string)Session["staffname"];
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



        if (!IsPostBack)
        {
            BindPracticalGroups();
            BindGrid();

        }

    }
    private void BindGrid()
    {
        SqlConnection con9 = obj.getcon();
        con9.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con9;
        // cmd.CommandText = "select student_id,UPPER(student_name) as student_name ,student_group,sim1,sim2,sim3,mgc,practical_group from NSL_student_details where staff_id=@status1 and IsActive='1' ORDER BY student_name ";

        cmd.CommandText = "select student_id,UPPER(student_name) as student_name ,student_group,percent_score_sim1,percent_score_sim2,	percent_score_sim3,	percent_score_mgc,practical_group,submitted_staff_sim1,submitted_staff_sim2,submitted_staff_sim3,submitted_staff_mgc ,	edited_score_remarks_sim1,	edited_score_remarks_sim2,	edited_score_remarks_sim3,	edited_score_remarks_mgc  from NSL_student_details_v2_2 where  IsActive='1'  ORDER BY practical_group,student_group,student_name";

        SqlParameter param1 = new SqlParameter("@status1", STAFF_id);
        cmd.Parameters.Add(param1);
        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        adapter.Fill(ds);


        GridView1.DataSource = ds;
        GridView1.DataBind();

        //// Condition to check if dataset tables contains data or not
        if (ds.Tables[0].Rows.Count == 0)
        {
            download.Visible = false;
            archive.Visible = false;
        }
        else
        {
            download.Visible = true;
            archive.Visible = true;

        }

        con9.Close();
    }
    private void BindPracticalGroups()
    {
        SqlConnection con2 = obj.getcon();
        con2.Open();
        //for to bind all the chiefinsructor's name to dropdown list
        SqlCommand cmd_dl = new SqlCommand("Select distinct p_group_name FROM NSL_staff_vs_practical_group_v2_2 order by  p_group_name ", con2);



        SqlDataAdapter da_dl = new SqlDataAdapter(cmd_dl);
        DataSet ds = new DataSet();
        da_dl.Fill(ds);
        dl_P_group.DataSource = ds;

        dl_P_group.DataTextField = "p_group_name";
        dl_P_group.DataValueField = "p_group_name";
        dl_P_group.DataBind();
        dl_P_group.Items.Insert(0, new ListItem("--Show All--", "0"));
        con2.Close();
    }
    protected void dl_P_group_SelectedIndexChanged(object sender, EventArgs e)
    {
        string selected_p_group = dl_P_group.SelectedItem.Text;

        if (selected_p_group == "--Show All--")
        {

            BindGrid();
        }
        else
        {
            getsubgroups(selected_p_group.Trim());
        }


    }
    private void getsubgroups(string selected_p_group)
    {
        SqlConnection con = obj.getcon();
        con.Open();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        SqlDataAdapter adp = new SqlDataAdapter();
        try
        {

            cmd = new SqlCommand("select student_id,UPPER(student_name) as student_name ,student_group,practical_group,percent_score_sim1,	percent_score_sim2,	percent_score_sim3,	percent_score_mgc,practical_group,edited_score_remarks_sim1,edited_score_remarks_sim2,edited_score_remarks_sim3,edited_score_remarks_mgc,submitted_staff_sim1,submitted_staff_sim2,submitted_staff_sim3,submitted_staff_mgc  from NSL_student_details_v2_2 where practical_group = @SearchVal  and IsActive='1'   ORDER BY student_group,student_name  ", con);
            cmd.Parameters.AddWithValue("@SearchVal", selected_p_group);

            adp.SelectCommand = cmd;
            adp.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                GridView1.DataSource = dt;
                GridView1.DataBind();
                download.Visible = true;
                archive.Visible = true;
            }
            else
            {
                GridView1.DataSource = dt;
                GridView1.DataBind();
                download.Visible = false;
                archive.Visible = false;
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
            con.Close();
        }

    }

    protected void download_Click(object sender, ImageClickEventArgs e)
    {

        string trim_name = name.Replace(" ", string.Empty);
        string attachment_filename = "NSL_" + STAFF_id + "_" + trim_name + ".xls";

        Response.Clear();
        Response.Buffer = true;



        Response.AddHeader("content-disposition", "attachment;filename=" + attachment_filename);

        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";
        using (StringWriter sw = new StringWriter())
        {
            HtmlTextWriter hw = new HtmlTextWriter(sw);

            //To Export all pages
            GridView1.AllowPaging = false;
            this.BindGrid();
            GridView1.HeaderRow.BackColor = Color.White;




            for (int i = 0; i < GridView1.Rows.Count; i++)
            {

                GridViewRow row = GridView1.Rows[i];

            }
            GridView1.RenderControl(hw);

            Response.Output.Write(sw.ToString());
            Response.Flush();
            Response.End();
        }
    }
    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Verifies that the control is rendered */
    }

    protected void archive_Click(object sender, ImageClickEventArgs e)
    {
        string confirmValue122 = Request.Form["confirm_value"];
        if (confirmValue122 == "Yes")
        {
            SqlConnection con = obj.getcon();
            con.Open();
            SqlCommand cmd = new SqlCommand("update NSL_student_details_v2_2 set IsActive='0' where IsActive='1' ", con);
            int val = cmd.ExecuteNonQuery();
            SqlCommand cmd2 = new SqlCommand("delete from NSL_student_vs_simulation_details_v2_2 ", con);
            int val2 = cmd2.ExecuteNonQuery();
            con.Close();
            BindGrid();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('Archived successfully')", true);

        }
    }
}
