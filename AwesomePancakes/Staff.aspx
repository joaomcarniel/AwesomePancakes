<%@ Page Title="Staff" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Staff.aspx.cs" Inherits="AwesomePancakes.Staff" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="<%= ResolveUrl("~/CSS/Style.css") %>?v=<%= DateTime.Now.Ticks %>">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="<%= ResolveUrl("~/JS/Staff.js") %>?v=<%= DateTime.Now.Ticks %>"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="staff-body">
        <h1 class="staff-title">Meet Our Team</h1>
        <div id="staff-container"></div>
    </div>

    <div id="staff-overlay" class="overlay">
        <div class="expanded-card">
            <button id="close-staff-modal" class="close-btn">X</button>
            <div class="modal-content">
                <img id="modal-photo" class="modal-photo" />
                <h2 id="modal-name"></h2>
                <h3 id="modal-role"></h3>
                <p id="modal-description"></p>
            </div>
        </div>
    </div>
</asp:Content>

