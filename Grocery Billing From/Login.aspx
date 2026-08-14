<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Grocery_Billing_From.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
        <style>body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
        margin: 0;
        padding: 50px;
    }

    .login-container {
        width: 400px;
        margin: auto;
        background-color: white;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 2px 10px #ccc;
    }

    .title {
        display: block;
        text-align: center;
        font-size: 24px;
        font-weight: bold;
        color: #2e7d32;
        margin-bottom: 20px;
    }

    .input {
        width: 95%;
        padding: 9px;
        margin-top: 8px;
        margin-bottom: 15px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    .login-button {
        width: 100%;
        padding: 10px;
        background-color: #2e7d32;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 15px;
    }

    .login-button:hover {
        background-color: #1b5e20;
    }

    .message {
        display: block;
        text-align: center;
        margin-top: 15px;
        color: red;
    }</style>
 
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">

            <asp:Label ID="lblTitle"
                runat="server"
                Text="GROCERY STORE LOGIN"
                CssClass="title">
            </asp:Label>

            <br /><br />

            <asp:Label ID="lblUsername"
                runat="server"
                Text="Username:">
            </asp:Label>

            <asp:TextBox ID="txtUsername"
                runat="server"
                CssClass="input">
            </asp:TextBox>

            <asp:Label ID="lblPassword"
                runat="server"
                Text="Password:">
            </asp:Label>

            <asp:TextBox ID="txtPassword"
                runat="server"
                TextMode="Password"
                CssClass="input">
            </asp:TextBox>

            <asp:Button ID="btnLogin"
                runat="server"
                Text="Login"
                CssClass="login-button"
                OnClick="btnLogin_Click" />

            <asp:Label ID="lblMessage"
                runat="server"
                CssClass="message">
            </asp:Label>

        </div>
    </form>
</body>
</html>
