<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewProducts.aspx.cs" Inherits="FarmCentralPrototype.ViewProducts" %>
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

    <h2>View Products</h2>
    <h4>Showing your saved products:</h4>
    <p>&nbsp;</p>
    <p>
        <asp:GridView ID="GrdV_productView" runat="server" CellPadding="4" DataSourceID="FarmerProductsSource" ForeColor="#333333" GridLines="None" Width="505px" Height="145px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
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
        <asp:SqlDataSource ID="FarmerProductsSource" runat="server" ConnectionString="<%$ ConnectionStrings:FarmDbConnection %>" SelectCommand="SELECT [p_id], [p_name], [p_price], [quantity], [date_added], [pt_id] FROM [PRODUCT] WHERE ([u_id] = @u_id)" DeleteCommand="DELETE FROM [PRODUCT] WHERE [p_id]=@p_id" UpdateCommand="UPDATE [PRODUCT] SET [p_name]=@p_name,  [p_price]=@p_price, [quantity]=@quantity, [date_added]=@date_added, [pt_id]=@pt_id WHERE [p_id]=@p_id">
            <DeleteParameters>
                <asp:Parameter Name="p_id" />
            </DeleteParameters>
            <SelectParameters>
                <asp:SessionParameter DefaultValue="null" Name="u_id" SessionField="loggedUserID" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="p_name" />
                <asp:Parameter Name="p_price" />
                <asp:Parameter Name="quantity" />
                <asp:Parameter Name="date_added" />
                <asp:Parameter Name="pt_id" />
                <asp:Parameter Name="p_id" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
    <p>&nbsp;</p>
    <p>
        <asp:GridView ID="GrdV_pType" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="pt_id" DataSourceID="ProductTypeSource" ForeColor="#333333" GridLines="None" Width="165px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="pt_id" HeaderText="Type ID" InsertVisible="False" ReadOnly="True" SortExpression="pt_id" />
                <asp:BoundField DataField="p_type" HeaderText="Product Type" SortExpression="p_type" />
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
        <asp:SqlDataSource ID="ProductTypeSource" runat="server" ConnectionString="<%$ ConnectionStrings:FarmDbConnection %>" SelectCommand="SELECT * FROM [PRODUCT_TYPE]"></asp:SqlDataSource>
    </p>
    <p>&nbsp;</p>
</asp:Content>
