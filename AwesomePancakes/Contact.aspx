<%@ Page Title="Contato" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="AwesomePancakes.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="<%= ResolveUrl("~/CSS/Style.css") %>?v=<%= DateTime.Now.Ticks %>">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="contact-container">
        <div class="contact-header">
            <h2>Formulário de Contato</h2>
        </div>

        <div class="contact-body">
            <asp:Label ID="lblStatus" runat="server" ForeColor="Green"></asp:Label>

            <asp:Label ID="lblNome" runat="server" Text="Name:"></asp:Label>
            <asp:TextBox ID="txtNome" runat="server" CssClass="contact-question"></asp:TextBox>

            <asp:Label ID="lblEmail" runat="server" Text="Email:"></asp:Label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="contact-question"></asp:TextBox>

            <asp:Label ID="Label1" runat="server" Text="Telephone:"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" CssClass="contact-question"></asp:TextBox>

            <asp:Label ID="Label2" runat="server" Text="Number of People:"></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server" CssClass="contact-question"></asp:TextBox>

            <asp:Label ID="Label3" runat="server" Text="Time:"></asp:Label>
            <asp:TextBox ID="TextBox3" runat="server" CssClass="contact-question"></asp:TextBox>

            <asp:Label ID="lblData" runat="server" Text="Date:"></asp:Label>
            <asp:TextBox ID="txtData" runat="server" TextMode="Date" CssClass="txt-contact"></asp:TextBox>


            <asp:Label ID="lblMensagem" runat="server" Text="Message:"></asp:Label>
            <asp:TextBox ID="txtMensagem" runat="server" TextMode="MultiLine" Rows="5" CssClass="contact-answer"></asp:TextBox>

            <asp:Button ID="btnEnviar" runat="server" Text="Enviar" CssClass="tab active" OnClick="btnEnviar_Click" />
        </div>
    </div>
</asp:Content>
