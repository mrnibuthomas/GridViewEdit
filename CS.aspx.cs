using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;


public partial class CS : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            this.BindGrid();

        }
    }

    private void BindGrid()
    {
         string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlDataAdapter sda = new SqlDataAdapter("SELECT EMP_ID, FIRST_NAME, LAST_NAME, START_DATE,TITLE, END_DATE, ASSIGNED_BRANCH_ID, DEPT_ID, SUPERIOR_EMP_ID FROM EMPLOYEE", con))
            {
                using (DataTable dt = new DataTable())
                {
                    sda.Fill(dt);
                    //Populating a DataTable from database.
       
 
        //Building an HTML string.
        StringBuilder html = new StringBuilder();
 
        //Table start.
        html.Append("<table border = '1'>");
 
        //Building the Header row.
        html.Append("<tr>");
        foreach (DataColumn column in dt.Columns)
        {
            html.Append("<th>");
            html.Append(column.ColumnName);
            html.Append("</th>");
        }
        html.Append("</tr>");
 
        //Building the Data rows.
        foreach (DataRow row in dt.Rows)
        {
            html.Append("<tr>");
            foreach (DataColumn column in dt.Columns)
            {
                html.Append("<td>");
                html.Append(row[column.ColumnName]);
                html.Append("</td>");
            }
            html.Append("</tr>");
        }
 
        //Table end.
        html.Append("</table>");
 
        //Append the HTML string to Placeholder.
       // PlaceHolder1.Controls.Add(new Literal { Text = html.ToString() });

                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
            }
        }

        //Required for jQuery DataTables to work.
        GridView1.UseAccessibleHeader = true;
       GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
    }
}