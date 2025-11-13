<%@ Page Title="FAQ" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FAQ.aspx.cs" Inherits="AwesomePancakes.FAQ" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="<%= ResolveUrl("~/CSS/Style.css") %>">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="faq-container">
        <div class="faq-item">
            <div class="faq-question">Como faço para criar uma conta?</div>
            <div class="faq-answer">Você pode criar uma conta clicando em "Registrar".</div>
        </div>

        <div class="faq-item">
            <div class="faq-question">Posso alterar meu e-mail?</div>
            <div class="faq-answer">Sim, nas configurações da conta.</div>
        </div>

        <div class="faq-item">
            <div class="faq-question">Há suporte técnico 24h?</div>
            <div class="faq-answer">Nosso suporte está disponível das 8h às 22h.</div>
        </div>
    </div>

    <script src="<%= ResolveUrl("~/JS/Main.js") %>"></script>
</asp:Content>
