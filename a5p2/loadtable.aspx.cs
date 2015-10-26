using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Collections.Specialized;
using System.Data;
using System.Data.SqlClient;


namespace a5p2
{
    public partial class loadtable : System.Web.UI.Page
    {
        SqlConnection conn;
        private NameValueCollection c;

        protected int nrecs;
        protected int nfields = 4;
        protected List<string> fieldnames = new List<string>();
        protected List<string> type = new List<string>();
        private string databasename;
        private string username;
        private string password;
        private string tablename;

        protected void Page_Load(object sender, EventArgs e)
        {/* The Params property holds entries obtained from a form with 
                method="get" or method="post".  QueryString only holds method="get" 
                entries.
                */
            c = Request.Params;

            if (!IsPostBack)
            {
                nrecs = int.Parse(c.Get("nrecs"));
                Session["nrecs"] = nrecs;

                databasename = c.Get("databasename");
                Session["databasename"] = databasename;

                username = c.Get("username");
                Session["username"] = username;

                password = c.Get("password");
                Session["password"] = password;

                tablename = c.Get("tablename");
                Session["tablename"] = tablename;

                GetConn();

                string statement = "select * from " + tablename;
                SqlCommand cmd = new SqlCommand(statement, conn);
                SqlDataReader Read = cmd.ExecuteReader();

                for (int i = 0; i < Read.FieldCount; i++)
                {
                    fieldnames.Add(Read.GetName(i));
                    type.Add(Read.GetDataTypeName(i));
                }
                Session["fieldnames"] = fieldnames;
                Session["types"] = type;
                nfields = Read.FieldCount;
                Session["nfields"] = nfields;
            }
            else
            {
                GetConn();
                ExecuteInsertStatements();
                Response.Write("<h1>Insert an additional batch below if requested, or click on the link provided below</h1>");
                Response.Write("<p><a href=mainmenup2.html>Click here to go back to the main menu</a></p>");
            }
        }
        private void GetConn()
        {/* NOTE : You need to update your connection string
            * based on the database name you created in SQLExpress  */
            string connString = @"server = dbw.cse.fau.edu; database = " + Session["databasename"] + "; user id = " + Session["username"] + "; password = " + Session["password"] + "; integrated security = false; MultipleActiveResultSets = true;";
            conn = new SqlConnection(connString);
            conn.Open();
        }

        private void ExecuteInsertStatements()
        {/* Get stuff saved in Ssssion */
            nrecs = (int)Session["nrecs"];
            fieldnames = (List<string>)Session["fieldnames"];
            nfields = (int)Session["nfields"];
            type = (List<string>)Session["types"];
            // the insert statement is being built
            string query2 = "insert into " + Session["tablename"] + " values(";

            for (int i = 0; i < nfields; i++)
            {
                query2 += "@field" + i;
                if (i != nfields - 1) query2 += ",";
                else query2 += ")";
            }

            try
            {
                SqlCommand cmd = new SqlCommand(query2, conn);

                /* Register the parameters */

                for (int j = 0; j < nfields; j++)
                {
                    if (type[j] == "int") cmd.Parameters.Add("@field" + j, SqlDbType.Int);
                    else if (type[j] == "float") cmd.Parameters.Add("@field" + j, SqlDbType.Float);
                    else cmd.Parameters.Add("@field" + j, SqlDbType.VarChar, 20);
                }
                cmd.Prepare();

                /* Get the values of the querystring parameters.
                    and use them to set the values of the command parameters
                */


                for (int i = 0; i < nrecs; i++)
                {
                    try
                    {
                        for (int j = 0; j < nfields; j++)
                        {
                            if (j != 2)cmd.Parameters[j].Value =c.Get(fieldnames[j] + i);
                            else cmd.Parameters[j].Value = (c.Get(fieldnames[j] + i));
                        }
                        cmd.ExecuteNonQuery();
                    }
                    catch (Exception e)
                    {
                        Response.Write("<h3>record " + (i + 1) + " failed to insert</h3>" + e);
                    }
                }
            }
            catch (Exception e) { Response.Write(e); }
        }
    }
}