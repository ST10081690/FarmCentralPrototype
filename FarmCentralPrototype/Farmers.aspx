<%@ Page Title="Farmers" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Farmers.aspx.cs" Inherits="FarmCentralPrototype.Farmers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">

        .roundTextBox{
            border: 1px solid;
            border-radius:20px;
            padding-left:1vw;
        }

        .roundButton{
            border: 1px solid;
            border-radius:20px;
            color:white;
            background-color:dimgray;
        }
        /*Referencing:Inixia (2023) Inixia: Make website backgrounds in seconds, Inixia. 
         Available at: https://www.app.websitebackgroundmaker.com/app?designType=animatedGradient (Accessed: 22 June 2023). */
        body
        {
            background: linear-gradient(90deg, #adc9de 0%, #d49fed 100%);
            background-size:900% 900%;
            animation:gradient 10s ease infinite;

            font-family: 'Microsoft JhengHei UI';
        }

        @keyframes gradient {
            0% {
                background-position: 0% 50%;
            }

            50% {
                background-position: 100% 50%;
            }

            100% {
                background-position: 0% 50%
            }
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
                <asp:TextBox ID="TxtBx_f_usrName" runat="server" Width="177px" CssClass="roundTextBox"></asp:TextBox>
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
                <asp:TextBox ID="TxtBx_f_Name" runat="server" Width="177px" CssClass="roundTextBox"></asp:TextBox>
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
                <asp:TextBox ID="TxtBx_f_Surname" runat="server" Width="177px" CssClass="roundTextBox"></asp:TextBox>
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
                <asp:TextBox ID="TxtBx_f_AccPass" runat="server" Width="177px" CssClass="roundTextBox"></asp:TextBox>
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
                &nbsp;<asp:Button ID="Btn_AddFarmer" runat="server" Text="Add" Width="113px" OnClick="Btn_AddFarmer_Click" CssClass="roundButton" />
                <br />
                <br />
            </td>
        </tr>
    </table>

</asp:Content>
