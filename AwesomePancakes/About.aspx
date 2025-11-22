<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="AwesomePancakes.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="<%= ResolveUrl("~/CSS/Style.css") %>?v=<%= DateTime.Now.Ticks %>">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="<%= ResolveUrl("~/JS/About.js") %>?v=<%= DateTime.Now.Ticks %>"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="about-body">
      <h1>🥞 We are Awesome Pancake</h1>
      <p>Welcome to our <span class="highlight">Home</span> — the place where every pancake is made with love and carefully selected ingredients!</p>
      <p>We were born in Dublin with the dream of combining the taste of homemade pancakes with the creative touch of modern recipes. Here, you'll find everything from sweet pancakes with fresh fruit 🍓 to savory options with cheese and bacon 🧀🥓.</p>
      <p>Our goal is simple: to make you smile with every bite. 😋</p>
    </div>

    <div class="about-carousel">
        <button type="button" class="carousel-btn prev">&#10094;</button>

        <div class="carousel-track">
            <img src="/Images/restaurant-reception.png" class="carousel-img active">
            <img src="/Images/restaurant-tables.png" class="carousel-img">
        </div>

        <button type="button" class="carousel-btn next">&#10095;</button>
    </div>


</asp:Content>
