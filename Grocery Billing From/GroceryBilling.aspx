<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GroceryBilling.aspx.cs" Inherits="Grocery_Billing_From.GroceryBilling" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Grocery Store Billing System</title>

    <style>body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
        margin: 0;
        padding: 30px;
    }

    .billing-container {
        width: 850px;
        margin: auto;
        background-color: white;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 2px 10px #ccc;
    }

    .title {
        display: block;
        text-align: center;
        font-size: 25px;
        font-weight: bold;
        color: #2e7d32;
        margin-bottom: 20px;
    }

    .welcome-message {
        display: block;
        text-align: right;
        font-size: 16px;
        font-weight: bold;
        color: #2e7d32;
    }

    input[type="text"] {
        padding: 8px;
        width: 200px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    select {
        padding: 8px;
        width: 215px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    input[type="submit"] {
        padding: 9px 18px;
        background-color: #2e7d32;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    input[type="submit"]:hover {
        background-color: #1b5e20;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 10px;
    }

    table th {
        background-color: #2e7d32;
        color: white;
        padding: 10px;
    }

    table td {
        padding: 10px;
        text-align: center;
        border-bottom: 1px solid #ddd;
    }

    table tr:nth-child(even) {
        background-color: #f5f5f5;
    }

    #lblSubtotal,
    #lblGrandTotal {
        font-weight: bold;
        font-size: 17px;
    }

    #lblGrandTotal {
        color: #2e7d32;
    }

    #pnlBillSlip {
        margin-top: 25px;
        padding: 20px;
        border: 1px solid #ccc;
        border-radius: 8px;
        background-color: #fafafa;
    }

    #lblSlipTitle {
        display: block;
        text-align: center;
        font-size: 22px;
        font-weight: bold;
        color: #2e7d32;
    }

    #lblSlipGrandTotal {
        font-weight: bold;
        font-size: 18px;
    }

    #lblSlipStatus {
        color: green;
        font-weight: bold;
    }</style>
</head>

<body>
    <form id="form1" runat="server">
        <div class="billing-container">
                        <asp:Label ID="lblTitle" runat="server" Text="GROCERY STORE BILLING SYSTEM" CssClass="title"></asp:Label>

             <br /><br />

                    <asp:Label ID="lblWelcome"
    runat="server"
    CssClass="welcome-message">
</asp:Label>

<br /><br />

            <asp:Label ID="lblCustomerName" runat="server" Text="Customer Name:"></asp:Label>

            <asp:TextBox ID="txtCustomerName" runat="server"></asp:TextBox>
            
             <br /><br />
            <asp:Label ID="lblProduct" runat="server" Text="Product:"></asp:Label>

            <asp:DropDownList ID="ddlProduct" runat="server">
                <asp:ListItem>Rice</asp:ListItem>
                <asp:ListItem>Wheat</asp:ListItem>
                <asp:ListItem>Sugar</asp:ListItem>
                <asp:ListItem>Milk</asp:ListItem>
                <asp:ListItem>Oil</asp:ListItem>
            </asp:DropDownList>
            
             <br /><br />
            <asp:Label ID="lblQuantity" runat="server" Text="Quantity:"></asp:Label>
            <asp:TextBox ID="txtQuantity" runat="server" style="margin-bottom: 0px"></asp:TextBox>
      
             <br /><br />
            <asp:Label ID="lblPrice" runat="server" Text="Price:"></asp:Label>
            
            <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
            
             <br /><br />
            <asp:Button ID="btnAddProduct" runat="server" OnClick="Button1_Click" Text="Add Product" />

            <br /><br />

            <asp:Label ID="lblBill" runat="server" Text="BILL"></asp:Label>

            <br /><br />
            <asp:GridView ID="gvBill" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="Product" HeaderText="Product" />
                    <asp:BoundField DataField="Quantity" HeaderText="Qty" />
                    <asp:BoundField DataField="Price" HeaderText="Price" />
                    <asp:BoundField DataField="Total" HeaderText="Total" />
                </Columns>
            </asp:GridView>
            <br /><br />
            
            <asp:Label ID="lblSubtotal" runat="server" Text="Subtotal: ₹0"></asp:Label>
            
            <br /><br />
            <asp:Label ID="lblDiscount" runat="server" Text="Discount (%):"></asp:Label>
            <asp:TextBox ID="txtDiscount" runat="server"></asp:TextBox>

            <br /><br />

            <asp:Label ID="lblGrandTotal" runat="server" Text="Total: ₹0"></asp:Label>

            <br /><br />

            <asp:Label ID="lblPaymentMethod" runat="server" Text="Payment Method:"></asp:Label>

            <br />
            <asp:RadioButton ID="rbCash"
                runat="server"
                Text="Cash"
                GroupName="PaymentMethod" />
            <asp:RadioButton ID="rbCreditCard"
                runat="server"
                Text="Credit Card"
                GroupName="PaymentMethod" />
            <asp:RadioButton ID="rbUPI"
                runat="server"
                Text="UPI"
                GroupName="PaymentMethod" />

            <br /><br />
            <asp:Button ID="btnGenerateBill" runat="server" Text="Generate Bill" OnClick="btnGenerateBill_Click" />

            <br /><br />

            <asp:Panel ID="pnlBillSlip" runat="server">
                
                <asp:Label ID="lblSlipTitle"
                    runat="server"
                    Text="GROCERY STORE BILL">
                 </asp:Label>

                <br /><br />

                <asp:Label ID="lblSlipCustomer"
                    runat="server">
                </asp:Label>

                <br /><br />

                <asp:GridView ID="gvSlip"
                    runat="server"
                    AutoGenerateColumns="False">

                    <Columns>
                        <asp:BoundField DataField="Product" HeaderText="Product" />
                        <asp:BoundField DataField="Quantity" HeaderText="Qty" />
                        <asp:BoundField DataField="Price" HeaderText="Price" />
                        <asp:BoundField DataField="Total" HeaderText="Total" />
                    </Columns>

                </asp:GridView>

                <br />

                <asp:Label ID="lblSlipSubtotal"
                    runat="server">
                </asp:Label>

                <br />

                <asp:Label ID="lblSlipDiscount"
                    runat="server">
                </asp:Label>

                <br />

                <asp:Label ID="lblSlipGrandTotal"
                    runat="server">
                </asp:Label>

                <br /><br />

                <asp:Label ID="lblSlipPayment"
                    runat="server">
                </asp:Label>

                <br />

                <asp:Label ID="lblSlipStatus"
                    runat="server">
                </asp:Label>
            </asp:Panel>
        </div>
    </form>
</body>
</html>