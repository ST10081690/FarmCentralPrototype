<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FarmCentralPrototype.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="MyStyle.css" rel="stylesheet"/> 
    <style type="text/css">
        

        .auto-style1 {
            margin-left: 120px;
        }
        

    </style>
</head>
    <body runat="server">

        <form id="form1" runat="server">
        <div class="secondSection">
            <div class="newContainer">
                <div class="content">
                    <br />
            <h2>Welcome to Farm Central's Stock Management Platform.</h2>
            <h4 class="auto-style1">Before you proceed, please enter your details.</h4>
                        <br />
                        <asp:TextBox ID="TxtBx_logUsrName" runat="server" placeholder="Username" BorderColor="Black" ></asp:TextBox>
                        <br />
                        <br />
                        <asp:TextBox ID="TxtBx_logPass" runat="server" TextMode="Password" placeholder="Password" BorderColor="Black"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Button ID="Btn_login" runat="server" Text="Login" Width="100px" OnClick="Btn_login_Click1" Font-Names="Microsoft JhengHei Light" ForeColor="White" BackColor="#333333" BorderColor="White" />
                        <br />
                        <br />
                        <asp:Label ID="Lbl_logSuccess" runat="server" Text="Login Successful!" Font-Names="Century Gothic"></asp:Label>   

                </div>
            </div>
        </div>
                  
    </form>

    </body>
    
</html>
