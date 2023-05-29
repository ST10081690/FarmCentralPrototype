<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InspectProducts.aspx.cs" Inherits="FarmCentralPrototype.InspectProducts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        body
        {
            background-color: lavender;

            font-family: 'Century Gothic';
        }

    </style>

    <h2>View Products</h2>
    <p>&nbsp;</p>
    <p>Use the filters below to display the desired product information.</p>
    <p>Filter your search:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 

    </p>
    <table class="nav-justified" id="Table_InspectSearch">
        <tr>
            <td style="width: 70px">Farmer:<br />
            </td>
            <td style="width: 140px">
                <asp:DropDownList ID="DDList_pFarmer" runat="server" DataSourceID="FarmerDDLSource" DataTextField="username" DataValueField="username" AutoPostBack="True" OnSelectedIndexChanged="DDList_pFarmer_SelectedIndexChanged">
                    <asp:ListItem>Select</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="FarmerDDLSource" runat="server" ConnectionString="<%$ ConnectionStrings:FarmDbConnection %>" SelectCommand="SELECT [username] FROM [USER] WHERE ([ut_id] = @ut_id)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="2" Name="ut_id" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td style="width: 55px">Type:</td>
            <td style="width: 140px">
                <asp:DropDownList ID="DDList_pType" runat="server" DataSourceID="ProdTypeDDLSource" DataTextField="p_type" DataValueField="p_type" AutoPostBack="True" OnSelectedIndexChanged="DDList_pType_SelectedIndexChanged">
                    <asp:ListItem>Select</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="ProdTypeDDLSource" runat="server" ConnectionString="<%$ ConnectionStrings:FarmDbConnection %>" SelectCommand="SELECT [p_type] FROM [PRODUCT_TYPE]"></asp:SqlDataSource>
            </td>
            <td style="width: 140px">&nbsp;Start Date Range:<br />
            </td>
            <td>
                <asp:DropDownList ID="DDList_pStartDate" runat="server" DataSourceID="ProdDateDDLSource" DataTextField="date_added" DataValueField="date_added" AutoPostBack="True" OnSelectedIndexChanged="DDList_pStartDate_SelectedIndexChanged">
                </asp:DropDownList>
                &nbsp;<asp:Label ID="Lbl_SelectStrt" runat="server" Text="Please select start date."></asp:Label>
                <asp:SqlDataSource ID="ProdDateDDLSource" runat="server" ConnectionString="<%$ ConnectionStrings:FarmDbConnection %>" SelectCommand="SELECT DISTINCT [date_added] FROM [PRODUCT]"></asp:SqlDataSource>
            </td>
            <td>&nbsp;</td>
            <td>
                <br />
            </td>
        </tr>
        <tr>
            <td style="width: 70px">&nbsp;</td>
            <td style="width: 140px">
        <asp:Label ID="Lbl_noFarmer" runat="server" Text="Please select a farmer."></asp:Label>
            </td>
            <td style="width: 55px">&nbsp;</td>
            <td style="width: 140px">&nbsp;</td>
            <td style="width: 140px">&nbsp;<br />
&nbsp;End Date Range:<br />
            </td>
            <td>
                <br />
                <asp:DropDownList ID="DDList_pEndDate" runat="server" DataSourceID="ProdDateDDLSource" DataTextField="date_added" DataValueField="date_added" AutoPostBack="True" OnSelectedIndexChanged="DDList_pEndDate_SelectedIndexChanged">
                </asp:DropDownList>
&nbsp;<asp:Label ID="Lbl_SelectEnd" runat="server" Text="Please select the end date."></asp:Label>
                <br />
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <table class="nav-justified">
        <tr>
            <td style="width: 370px">
                <asp:Button ID="Btn_ClearFilter" runat="server" OnClick="Btn_ClearFilter_Click" Text="Clear Filter" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
            <td style="width: 254px" class="modal-sm">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <asp:Panel ID="Pnl_AllProd" runat="server" Height="401px">
        <br />
        <br />
        <asp:Label ID="Lbl_filtersOn" runat="server" Text="Filtering: "></asp:Label>
        <br />
        <asp:GridView ID="GrdV_AllProd" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="558px" DataKeyNames="p_id" DataSourceID="SearchAllProdSource">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="p_id" HeaderText="p_id" InsertVisible="False" ReadOnly="True" SortExpression="p_id" />
                <asp:BoundField DataField="p_name" HeaderText="p_name" SortExpression="p_name" />
                <asp:BoundField DataField="p_price" HeaderText="p_price" SortExpression="p_price" />
                <asp:BoundField DataField="quantity" HeaderText="quantity" SortExpression="quantity" />
                <asp:BoundField DataField="date_added" HeaderText="date_added" SortExpression="date_added" />
                <asp:BoundField DataField="u_id" HeaderText="u_id" SortExpression="u_id" />
                <asp:BoundField DataField="pt_id" HeaderText="pt_id" SortExpression="pt_id" />
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
        <asp:SqlDataSource ID="SearchAllProdSource" runat="server" ConnectionString="<%$ ConnectionStrings:FarmDbConnection %>" SelectCommand="SELECT * FROM [PRODUCT]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SearchByFarmer" runat="server" ConnectionString="<%$ ConnectionStrings:FarmDbConnection %>" SelectCommand="SELECT * FROM [PRODUCT] WHERE ([u_id] = @u_id)">
            <SelectParameters>
                <asp:SessionParameter Name="u_id" SessionField="filterFrmrSearch" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SearchByFrmrNType" runat="server" ConnectionString="<%$ ConnectionStrings:FarmDbConnection %>" SelectCommand="SELECT * FROM [PRODUCT] WHERE (([u_id] = @u_id) AND ([pt_id] = @pt_id))">
            <SelectParameters>
                <asp:SessionParameter Name="u_id" SessionField="filterFrmrSearch" Type="Int32" />
                <asp:SessionParameter Name="pt_id" SessionField="filterTypeSearch" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SearchByDateRange" runat="server" ConnectionString="<%$ ConnectionStrings:FarmDbConnection %>" SelectCommand="SELECT * FROM [PRODUCT] WHERE (([date_added] &gt;= @date_added) AND ([date_added] &lt;= @date_added2))">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="&quot;2022/01/01&quot;" Name="date_added" SessionField="filterStrtDtSearch" Type="String" />
                <asp:SessionParameter Name="date_added2" SessionField="filterEndDtSearch" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SearchByFrmrNDate" runat="server" ConnectionString="<%$ ConnectionStrings:FarmDbConnection %>" SelectCommand="SELECT * FROM [PRODUCT] WHERE (([u_id] = @u_id) AND ([date_added] &gt;= @date_added) AND ([date_added] &lt;= @date_added2))">
            <SelectParameters>
                <asp:SessionParameter Name="u_id" SessionField="filterFrmrSearch" Type="Int32" />
                <asp:SessionParameter Name="date_added" SessionField="filterEndDtSearch" Type="String" />
                <asp:SessionParameter Name="date_added2" SessionField="filterEndDtSearch" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <br />
        <br />
    </asp:Panel>
</asp:Content>
