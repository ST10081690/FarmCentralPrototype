<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FarmCentralPrototype.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 17px;
        }
        .auto-style3 {
            width: 110px;
        }
    </style>
</head>
<body id="LoginPage" runat="server">

    <form id="form1" runat="server">
        <div>
            <h1>
                <asp:Label ID="Lbl_login" runat="server" Text="" Font-Names="Century Gothic"></asp:Label>
            </h1>
            <br />
            <h2>
                <asp:Label ID="Lbl_loginWelcome" runat="server" Font-Names="Century Gothic" Text="Welcome to Farm Central's Stock Management Platform."></asp:Label>
            </h2>
            <h4>
                <asp:Label ID="Lbl_beforeProceed" runat="server" Text="Before you proceed, please enter your details." Font-Names="Century Gothic"></asp:Label>
            </h4>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3"><asp:Label ID="Lbl_usrName" runat="server" Text="Username:" Font-Names="Century Gothic"></asp:Label>
                        <br />
                    </td>
                    <td>
                        <asp:TextBox ID="TxtBx_logUsrName" runat="server"></asp:TextBox>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">
                        <asp:Label ID="Lbl_Passwrd" runat="server" Text="Password:" Font-Names="Century Gothic"></asp:Label>
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                    </td>
                    <td>
                        <br />
                        <asp:TextBox ID="TxtBx_logPass" runat="server" TextMode="Password"></asp:TextBox>
                        <br />
                        <br />
                        <br />
                        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Btn_login" runat="server" Text="Login" Width="100px" OnClick="Btn_login_Click1" Font-Names="Century Gothic" ForeColor="#000066" />
                        <br />
                        <br />
                        <asp:Label ID="Lbl_logSuccess" runat="server" Text="Login Successful!" Font-Names="Century Gothic"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                  &nbsp;</td>
            &nbsp;</td>
                    <td class="auto-style3">
                        <br />
                        &nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
