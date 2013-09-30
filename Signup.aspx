<%@ Page Title="" Language="C#" MasterPageFile="~/DotnetHome.Master" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="WebApplication2.Signup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        #Button1 {
        border-radius:4px;
        border-top:3px;
        margin-left:10px;
        }
        .auto-style9 {
            width: 152px;
            text-align: right;
            font-size: large;
            height: 33px;
        }
        .auto-style10 {
            width: 198px;
            border-radius: 4px;
            height: 33px;
            
        }
        .auto-style11 {
            width: 414px;
            text-align: left;
            height: 33px;
        }
        .auto-style12 {
            height: 33px;
        }
        .txtbx {
            text-align: left;
        }
    </style>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
    <p style="font-size: x-large; font-weight: 700; text-align: center">
        Sign up</p>
    <table class="auto-style1">
        <tr>
            <td class="auto-style9">User Name:</td>
            <td class="auto-style10">
                <asp:TextBox ID="txtbuserName" runat="server" Height="24px" Width="180px" CssClass="txtbx"></asp:TextBox>
            </td>
            <td class="auto-style11">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtbuserName" ErrorMessage="Please enter a user name.." ForeColor="Blue"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style9">Password:</td>
            <td class="auto-style10">
                <asp:TextBox ID="txtbPass" runat="server" Height="24px" TextMode="Password" Width="180px" CssClass="txtbx"></asp:TextBox>
            </td>
            <td class="auto-style11">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtbPass" ErrorMessage="Please enter a password!" ForeColor="Blue"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style9">Confirm password:</td>
            <td class="auto-style10">
                <asp:TextBox ID="txtbConfirmPass" runat="server" Height="24px" TextMode="Password" Width="180px" CssClass="txtbx"></asp:TextBox>
            </td>
            <td class="auto-style11">
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtbPass" ControlToValidate="txtbConfirmPass" ErrorMessage="Password mismatch!" ForeColor="Blue"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style9">Email:</td>
            <td class="auto-style10">
                <asp:TextBox ID="txtbemail" runat="server" Height="24px" Width="180px" CssClass="txtbx"></asp:TextBox>
            </td>
            <td class="auto-style11" colspan="2">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtbemail" ErrorMessage="Please enter a valid email!" ForeColor="Blue" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td colspan="1" class="auto-style12"></td>
            <td colspan="1" class="auto-style12"><asp:Button ID="Button1" runat="server" Text="Sign Up"  style="text-align: left" CssClass="btn" Font-Bold="True" Height="25px" Width="88px" OnClick="Button1_Click" /></td>
            <td class="auto-style9" colspan="1">
                

            </td>
            
            
        </tr>
    </table>
</asp:Content>
