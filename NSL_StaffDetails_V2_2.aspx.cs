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
public partial class NSL_StaffDetails_V2_2 : System.Web.UI.Page
{
    MainClass obj = new MainClass();
    protected void Page_Load(object sender, EventArgs e)
    {

        string st_role = (string)Session["staffrole"];
        Button1.ImageUrl = "images/BtnAddNewStaff.png";


        string name = (string)Session["staffname"];

        String logintime = (string)Session["lasttime"];

        if (Session["id"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        else
        {
            int ID = (int)Session["id"];
            if (ID < 22)
                Response.Redirect("NSL_Login.aspx");
        }

        // Code disables caching by browser.
        Response.Cache.SetCacheability(HttpCacheability.NoCache);// this tells the client not to cache responses in the History folder, so that when you use the back/forward buttons the client requests a new version of the response each time.
        Response.Cache.SetExpires(DateTime.UtcNow.AddHours(-1));
        Response.Cache.SetNoStore();

        if (!IsPostBack)
        {
            BindUserDetails();
        }

    }



    protected void lnkdelete_Click(object sender, EventArgs e)
    {

        string confirmValue = Request.Form["confirm_value"];//java script for confirmation is written on aspx page
        if (confirmValue == "Yes")
        {

            LinkButton lnkbtn = sender as LinkButton;
            GridViewRow gvrow = lnkbtn.NamingContainer as GridViewRow;                  //getting particular row linkbutton
            string id = Convert.ToString(GridView1.DataKeys[gvrow.RowIndex].Value);     //getting userid of particular row
            string username = gvrow.Cells[1].Text;
            SqlConnection con = obj.getcon();
            con.Open();
            SqlCommand cmd = new SqlCommand("DELETE FROM NSL_staff_details WHERE staff_id=@STAFF_id ", con);
            cmd.Parameters.Add(new SqlParameter("STAFF_id", id));
            int result = cmd.ExecuteNonQuery();


            //SqlCommand cmd_del = new SqlCommand("DELETE FROM NSL_staff_vs_practical_group WHERE staff_id=@STAFF_id ", con);
            //cmd_del.Parameters.Add(new SqlParameter("STAFF_id", id));
            //int result_del = cmd_del.ExecuteNonQuery();
            if (result == 1)
            {
                BindUserDetails();
                //Displaying alert message after successfull deletion of user
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('Deleted the details of " + username + " successfully')", true);
                con.Close();


            }
        }
    }
    protected void lnkedit_Click(object sender, EventArgs e)
    {

        LinkButton lnkbtn = sender as LinkButton;
        GridViewRow gvrow = lnkbtn.NamingContainer as GridViewRow;                  //getting particular row linkbutton
        string id = Convert.ToString(GridView1.DataKeys[gvrow.RowIndex].Value);     //getting userid of particular row
        string staff_id = gvrow.Cells[0].Text; //staff id
        Session["group_staff_id"] = staff_id;
        Response.Redirect("NSL_Add_Edit_PracticalGroup_v2_2.aspx");


    }



    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        foreach (TableCell tc in e.Row.Cells)
        {

            tc.Attributes["style"] = "border-color: #98272d";

        }
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //identifying the control in gridview
            LinkButton lnkbtnresult = (LinkButton)e.Row.FindControl("lnkdelete");

            LinkButton pwd = (LinkButton)e.Row.FindControl("lnkpass"); //pswd button


            //getting username from particular row
            string username = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "staff_name"));
            string stafftype = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "NPstaff"));

            //raising javascript confirmationbox whenver user clicks on link button
            //lnkbtnresult.Attributes.Add("onclick", "javascript:return ConfirmationBox('" + username + "')");
        }
        //for (int i = GridView1.Rows.Count - 1; i > 0; i--)
        //{
        //    GridViewRow row = GridView1.Rows[i];
        //    GridViewRow previousRow = GridView1.Rows[i - 1];
        //    for (int j = 0; j < row.Cells.Count; j++)
        //    {
        //        if (row.Cells[j].Text == previousRow.Cells[j].Text)
        //        {
        //            if (previousRow.Cells[j].RowSpan == 0)
        //            {
        //                if (row.Cells[j].RowSpan == 0)
        //                {
        //                    previousRow.Cells[j].RowSpan += 2;
        //                }
        //                else
        //                {
        //                    previousRow.Cells[j].RowSpan = row.Cells[j].RowSpan + 1;
        //                }
        //                row.Cells[j].Visible = false;
        //            }
        //        }
        //    }
        //}

        for (int rowIndex = GridView1.Rows.Count - 2;
                                        rowIndex >= 0; rowIndex--)
        {
            GridViewRow gvRow = GridView1.Rows[rowIndex];
            GridViewRow gvPreviousRow = GridView1.Rows[rowIndex + 1];
            for (int cellCount = 0; cellCount < 2;
                                                          cellCount++)
            {
                if (gvRow.Cells[cellCount].Text ==
                                       gvPreviousRow.Cells[cellCount].Text)
                {
                    if (gvPreviousRow.Cells[cellCount].RowSpan < 2)
                    {
                        gvRow.Cells[cellCount].RowSpan = 2;
                        gvRow.Cells[4].RowSpan = 2; //edit
                        gvRow.Cells[5].RowSpan = 2; //delete
                        gvRow.Cells[2].RowSpan = 2; //ROLE

                    }
                    else
                    {
                        gvRow.Cells[cellCount].RowSpan =
                            gvPreviousRow.Cells[cellCount].RowSpan + 1;

                        gvRow.Cells[4].RowSpan =
                             gvPreviousRow.Cells[4].RowSpan + 1;//edit
                        gvRow.Cells[5].RowSpan =
                         gvPreviousRow.Cells[5].RowSpan + 1;//delete
                        gvRow.Cells[2].RowSpan =
                        gvPreviousRow.Cells[2].RowSpan + 1;//ROLE

                    }
                    gvPreviousRow.Cells[cellCount].Visible = false;
                    gvPreviousRow.Cells[4].Visible = false;//edit
                    gvPreviousRow.Cells[5].Visible = false;//delete
                    gvPreviousRow.Cells[2].Visible = false;//ROLE

                }
            }


        }


    }
    protected void BindUserDetails()
    {
        SqlConnection con1 = obj.getcon();
        con1.Open();
        DataSet ds = new DataSet();
        SqlDataAdapter adapter = new SqlDataAdapter("SELECT a.staff_id,UPPER(a.staff_name) as staff_name,a.staff_role,CAST(CASE a.NPstaff WHEN '1' THEN 1 ELSE 0 END AS BIT) AS NPstaff ,b.p_group_name  FROM  NSL_staff_details a LEFT JOIN    NSL_staff_vs_practical_group_v2_2 b ON  a.staff_id=b.staff_id where staff_role IN('NSL Module Leader','NSL Lecturer') order by staff_name ", con1);
        adapter.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
        con1.Close();

    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }

    protected void bt_staff_details_Click(object sender, ImageClickEventArgs e)
    {

        Response.Redirect("NSL_staff_details_V2_2.aspx");
    }

    protected void Button1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("NSL_add_newstaff.aspx");
    }

    protected void Button3_Click(object sender, ImageClickEventArgs e)
    {
        Session.Abandon();
        Response.Redirect("NSL_Login.aspx");
    }
}

