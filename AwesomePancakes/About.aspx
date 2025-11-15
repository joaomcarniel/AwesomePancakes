<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="AwesomePancakes.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="<%= ResolveUrl("~/CSS/Style.css") %>?v=<%= DateTime.Now.Ticks %>">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="<%= ResolveUrl("~/JS/Main.js") %>?v=<%= DateTime.Now.Ticks %>"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="about-body">
      <h1>🥞 Sobre a Pancake House</h1>
      <p>Bem-vindo à <span class="highlight">Pancake House</span> — o lugar onde cada panqueca é feita com carinho e ingredientes selecionados!</p>
      <p>Nascemos em Dublin com o sonho de unir o sabor das panquecas caseiras com o toque criativo das receitas modernas. Aqui, você encontra desde panquecas doces com frutas frescas 🍓 até opções salgadas com queijo e bacon 🧀🥓.</p>
      <p>Nosso objetivo é simples: fazer você sorrir a cada mordida. 😋</p>
    </div>

</asp:Content>
