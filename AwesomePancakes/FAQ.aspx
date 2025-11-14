<%@ Page Title="FAQ" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FAQ.aspx.cs" Inherits="AwesomePancakes.FAQ" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="<%= ResolveUrl("~/CSS/Style.css") %>">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="<%= ResolveUrl("~/JS/FAQ.js") %>?v=<%= DateTime.Now.Ticks %>"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="faq-body">
        <div class="faq-header">
            <h1>Frequently Asked Questions</h1>
        </div>
        <div id="menu-content-faq"></div>
	    
    </div>
    
</asp:Content>
