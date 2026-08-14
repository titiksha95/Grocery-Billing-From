using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Grocery_Billing_From
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text;
            string password = txtPassword.Text;


            if (username == "Titiksha" && password == "1234")
            {
                // Store username in Session
                Session["Username"] = username;

                // Redirect to Grocery Billing page
                Response.Redirect("GroceryBilling.aspx");
            }
            else
            {
                lblMessage.Text = "Invalid username or password.";
            }
        }

    }
}