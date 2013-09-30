<%@ Page Title="" Language="C#" MasterPageFile="~/DotnetHome.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="WebApplication2.Home" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    
    <div id ="login">
        <div id ="user">
            <asp:TextBox ID="username" placeholder="User Name" runat="server" CssClass="txtbox" Height="24px" Width="150px"></asp:TextBox>   
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="username" ErrorMessage="You must enter user name!" ForeColor="Black"></asp:RequiredFieldValidator>
        </div>
        <div id ="passwrd">
            <asp:TextBox ID="pass" runat="server" TextMode="Password" CssClass="txtbox" Height="24px" Width="150px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="pass" ErrorMessage="You must enter password...!"></asp:RequiredFieldValidator>
        </div>
        <div id ="loginbutton">
            <asp:Button ID="Button1" runat="server" OnClick="login_Click" Text="Log In" CssClass="btn" Height="28px" Width="91px"  />
            
            <asp:HyperLink ID="HyperLink1" runat="server" CssClass="hlink" Font-Bold="True" Font-Size="Medium" NavigateUrl="~/Signup.aspx" >Sign up</asp:HyperLink>
            
            <asp:Label ID="Label1" runat="server" Text="Something unexpected happened!"  CssClass="lable" Font-Bold="True" Font-Size="Medium" Visible="False"></asp:Label>
        </div>
        </div>   
</asp:Content>

    <asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
        <div id="wrapHome">
        <table id="qtable" >
       
        </table> 
        <div id="divTgs" class="divTgs" runat="server"></div>  
            </div>     
     </asp:Content>
<%-- <asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
        <div id="divTgs" class="divTgs" runat="server"></div>     
     </asp:Content>--%>
