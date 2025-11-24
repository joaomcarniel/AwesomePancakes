<%@ Page Title="Booking" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Booking.aspx.cs" Inherits="AwesomePancakes.Booking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="<%= ResolveUrl("~/CSS/Style.css") %>?v=<%= DateTime.Now.Ticks %>">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="<%= ResolveUrl("~/JS/Booking.js") %>?v=<%= DateTime.Now.Ticks %>"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="booking-container">
        <h2>Make your Reservation</h2>

        <asp:Label ID="lblStatus" runat="server" CssClass="status"></asp:Label>

        <div class="form-group">
            <asp:Label ID="lblName" runat="server" Text="Name:" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="txtName" runat="server" CssClass="txt-booking"></asp:TextBox>
        </div>

        <div class="form-group">
            <asp:Label ID="lblEmail" runat="server" Text="Email:" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="txt-booking"></asp:TextBox>
        </div>

        <div class="form-group">
            <asp:Label ID="lblDate" runat="server" Text="Choose the Date:" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="txtDate" runat="server" TextMode="Date"
                ClientIDMode="Static" CssClass="txt-booking" onchange="GetSchedules()"></asp:TextBox>
        </div>

        <div class="form-group">
            <asp:Label ID="lblSchedule" runat="server" Text="Available Times:" CssClass="form-label"></asp:Label>
            <select id="ddlSchedule" name="ddlSchedule" class="txt-booking"></select>
        </div>

        <div class="form-group">
            <asp:Label ID="lblMessage" runat="server" Text="Message:" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Rows="5" CssClass="txt-mensagem"></asp:TextBox>
        </div>

        <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn-enviar" OnClick="btnSubmit_Click" />
    </div>
</asp:Content>
