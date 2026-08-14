using System;
using System.Data;


namespace Grocery_Billing_From
{
    public partial class GroceryBilling : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                string username = Session["Username"].ToString();

                lblWelcome.Text = "Welcome, " + username + "!";
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            string product = ddlProduct.SelectedItem.Text;
            int quantity = Convert.ToInt32(txtQuantity.Text);
            decimal price = Convert.ToDecimal(txtPrice.Text);

            decimal total = quantity * price;

            DataTable dt;

            if (ViewState["Bill"] == null)
            {
                dt = new DataTable();

                dt.Columns.Add("Product");
                dt.Columns.Add("Quantity");
                dt.Columns.Add("Price");
                dt.Columns.Add("Total");
            }
            else
            {
                dt = (DataTable)ViewState["Bill"];
            }

            DataRow row = dt.NewRow();

            row["Product"] = product;
            row["Quantity"] = quantity;
            row["Price"] = price;
            row["Total"] = total;

            dt.Rows.Add(row);

            ViewState["Bill"] = dt;

            gvBill.DataSource = dt;
            gvBill.DataBind();

            decimal subtotal = 0;

            foreach (DataRow item in dt.Rows)
            {
                subtotal += Convert.ToDecimal(item["Total"]);
            }

            lblSubtotal.Text = "Subtotal: ₹" + subtotal;

            decimal discount = 0;

            if (txtDiscount.Text != "")
            {
                discount = Convert.ToDecimal(txtDiscount.Text);
            }

            decimal discountAmount = (subtotal * discount) / 100;

            decimal grandTotal = subtotal - discountAmount;

            lblGrandTotal.Text = "Total: ₹" + grandTotal;
        }
        protected void btnGenerateBill_Click(object sender, EventArgs e)
        {
            string paymentMethod = "";

            if (rbCash.Checked)
            {
                paymentMethod = "Cash";
            }
            else if (rbCreditCard.Checked)
            {
                paymentMethod = "Credit Card";
            }
            else if (rbUPI.Checked)
            {
                paymentMethod = "UPI";
            }

            if (paymentMethod == "")
            {
                lblSlipStatus.Text = "Please select a payment method.";
                return;
            }

            DataTable dt = (DataTable)ViewState["Bill"];

            gvSlip.DataSource = dt;
            gvSlip.DataBind();

            lblSlipCustomer.Text = "Customer: " + txtCustomerName.Text;

            decimal subtotal = 0;

            foreach (DataRow row in dt.Rows)
            {
                subtotal += Convert.ToDecimal(row["Total"]);
            }

            decimal discountPercent = 0;

            if (txtDiscount.Text != "")
            {
                discountPercent = Convert.ToDecimal(txtDiscount.Text);
            }

            decimal discountAmount = (subtotal * discountPercent) / 100;

            decimal grandTotal = subtotal - discountAmount;

            lblSlipSubtotal.Text = "Subtotal: ₹" + subtotal;
            lblSlipDiscount.Text = "Discount (" + discountPercent + "%): ₹" + discountAmount;
            lblSlipGrandTotal.Text = "Grand Total: ₹" + grandTotal;

            lblSlipPayment.Text = "Payment Method: " + paymentMethod;
            lblSlipStatus.Text = "Payment Status: Paid";

            pnlBillSlip.Visible = true;
        }
    }
}