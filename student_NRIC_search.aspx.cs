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
using System.Security;
using System.Security.Permissions;
using System.Reflection;
using System.Runtime.CompilerServices;
using System.Drawing.Text;
using System.Collections.Generic;

public partial class student_NRIC_search : System.Web.UI.Page
{
    MainClass obj = new MainClass();
    string test_id_clicked;
    string login_staff_ID, year, t_date;
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
        // Code disables caching by browser.
        Response.Cache.SetCacheability(HttpCacheability.NoCache);// this tells the client not to cache responses in the History folder, so that when you use the back/forward buttons the client requests a new version of the response each time.
        Response.Cache.SetExpires(DateTime.UtcNow.AddHours(-1));
        Response.Cache.SetNoStore();
       

        string name = (string)Session["staffname"]; //TO GET THE WELCOME MESSAGE

        String logintime = (string)Session["lasttime"];

        st_role = (string)Session["staffrole"];
        login_staff_ID = (string)Session["staffname"];
    }
    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Verifies that the control is rendered */
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
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
       // if (e.CommandName == "select_student_nric")
        //{
          //  string staff_id = Convert.ToString(e.CommandArgument.ToString());
           // GridViewRow clickedRow = ((LinkButton)e.CommandSource).NamingContainer as GridViewRow;
          //  Label lblID = (Label)clickedRow.FindControl("lblID");
          //  String cellText = this.GridView1.SelectedRow.Cells[2].Text.ToString();


            //Determine the RowIndex of the Row whose Button was clicked.
         //   int rowIndex = Convert.ToInt32(e.CommandArgument);

            //Reference the GridView Row.
         //   GridViewRow row = GridView1.Rows[rowIndex];
        //    string country = GridView1.Rows[rowIndex].Cells[1].Text;
       //    GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
         //  String cellText = row.Cells[2].Text.ToString();
         
     //   }
    }
    protected void GridView1_RowDataBound1(object sender, GridViewRowEventArgs e)
    {
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
                      gvRow.Cells[1].RowSpan = 2; //edit
                      gvRow.Cells[2].RowSpan = 2; //delete
                       gvRow.Cells[3].RowSpan = 2; //ROLE

                    }
                    else
                    {
                        gvRow.Cells[cellCount].RowSpan =
                            gvPreviousRow.Cells[cellCount].RowSpan + 1;

                         gvRow.Cells[1].RowSpan =gvPreviousRow.Cells[1].RowSpan + 1;//edit

                       gvRow.Cells[2].RowSpan = gvPreviousRow.Cells[2].RowSpan + 1;//delete

                      gvRow.Cells[3].RowSpan = gvPreviousRow.Cells[3].RowSpan + 1;//ROLE

                      
                    }
                    gvPreviousRow.Cells[cellCount].Visible = false;
                 gvPreviousRow.Cells[1].Visible = false;//edit
                   gvPreviousRow.Cells[2].Visible = false;//delete
                   gvPreviousRow.Cells[3].Visible = false;//ROLE

                }
            }


        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        SqlConnection con = obj.getcon();
        con.Open();

        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        SqlDataAdapter adp = new SqlDataAdapter();
        try
        {
            getRecords(txtSearch.Text.ToString());

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

    private void getRecords(string searchVal)
    {
        SqlConnection con = obj.getcon();
        con.Open();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        SqlDataAdapter adp = new SqlDataAdapter();
        try
        {

           // cmd = new SqlCommand("SELECT  e.student_id,UPPER(e.student_name) as student_name,e.student_nric,e.student_group,CONVERT(VARCHAR(10),e.date_of_pass ,105) as  date_of_pass,g.testsession_id,g.testsession_status,f.certificates from student_details e INNER JOIN  student_vs_testsession_details  f    ON e.student_id = f.student_id  INNER JOIN  testsession_details g ON  f.testsession_id=g.testsession_id where   e.student_nric like @SearchVal + '%' and ( g.testsession_status ='Completed' OR g.testsession_status= 'Archived')  and  date_of_pass is not null and    g.testsession_id = (SELECT MAX(h.testsession_id)  from student_vs_testsession_details  h  WHERE f.student_id = h.student_id  GROUP BY h.student_id)  order by e.student_group,e.student_name ", con);
            
            
            cmd = new SqlCommand(" SELECT  distinct   e.student_id,UPPER(e.student_name) as student_name,e.student_nric,e.student_group,f.testsession_id from student_details e INNER JOIN  student_vs_testsession_details  f    ON e.student_id = f.student_id where e.student_nric like @SearchVal + '%'   ", con);
            
            cmd.Parameters.AddWithValue("@SearchVal", searchVal);
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
            con.Close();
        }
    }
}
