using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace a5p1
{
    public partial class insertj : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void InsertJ(object sender, EventArgs e)
        {
            int n;
            string jnums = jnum.Text;
            try
            {
                n = SDS.Insert();

            }
            catch (Exception ex)
            {
                n = 0;
                //Response.Write("Exception thrown:" + ex);
            }

            if (n > 0)
                Response.Write("insert for " + jnums + " is complete");
            else Response.Write("<h1>insert for " + jnums + " failed</h1>");
            Response.Write("<h1>Enter additional records below, if you wish</h1>");

            jnum.Text = null;
            jname.Text = null;
            city.Text = null;

        }
    }
}
