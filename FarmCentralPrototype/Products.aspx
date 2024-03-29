﻿<%@ Page Title="Products" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="FarmCentralPrototype.Products" %>

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

        @keyframes gradient{
        0%{
            background-position: 0% 50%;
           }
        50%{
            background-position:100% 50%;

            }
        100%{
            background-position: 0% 50%
            }
        }

        .auto-style1 {
            width: 119px;
        }

    </style>

    <h4>&nbsp;</h4>
<h4>&nbsp;&nbsp; Add a New Product.</h4>
    <br />

    <p>&nbsp;&nbsp;&nbsp;&nbsp;Enter the product's details below: </p>

    <table class="nav-justified">
        <tr>
            <td class="modal-sm" style="width: 17px">&nbsp;</td>
            <td class="auto-style1">Product Name:<br />
                <br />
            </td>
            <td>
                <asp:TextBox ID="TxtBx_prodName" runat="server" Width="177px" CssClass="roundTextBox"></asp:TextBox>
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 17px">&nbsp;</td>
            <td class="auto-style1">Date of Arrival:<br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
            </td>
            <td>
                <asp:Calendar ID="Clndr_prodDate" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" 
                    DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="66px" Width="189px" >
                    <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                    <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                    <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                    <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                    <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                    <WeekendDayStyle BackColor="#CCCCFF" />
                </asp:Calendar>     
                <br />
        </tr>
        <tr>
            <td class="modal-sm" style="width: 17px">&nbsp;</td>
            <td class="auto-style1">Quantity:<br />
                <br />
            </td>
            <td>
                <asp:TextBox ID="TxtBx_prodQty" runat="server" Width="177px" CssClass="roundTextBox"></asp:TextBox>
                <br />
                <br />
            </td>
        </tr>
        <tr>
           </td>
            <td class="modal-sm" style="width: 17px">&nbsp;</td>
            <td class="auto-style1">Product Type:<br />
                <br />
                Product Price:&nbsp;&nbsp; R<br />
                <br />
            </td>
            <td>

                <asp:DropDownList ID="DDList_prodType" runat="server" >
                </asp:DropDownList>
                <br />
                <br />
                <asp:TextBox ID="TxtBx_prodPrice" runat="server" Width="177px" CssClass="roundTextBox"></asp:TextBox>
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td class="modal-sm" style="width: 17px">&nbsp;</td>
            <td class="auto-style1">&nbsp;</td>
            <td>
                <br />
                <br />
                &nbsp;
                <asp:Button ID="Btn_AddProd" runat="server" Text="Add" Width="113px" OnClick="Btn_AddProd_Click" CssClass="roundButton"/>
                &nbsp;<br />
                <br />
                <asp:Label ID="Lbl_success" runat="server" Text="Product Saved Sucessfully!"></asp:Label>
                <br />
                <br />
                <br />
                <br />
            </td>
        </tr>
    </table>




</asp:Content>
