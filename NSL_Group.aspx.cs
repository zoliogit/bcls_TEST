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
public partial class NSL_Group : System.Web.UI.Page
{
    MainClass obj = new MainClass();
    string STAFF_id, name;
    string practical_group_of_student;
       
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
       

        Button1.ImageUrl = "images/AddBtn.png";
   

       if(!IsPostBack)
       {
             BindPracticalGroups();
           //  BindSubGroups();

             BindGrid();
        }

            
        
       
    }
    protected void lb_from_searchbox_Click(object sender, EventArgs e)
    {
       
        string selected_group= dl_group.SelectedItem.Text;
          // getRecords(txtSearch.Text.Trim());
        string selected_practical_group = dl_P_group.SelectedItem.Text;
        

        if (selected_group != "-Select Group--")
        {
           

        getRecords(selected_group.Trim(),selected_practical_group.Trim());
        }

       
    }

    protected void rowdelete_Click(object sender, EventArgs e)// delete link for removing 
    {
        LinkButton lnkbtn = sender as LinkButton;
        GridViewRow gvrow = lnkbtn.NamingContainer as GridViewRow;                        //getting particular row linkbutton
        string student_id = Convert.ToString(GridView1.DataKeys[gvrow.RowIndex].Value);     //getting userid of particular row


        string confirmValue = Request.Form["confirm_value"];//java script for confirmation is written on aspx page
        if (confirmValue == "Yes")
        {
            SqlConnection con = obj.getcon();
            con.Open();

            //SqlCommand cmd1 = new SqlCommand("update NSL_student_details set IsActive='0' where student_id=@student_ID1", con);

            SqlCommand cmd1 = new SqlCommand("delete from  NSL_student_details where student_id=@student_ID1", con);
           
            cmd1.Parameters.Add(new SqlParameter("student_ID1", student_id));
            int result = cmd1.ExecuteNonQuery();


            if (result == 1)
            {
                BindGrid();
            
                // alert message after successfull deletion of user
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('Student with ID " + student_id + " is removed successfully')", true);
            }
            con.Close();
        }
        else
        {
            Response.Redirect("NSL_Group.aspx");
        }
   

    }
    private void getRecords(string selected_group,string selected_practical_group)
    {
        SqlConnection con = obj.getcon();
        con.Open();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        SqlDataAdapter adp = new SqlDataAdapter();
        try
        {
            if (selected_practical_group == "--Show All--")
            {
                cmd = new SqlCommand("select student_id,UPPER(student_name) as student_name ,student_group,practical_group,percent_score_sim1,percent_score_sim2,percent_score_sim3,percent_score_mgc,edited_score_remarks_sim1,edited_score_remarks_sim2,edited_score_remarks_sim3,edited_score_remarks_mgc from NSL_student_details where student_group = @SearchVal  and IsActive='1' and  practical_group IN( select p_group_name from NSL_staff_vs_practical_group where staff_id=@SearchVal2) ORDER BY student_name  ", con);
                cmd.Parameters.AddWithValue("@SearchVal", selected_group);
                cmd.Parameters.AddWithValue("@SearchVal2", STAFF_id);
           
            }
            else
            {
                cmd = new SqlCommand("select student_id,UPPER(student_name) as student_name ,student_group,practical_group,percent_score_sim1,percent_score_sim2,percent_score_sim3,percent_score_mgc,edited_score_remarks_sim1,edited_score_remarks_sim2,edited_score_remarks_sim3,edited_score_remarks_mgc from NSL_student_details where student_group = @SearchVal  and IsActive='1' and practical_group=@SearchVal2 ORDER BY student_name  ", con);
                cmd.Parameters.AddWithValue("@SearchVal", selected_group);
                cmd.Parameters.AddWithValue("@SearchVal2", selected_practical_group);
           
            }
            adp.SelectCommand = cmd;
            adp.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
           
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
    private void BindGrid()
    {
        SqlConnection con9 = obj.getcon();
        con9.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con9;
       //cmd.CommandText = "select student_id,UPPER(student_name) as student_name ,student_group,sim1,sim2,sim3,mgc,practical_group from NSL_student_details where staff_id=@status1 and IsActive='1' ORDER BY student_name ";

     cmd.CommandText = "select student_id,UPPER(student_name) as student_name ,student_group,percent_score_sim1,	percent_score_sim2,	percent_score_sim3,	percent_score_mgc,practical_group,edited_score_remarks_sim1,edited_score_remarks_sim2,edited_score_remarks_sim3,edited_score_remarks_mgc from NSL_student_details where  IsActive='1' and   practical_group IN( select 	p_group_name from NSL_staff_vs_practical_group where staff_id=@status1) ORDER BY student_name";  
        
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

        }
        else
        {
            download.Visible = true;
        }
        con9.Close();
    }

    private void BindPracticalGroups()
    {
        SqlConnection con2 = obj.getcon();
        con2.Open();
        //for to bind all the chiefinsructor's name to dropdown list
        SqlCommand cmd_dl = new SqlCommand("Select p_group_name FROM NSL_staff_vs_practical_group where staff_id='" + STAFF_id + "' ", con2);

       
        
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
    private void BindSubGroups()
     {
         //SqlConnection con2 = obj.getcon();
         //con2.Open();
        
  
         //SqlCommand cmd_dl = new SqlCommand("Select Distinct student_group FROM NSL_student_details where practical_group IN( select p_group_name from NSL_staff_vs_practical_group where staff_id='"+STAFF_id+"') ORDER BY student_group", con2);
         //SqlDataAdapter da_dl = new SqlDataAdapter(cmd_dl);
         //DataSet ds = new DataSet();
         //da_dl.Fill(ds);
         //dl_group.DataSource = ds;

         //dl_group.DataTextField = "student_group";
         //dl_group.DataValueField = "student_group";
         //dl_group.DataBind();
        // dl_group.Items.Insert(0, new ListItem("--Select Group--", "0"));
         dl_group.Items.Insert(0, new ListItem("1", "1"));
         dl_group.Items.Insert(0, new ListItem("2", "2"));
         dl_group.Items.Insert(0, new ListItem("3", "3"));
         dl_group.Items.Insert(0, new ListItem("4", "4"));
       
        // con2.Close();
     }
    protected void download_Click(object sender, ImageClickEventArgs e)
    {

        string trim_name= name.Replace(" ", string.Empty);
        string attachment_filename = "NSL_"+STAFF_id+"_"+trim_name+".xls";
      

        Response.Clear();
        Response.Buffer = true;
       Response.AddHeader("content-disposition", "attachment;filename="+attachment_filename);
       
     //  Response.AddHeader("content-disposition", "attachment;filename=Simulation_StudentDetails.xls");
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";
        using (StringWriter sw = new StringWriter())
        {
            HtmlTextWriter hw = new HtmlTextWriter(sw);

            //To Export all pages
            GridView1.AllowPaging = false;
            this.BindGrid();
            GridView1.HeaderRow.BackColor = Color.White;



            GridView1.HeaderRow.Cells[12].Visible = false;
            GridView1.HeaderRow.Cells[13].Visible = false;


            for (int i = 0; i < GridView1.Rows.Count; i++)
            {

                GridViewRow row = GridView1.Rows[i];
                row.Cells[12].Visible = false;
                row.Cells[13].Visible = false;

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
    protected void Button1_Click(object sender, ImageClickEventArgs e) //ADD Button
    {
        SqlConnection con = obj.getcon();
        con.Open();
        try
        {
            SqlCommand cmd77 = new SqlCommand("select student_id,student_name,	practical_group	 from NSL_student_details where student_id='" + tb_student_id.Text + "' ", con);
            SqlDataReader dr77 = cmd77.ExecuteReader();
            if (dr77.HasRows)// student_id doesnt exists
            {

                while (dr77.Read())
                {
                    practical_group_of_student = dr77[2].ToString();

                }
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('Student with this ID is already exist in practical group: " + practical_group_of_student + " ')", true);
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('Test with ID " + test_id + " deleted successfully')", true);

            }
            else  //insert
            {

                ArrayList e_student_list = new ArrayList();

                SqlCommand cmd = new SqlCommand("insert NSL_student_details  (student_id,student_name,student_group,staff_id,practical_group)values(@STUDENT_id,@STUDENT_NAME,@STUDENT_GROUP,@STAFF_ID,@P_Group)", con);
                cmd.Parameters.Add(new SqlParameter("STUDENT_id", tb_student_id.Text));
                cmd.Parameters.Add(new SqlParameter("STUDENT_NAME", tb_studentname.Text));
                cmd.Parameters.Add(new SqlParameter("STUDENT_GROUP", default_group.SelectedItem.Text));
                cmd.Parameters.Add(new SqlParameter("STAFF_ID", STAFF_id));
                cmd.Parameters.Add(new SqlParameter("P_Group", dl_P_group.SelectedItem.Text));
                int val = cmd.ExecuteNonQuery();
                // BindGrid();
                // BindSubGroups();
                tb_student_id.Text = "";
                tb_studentname.Text = "";
                // tb_group.Text = "";

                // BindPracticalGroups();

                string selected_p_group = dl_P_group.SelectedItem.Text;

                getsubgroups(selected_p_group.Trim());
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('Successfully Added !!')", true);

            }

        }
        catch (Exception ex)
        {
           
        }
        finally
        {
            con.Close();
        }
      
    }



    protected void EditStudent(object sender, GridViewEditEventArgs e)
    {

        GridView1.EditIndex = e.NewEditIndex;
        dl_P_group_SelectedIndexChanged(sender, e);
       // BindGrid();

    }

    protected void CancelEdit(object sender, GridViewCancelEditEventArgs e)
    {

        GridView1.EditIndex = -1;
        dl_P_group_SelectedIndexChanged(sender, e);
        BindGrid();

    }

    protected void UpdateStudent(object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow row = GridView1.Rows[e.RowIndex]; // this line is changed      
        string student_ID = GridView1.DataKeys[e.RowIndex].Values["student_id"].ToString();

        TextBox t1_group = row.FindControl("txtgroup") as TextBox;
        TextBox t1_sim1 = row.FindControl("txtsim1") as TextBox;
        TextBox t1_sim2 = row.FindControl("txtsim2") as TextBox;
        TextBox t1_sim3 = row.FindControl("txtsim3") as TextBox;
        TextBox t1_mgc = row.FindControl("txtmgc") as TextBox;
        TextBox t1_p_group = row.FindControl("txt_p_group") as TextBox;
        TextBox t1_sim1_remarks = row.FindControl("txtsim1_remarks") as TextBox;
        TextBox t1_sim2_remarks = row.FindControl("txtsim2_remarks") as TextBox;
        TextBox t1_sim3_remarks = row.FindControl("txtsim3_remarks") as TextBox;
        TextBox t1_mgc_remarks = row.FindControl("txtmgc_remarks") as TextBox;

     
        SqlConnection con99 = obj.getcon();
        con99.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con99;
        cmd.CommandText = "update NSL_student_details set student_group=@Group,	percent_score_sim1=@sim1,percent_score_sim2=@sim2,	percent_score_sim3=@sim3,percent_score_mgc=@mgc,edited_score_remarks_sim1=@edited_score_remarks_sim1,edited_score_remarks_sim2=@edited_score_remarks_sim2,edited_score_remarks_sim3=@edited_score_remarks_sim3,edited_score_remarks_mgc=@edited_score_remarks_mgc where student_id=@studentID";
        SqlParameter param1 = new SqlParameter("@studentID", student_ID);

        SqlParameter param2, param3, param4, param5, param6,param7,param8,param9,param10;
        if (t1_group.Text == string.Empty)
        {
            param2 = new SqlParameter("@Group", DBNull.Value);

        }
        else
        {
            param2 = new SqlParameter("@Group", t1_group.Text);

        }
        if (t1_sim1.Text == string.Empty)
        {
            param3 = new SqlParameter("@sim1", DBNull.Value);

        }
        else
        {
            param3 = new SqlParameter("@sim1", t1_sim1.Text);

        }
        if (t1_sim2.Text == string.Empty)
        {
            param4 = new SqlParameter("@sim2", DBNull.Value);

        }
        else
        {
            param4 = new SqlParameter("@sim2", t1_sim2.Text);

        }
        if (t1_sim3.Text == string.Empty)
        {
            param5 = new SqlParameter("@sim3", DBNull.Value);

        }
        else
        {
            param5 = new SqlParameter("@sim3", t1_sim3.Text);

        }

        if (t1_mgc.Text == string.Empty)
        {
            param6 = new SqlParameter("@mgc", DBNull.Value);

        }
        else
        {
            param6 = new SqlParameter("@mgc", t1_mgc.Text);

        }
        if (t1_sim1_remarks.Text == string.Empty)
        {
            param7 = new SqlParameter("@edited_score_remarks_sim1", DBNull.Value);

        }
        else
        {
            param7 = new SqlParameter("@edited_score_remarks_sim1", t1_sim1_remarks.Text);

        }
        if (t1_sim2_remarks.Text == string.Empty)
        {
            param8 = new SqlParameter("@edited_score_remarks_sim2", DBNull.Value);

        }
        else
        {
            param8 = new SqlParameter("@edited_score_remarks_sim2", t1_sim2_remarks.Text);

        }
        if (t1_sim3_remarks.Text == string.Empty)
        {
            param9 = new SqlParameter("@edited_score_remarks_sim3", DBNull.Value);

        }
        else
        {
            param9 = new SqlParameter("@edited_score_remarks_sim3", t1_sim3_remarks.Text);

        }
        if (t1_mgc_remarks.Text == string.Empty)
        {
            param10 = new SqlParameter("@edited_score_remarks_mgc", DBNull.Value);

        }
        else
        {
            param10 = new SqlParameter("@edited_score_remarks_mgc", t1_mgc_remarks.Text);

        }

        //SqlParameter param7= new SqlParameter("@p_group", t1_p_group.Text);

        cmd.Parameters.Add(param1);
        cmd.Parameters.Add(param2);
        cmd.Parameters.Add(param3);
        cmd.Parameters.Add(param4);
        cmd.Parameters.Add(param5);
        cmd.Parameters.Add(param6);

        cmd.Parameters.Add(param7);
        cmd.Parameters.Add(param8);
        cmd.Parameters.Add(param9);
        cmd.Parameters.Add(param10);


        GridView1.EditIndex = -1;
        cmd.ExecuteNonQuery();



        con99.Close();

        BindGrid();


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
        SqlConnection con_subgroup = obj.getcon();
        con_subgroup.Open();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        SqlDataAdapter adp = new SqlDataAdapter();
        try
        {

            cmd = new SqlCommand("select student_id,UPPER(student_name) as student_name ,student_group,practical_group,percent_score_sim1,	percent_score_sim2,	percent_score_sim3,	percent_score_mgc,practical_group,edited_score_remarks_sim1,edited_score_remarks_sim2,edited_score_remarks_sim3,edited_score_remarks_mgc from NSL_student_details where practical_group = @SearchVal  and IsActive='1'   ORDER BY student_name  ", con_subgroup);
            cmd.Parameters.AddWithValue("@SearchVal", selected_p_group);
            cmd.Parameters.AddWithValue("@staff_id", STAFF_id);
           
            adp.SelectCommand = cmd;
            adp.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                GridView1.DataSource = dt;
                GridView1.DataBind();
                download.Visible = true;
            }
            else
            {
                GridView1.DataSource = dt;
                GridView1.DataBind();
                download.Visible = false;
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
            con_subgroup.Close();
        }

    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        LinkButton lnk_delete = (LinkButton)e.Row.FindControl("lnkdelete"); //status link for edit score
        //lnk_delete.CommandArgument = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "student_id"));
        string Namecolumnvalue_sim1 = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "percent_score_sim1"));
        string Namecolumnvalue_sim2 = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "percent_score_sim2"));
        string Namecolumnvalue_sim3 = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "percent_score_sim3"));
        string Namecolumnvalue_mgc = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "percent_score_mgc"));

        if ((Namecolumnvalue_sim1 != "") || (Namecolumnvalue_sim2 != "") || (Namecolumnvalue_sim3 != "") || (Namecolumnvalue_mgc != "")) 
        {
            lnk_delete.Visible = false;//already conducted a session
        }
    }


}
