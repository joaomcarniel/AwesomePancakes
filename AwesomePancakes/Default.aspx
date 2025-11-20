<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AwesomePancakes.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="<%= ResolveUrl("~/CSS/Style.css") %>?v=<%= DateTime.Now.Ticks %>">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="<%= ResolveUrl("~/JS/Main.js") %>?v=<%= DateTime.Now.Ticks %>"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="menu-container" id="main-menu">
        <div class="menu-tabs">
            <button type="button" class="tab active" data-target="Pancake">🥞 Pancakes</button>
            <button type="button" class="tab" data-target="Side">🍟 Snacks & Sides</button>
            <button type="button" class="tab" data-target="Salad">🥗 Salads</button>
            <button type="button" class="tab" data-target="Drink">🥤 Drinks</button>
        </div>

        <div id="menu-content"></div>

        <div class="order-calculator">
            <h2>🧮 Order Calculator</h2>
            <div id="order-list"></div>
            <div class="order-total">Total: <span id="total-price">€0.00</span></div>
        </div>
    </div>
</asp:Content>

<%--  --%>