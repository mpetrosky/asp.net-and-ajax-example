using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace a5p2
{
    public partial class printtable : System.Web.UI.Page
    {
        private int n;
        private SqlConnection conn = null;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GeneralR(object sender, EventArgs e)
        {
            try
            {
                GetConn();
                ExecuteRetrieval();
                n = 1;
            }
            catch (Exception ex) { n = 0; Response.Write("for debugging: " + ex); }
            finally { if (conn != null) conn.Close(); }
            if (n > 0) Response.Write("<h1>retrieval complete</h1>");
            else Response.Write("<h1>retrieval failed</h1>");
            Response.Write("<h1>perform additional retrievals below if requested</h1>");
            Response.Write(@"<p><a href=mainmenup2.html>Click here to go back to the main menu</a></p>");

            /* Remove old input box values from form.  Note that the 
            property here is Text, not Value as with HtmlInputText objects.
            */
            tablename.Text = null;
            username.Text = null;
            password.Text = null;
            databasename.Text = null;
        }
        private void GetConn()
        {
            /* NOTE : You need to update your connection string
             * based on the database name you created in SQLExpress  */
            string connString = @"
      server = dbw.cse.fau.edu;
      database="+databasename.Text+";user id ="+username.Text+";password="+password.Text+";integrated security = false;MultipleActiveResultSets = true;";

            conn = new SqlConnection(connString);
            conn.Open();
        }
        private void ExecuteRetrieval()
        {
            string type = null;

            /* names will hold the names of the fields of the table being 
            queried. */
            /* types will hold the SQL types of the fields of the table being 
            queried. */
            List<string> names = new List<string>(),
              types = new List<string>();
            SqlDataReader reader1 = null, reader2 = null;
            /* query2 will be used to get table metadata (query1 can't be 
            used for that purpose because we need the type of the parameter 
            in query1 before we can execute it). */
            string query1 = "select * from " + tablename.Text;/* + " where " + fieldname.Text +
                            " =@fieldvalue";*/
            string query2 = "select * from " + tablename.Text;


            SqlCommand cmd1 = new SqlCommand(query1, conn);
            SqlCommand cmd2 = new SqlCommand(query2, conn);


            reader2 = cmd2.ExecuteReader();

            for (int i = 0; i < reader2.FieldCount; i++)
            {
                names.Add(reader2.GetName(i));
                types.Add(reader2.GetDataTypeName(i));

                //if (names[i] == fieldname.Text) type = types[i];

            }
            /* Add the @fieldvalue parameter, appropriately setting its 
            type. */
            if (type == "char")
            {
                cmd1.Parameters.Add("@databasename", SqlDbType.Int);
                cmd1.Parameters[0].Value = int.Parse(databasename.Text);
            }
            else if (type == "char")
            {
                cmd1.Parameters.Add("@username", SqlDbType.Float);
                cmd1.Parameters[0].Value = float.Parse(username.Text);
            }
            else if (type == "char")
            {
                cmd1.Parameters.Add("@password", SqlDbType.Float);
                cmd1.Parameters[0].Value = float.Parse(password.Text);
            }
            else
            {
                cmd1.Parameters.Add("@tablename", SqlDbType.VarChar, 20);
                cmd1.Parameters[0].Value = tablename.Text;
            }
            reader1 = cmd1.ExecuteReader();
            GridView1.DataSource = reader1;
            GridView1.DataBind();

        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }

}
