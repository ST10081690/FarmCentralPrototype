<%@ Page Title="Farmers" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Farmers.aspx.cs" Inherits="FarmCentralPrototype.Farmers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        body
        {
            background-color: lavender;

            font-family: 'Century Gothic';
        }

    </style>

    <h4>&nbsp;</h4>
<h4>&nbsp;&nbsp; Farmer Information.</h4>
    <br />

    <p>&nbsp;&nbsp;&nbsp;&nbsp;Enter the farmer's details below to add a new farmer: </p>
    <table class="nav-justified">
        <tr>
            <td style="width: 16px">&nbsp;</td>
            <td style="width: 144px">Username:<br />
                <br />
            </td>
            <td>
                <asp:TextBox ID="TxtBx_f_usrName" runat="server" Width="177px"></asp:TextBox>
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td style="width: 16px">&nbsp;</td>
            <td style="width: 144px">Name:<br />
                <br />
            </td>
            <td>
                <asp:TextBox ID="TxtBx_f_Name" runat="server" Width="177px"></asp:TextBox>
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td style="width: 16px">&nbsp;</td>
            <td style="width: 144px">Surname:<br />
                <br />
            </td>
            <td>
                <asp:TextBox ID="TxtBx_f_Surname" runat="server" Width="177px"></asp:TextBox>
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td style="width: 16px">&nbsp;</td>
            <td style="width: 144px">Account Password:<br />
                <br />
            </td>
            <td>
                <asp:TextBox ID="TxtBx_f_AccPass" runat="server" Width="177px"></asp:TextBox>
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td style="width: 16px">&nbsp;</td>
            <td style="width: 144px">&nbsp;</td>
            <td>
                <asp:Label ID="Lbl_success" runat="server">Farmer Account Created Successfully!</asp:Label>
                <br />
                <br />
                <asp:Button ID="Btn_AddFarmer" runat="server" BackColor="#0066FF" ForeColor="White" Text="Add" Width="113px" OnClick="Btn_AddFarmer_Click" />
                <br />
                <br />
            </td>
        </tr>
    </table>

</asp:Content>
