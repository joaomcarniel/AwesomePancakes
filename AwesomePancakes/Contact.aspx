<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="AwesomePancakes.Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="<%= ResolveUrl("~/CSS/Style.css") %>?v=<%= DateTime.Now.Ticks %>">    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="contact-body">
        <h1 class="contact-title">📍 Contact Us</h1>
        <p class="contact-subtitle">
            We’re always happy to hear from you! Feel free to reach out using any of the options below.
        </p>
        <div class="contact-grid">
            <div class="contact-card">
                <h2>Our Location</h2>
                <iframe
                    class="contact-map"
                    src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2382.567043419005!2d-6.260309484230889!3d53.34980597997901!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x48670e9b5f8425d3%3A0x2cc16d0df2ad1!2sDublin%2C%20Ireland!5e0!3m2!1sen!2sie!4v0000000000000"
                    allowfullscreen=""
                    loading="lazy"
                    referrerpolicy="no-referrer-when-downgrade">
                </iframe>
            </div>
            <div class="contact-card">
                <h2>Get in Touch</h2>
                <p><strong>Email:</strong> contact@pancakehouse.com</p>
                <p><strong>Phone:</strong> +353 89 123 4567</p>
                <p><strong>Address:</strong><br>
                    Pancake House<br>
                    12 Breakfast Street<br>
                    Dublin, Ireland
                </p>
                <h2>Opening Hours</h2>
                <p>Monday – Friday: 8:00 AM – 6:00 PM</p>
                <p>Saturday – Sunday: 9:00 AM – 8:00 PM</p>
            </div>
        </div>
    </div>
</asp:Content>
