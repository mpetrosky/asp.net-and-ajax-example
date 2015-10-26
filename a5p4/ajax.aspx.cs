using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading;
using System.Data;

namespace a5p4
{
    public partial class ajax : System.Web.UI.Page
    {
        protected int n;
        protected int waittime = 6969;
        protected void SelectJ(object sender, EventArgs e)
        {
            try
            {
                Thread.Sleep(waittime);
                DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
                n=dv.Count;
            }
            catch (Exception ex)
            {
                n = 0;
                Label4.Text = ex.Message;
            }
            if (n > 0) Label4.Text = "Record retrieval succesful.";
            else Label4.Text = "Record could not be found.";
            Label4.Text += " Clear to submit next request.";
            Label1.Text = "Insert J record";
            Label2.Text = "Delete J record";
            Label3.Text = "Update J record";
        }
        protected void InsertJ(object sender, EventArgs e)
        {
            try
            {
                Thread.Sleep(waittime);
                n = SqlDataSource3.Insert();
            }
            catch (Exception ex)
            {
                n = 0;
                Label1.Text = ex.Message;
            }

            if (n > 0) Label1.Text = "Insert Accepted.";            

            else Label1.Text = "Insert Denied.";

            Label1.Text += " Clear to submit next request.";

            /* Remove old input box values from form.  */
            Label2.Text = "Delete J record";
            Label3.Text = "Update J record";
            Label4.Text = "Display J record";
        }
        
        protected void DeleteJ(object sender, EventArgs e)
        {
            try
            {
                Thread.Sleep(waittime);
                n = SqlDataSource2.Delete();
            }
            catch (Exception ex)
            {
                n = 0;
                Label2.Text = ex.Message;
            }

            if (n > 0) Label2.Text = "Delete Accepted.";

            else Label2.Text = "Delete Denied.";

            Label2.Text += " Clear to submit next request.";

            /* Remove old input box values from form.  */
            Label1.Text = "Insert J record";
            Label3.Text = "Update J record";
            Label4.Text = "Display J record";
        }

        protected void UpdateJ(object sender, EventArgs e)
        {
            try
            {
                Thread.Sleep(waittime);
                n = SqlDataSource4.Update();
            }
            catch (Exception ex)
            {
                n = 0;
                Label3.Text = ex.Message;
            }

            if (n > 0) Label3.Text = "Update Accepted.";

            else Label3.Text = "Update Denied.";

            Label3.Text += " Clear to submit next request.";

            /* Remove old input box values from form.  */
            Label1.Text = "Insert J record";
            Label2.Text = "Delete J record";
            Label4.Text = "Display J record";
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}