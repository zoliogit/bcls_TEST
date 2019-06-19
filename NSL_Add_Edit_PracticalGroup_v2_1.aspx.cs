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
public partial class NSL_Add_Edit_PracticalGroup_v2_1 : System.Web.UI.Page
{

    MainClass obj = new MainClass();

    string staff_id;
    protected void Page_Load(object sender, EventArgs e)
    {
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
       


        bt_add.ImageUrl = "images/AddBtn.png";
        staff_id = Session["group_staff_id"].ToString();
        lb_staffid.Text = staff_id;

        BindStaffGroups();
        BindListBox();


    }
    protected void bt_add_Click(object sender, ImageClickEventArgs e)
    {


        for (int i = 0; i < lb_p_group.Items.Count; i++)
        {

            if (lb_p_group.Items[i].Selected == true)
            {
                SqlConnection con = obj.getcon();
                con.Open();

                SqlCommand cmd77 = new SqlCommand("select * from NSL_staff_vs_practical_group_v2_1 where staff_id='" + staff_id + "' and p_group_name='" + lb_p_group.Items[i].ToString() + "' ", con);
                SqlDataReader dr77 = cmd77.ExecuteReader();
                if (dr77.HasRows == false)// student_id doesnt exists
                {
                    SqlCommand cmd = new SqlCommand("insert into NSL_staff_vs_practical_group_v2_1 (staff_id,p_group_name)values(@STAFF_id,@P_GROUP)", con);
                    cmd.Parameters.Add(new SqlParameter("STAFF_id", staff_id));
                    cmd.Parameters.Add(new SqlParameter("P_GROUP", lb_p_group.Items[i].ToString()));
                    int val = cmd.ExecuteNonQuery();
                }
                con.Close();
            }
        }


        BindStaffGroups();

    }

    protected void BindStaffGroups()
    {
        SqlConnection con1 = obj.getcon();
        con1.Open();
        DataSet ds = new DataSet();
        SqlDataAdapter adapter = new SqlDataAdapter("SELECT p_group_name  FROM  NSL_staff_vs_practical_group_v2_1 where staff_id='" + staff_id + "' ", con1);
        adapter.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
        con1.Close();

    }
    protected void BindListBox()
    {
        SqlConnection con_lb = obj.getcon();
        con_lb.Open();
        SqlCommand cmd_lb = new SqlCommand("SELECT  [p_group_name] FROM [NSL_practical_group] ORDER BY p_group", con_lb);
        SqlDataReader dr_lb = cmd_lb.ExecuteReader();
        while (dr_lb.Read())
        {
            string GROUP = dr_lb[0].ToString();

            lb_p_group.Items.Add(GROUP);
        }
        con_lb.Close();
    }

    protected void lnkremove_Click(object sender, EventArgs e)
    {
        string confirmValue = Request.Form["confirm_value"];
        if (confirmValue == "Yes")
        {
            LinkButton lnkbtn = sender as LinkButton;
            GridViewRow gvrow = lnkbtn.NamingContainer as GridViewRow;                  //getting particular row linkbutton
            string selected_p_group = gvrow.Cells[1].Text;

            SqlConnection con33 = obj.getcon();
            con33.Open();
            SqlCommand cmd_delete = new SqlCommand("delete NSL_staff_vs_practical_group_v2_1 where staff_id='" + staff_id + "' and p_group_name='" + selected_p_group + "' ", con33);
            cmd_delete.ExecuteNonQuery();
            con33.Close();
            BindStaffGroups();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('Removed Successfully')", true);

        }
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
    }

}

