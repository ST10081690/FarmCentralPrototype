<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewFarmers.aspx.cs" Inherits="FarmCentralPrototype.ViewFarmers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">

        /*Referencing:Inixia (2023) Inixia: Make website backgrounds in seconds, Inixia. 
         Available at: https://www.app.websitebackgroundmaker.com/app?designType=animatedGradient (Accessed: 22 June 2023). */
        body
        {
            background: linear-gradient(90deg, #adc9de 0%, #d49fed 100%);
            background-size:900% 900%;
            animation:gradient 10s ease infinite;

            font-family: 'Microsoft JhengHei UI Light';
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

    <h2>View Farmers</h2>
    <h4>Showing saved farmer details:</h4>
    <p>&nbsp;</p>
    <p>
        <asp:GridView ID="GrdV_Farmers" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="u_id" DataSourceID="ViewFarmersSource" ForeColor="#333333" GridLines="None" Width="550px" Height="140px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="u_id" HeaderText="User ID" InsertVisible="False" ReadOnly="True" SortExpression="u_id" />
                <asp:BoundField DataField="username" HeaderText="Username" SortExpression="username" />
                <asp:BoundField DataField="u_name" HeaderText="Name" SortExpression="u_name" />
                <asp:BoundField DataField="u_surname" HeaderText="Surname" SortExpression="u_surname" />
                <asp:BoundField DataField="u_password" HeaderText="Password" SortExpression="u_password" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <asp:SqlDataSource ID="ViewFarmersSource" runat="server" ConnectionString="<%$ ConnectionStrings:FarmDbConnection %>" SelectCommand="SELECT [u_id], [username], [u_name], [u_surname], [u_password] FROM [USER] WHERE ([ut_id] = @ut_id)" DeleteCommand="DELETE FROM [USER] WHERE [u_id] = @u_id" UpdateCommand="UPDATE [USER] SET [username] = @username, [u_name] = @u_name, [u_surname] = @u_surname, [u_password] = @u_password WHERE [u_id] = @u_id">
            <SelectParameters>
                <asp:Parameter DefaultValue="2" Name="ut_id" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="username" />
                <asp:Parameter Name="u_name" />
                <asp:Parameter Name="u_surname" />
                <asp:Parameter Name="u_password" />
                <asp:Parameter Name="u_id" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        &nbsp;</p>
    <p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
</asp:Content>
