<%@ Page Title="" Language="C#" MasterPageFile="~/DotnetHome.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="WebApplication2.Admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">

    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="user_id" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="633px">
    <AlternatingRowStyle BackColor="White" />
    <Columns>
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
        <asp:BoundField DataField="user_id" HeaderText="user_id" InsertVisible="False" ReadOnly="True" SortExpression="user_id" />
        <asp:BoundField DataField="userName" HeaderText="userName" SortExpression="userName" />
        <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
        <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
        <asp:BoundField DataField="securityQuestion" HeaderText="securityQuestion" SortExpression="securityQuestion" />
    </Columns>
    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
    <SortedAscendingCellStyle BackColor="#FDF5AC" />
    <SortedAscendingHeaderStyle BackColor="#4D0000" />
    <SortedDescendingCellStyle BackColor="#FCF6C0" />
    <SortedDescendingHeaderStyle BackColor="#820000" />
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%= ConnectionStrings:WebApplication2ConnectionString %>" DeleteCommand="DELETE FROM [Users] WHERE [user_id] = @user_id" InsertCommand="INSERT INTO [Users] ([userName], [password], [email], [securityQuestion]) VALUES (@userName, @password, @email, @securityQuestion)" OnSelecting="SqlDataSource1_Selecting" SelectCommand="SELECT * FROM [Users]" UpdateCommand="UPDATE [Users] SET [userName] = @userName, [password] = @password, [email] = @email, [securityQuestion] = @securityQuestion WHERE [user_id] = @user_id">
    <DeleteParameters>
        <asp:Parameter Name="user_id" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="userName" Type="String" />
        <asp:Parameter Name="password" Type="String" />
        <asp:Parameter Name="email" Type="String" />
        <asp:Parameter Name="securityQuestion" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="userName" Type="String" />
        <asp:Parameter Name="password" Type="String" />
        <asp:Parameter Name="email" Type="String" />
        <asp:Parameter Name="securityQuestion" Type="String" />
        <asp:Parameter Name="user_id" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>

</asp:Content>
