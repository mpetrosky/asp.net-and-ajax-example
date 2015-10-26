using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;

namespace a5p3
{
    [WebService(Name = "Job Web Service",
       Description = "Insert and print job records")]

    public class Service1 : System.Web.Services.WebService
    {
        private System.Data.SqlClient.SqlCommand cmd;
        private System.Data.SqlClient.SqlConnection conn;

        public Service1()
        {

            //Uncomment the following line if using designed components 
            InitializeComponent();
        }

        [WebMethod(Description = "Inserts a job record")]
        public string Insert(string jnum, string jname, string city)
        {
            try
            {
                if (conn == null) return "null";
                conn.Open();
                if (Exists(jnum)) return "failed";
                string stmt = @"insert into j values ('" + jnum + "','" + jname + "','" + city + "')";
                cmd.CommandText = stmt;
                int n = cmd.ExecuteNonQuery();
                if (n > 0) return "worked";
                else return "failed";
            }
            catch (Exception ex) { return ex + " failed"; }
            finally { if (conn != null) conn.Close(); }
        }

        [WebMethod(Description = "Prints a job record")]
        public string Print(string jnum)
        {
            try
            {
                conn.Open();
                string returnvalue=null;
                if (!Exists(jnum)) return "Our apologies, this record could not be found.";
                string stmt = @"select * from j where j# = '" + jnum + "'";
                cmd.CommandText = stmt;
                SqlDataReader newRead = cmd.ExecuteReader();
                while(newRead.Read()) returnvalue = newRead[0] + " " + newRead[1] + " " + newRead[2];
                newRead.Close();
                return "The data you have selected is: "+returnvalue;
            }
            catch (Exception e) { return e + "failed"; }
            finally { conn.Close(); }
        }
        bool Exists(string jnum)
        {
            string stmt = @"select count(*) from j where j# = '" + jnum + "'";
            SqlCommand cmd = new SqlCommand(stmt, conn);
            int n = (int)cmd.ExecuteScalar();
            return n > 0;
        }

        private void InitializeComponent()
        {
            this.conn = new System.Data.SqlClient.SqlConnection();
            this.cmd = new System.Data.SqlClient.SqlCommand();
            // 
            // conn
            // 
            this.conn.ConnectionString = "Data Source=dbw.cse.fau.edu;Initial Catalog=mpetros2_spjdatabase;Persist Security" + " Info=True;User ID=mpetros2;Password=c00per;Pooling=False";
            this.conn.FireInfoMessageEventOnUserErrors = false;
            // 
            // cmd
            // 
            this.cmd.Connection = this.conn;

        }
    }

}
