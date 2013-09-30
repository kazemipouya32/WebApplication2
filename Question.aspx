<%@ Page Title="" Language="C#" MasterPageFile="~/DotnetHome.Master" AutoEventWireup="true" CodeBehind="Question.aspx.cs" Inherits="WebApplication2.Question" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID ="ContentPlaceHolder4" runat="server">

      <div id="question">
        <div id="qTitle">
            <h4  class="qTitleH" id="qTitleH" runat="server"></h4>
        </div>
        <div id="qDescription"><textarea class="answearArea" id="description" runat="server"></textarea></div>
        <div id="answear"><textarea class="answearArea" id="answearArea" runat="server"></textarea><br />
             <asp:Button ID="Button1" runat="server" Text="Post Your Answear" BackColor="Black" Font-Bold="True" ForeColor="White" Height="38px" OnClick="Button1_Click" />
             <asp:Button ID="Button2" runat="server" Text="Log out" BackColor="Black" Font-Bold="True" ForeColor="White" Height="38px" OnClick="Button2_Click"/>
         </div>       
    </div>
</asp:Content>
