<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Contact.aspx.cs" Inherits="AwesomePancakes.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="<%= ResolveUrl("~/CSS/Style.css") %>?v=<%= DateTime.Now.Ticks %>">

    <script type="text/javascript">
        function GetSchedules() {
            var date = document.getElementById('<%= txtDate.ClientID %>').value;
            if (!date) return;

            PageMethods.GetBusySchedules(date, function (busy) {
                var ddl = document.getElementById("ddlSchedule");
                ddl.innerHTML = "";

                var schedules = ["09:00:00", "10:00:00", "11:00:00", "14:00:00", "15:00:00", "16:00:00"];

                schedules.forEach(function (s) {
                    var option = document.createElement("option");
                    option.value = s;

                    if (busy.includes(s)) {
                        option.text = s + " (sold out)";
                        option.disabled = true;
                        option.style.color = "gray";
                    } else {
                        option.text = s;
                    }

                    ddl.appendChild(option);
                });

                ddl.selectedIndex = -1;
            });
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="contact-container">
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
                CssClass="txt-booking" onchange="GetSchedules()"></asp:TextBox>
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
