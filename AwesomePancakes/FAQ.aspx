<%@ Page Title="FAQ" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FAQ.aspx.cs" Inherits="AwesomePancakes.FAQ" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="<%= ResolveUrl("~/CSS/Style.css") %>">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="<%= ResolveUrl("~/JS/FAQ.js") %>"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>FAQ</h1>
<h2>FAQ - Click on your question below and to see our advice</h2>
 	 <div id="accordion">
	<h4 class="question">Question?</h4>
           		<p class="answer">Answer  Bla Bla Bla</p>
           	
             		<h4 class="question">How will I know what to do?</h4>
           		<p class="answer">All members are offered individualised assessment bla bla 			bla....</p>
            
               	<h4 class="question">How Long Does the Assessment take</h4>
               	<p class="answer">Treatments last around 40 minutes...bla bal</p>
            
               	<h4 class="question">Question?</h4>
               	<p class="answer">Yes...bla bla bla bla</p>
            
               	<h4 class="question">Question</h4>
               	<p class="answer">Answer...</p>
            
               	<h4 class="question">Question</h4>
               	<p class="answer">Answer.</p>
            
               	<h4 class="question">Question</h4>
               	<p class="answer">Answer...</p>
            
               	<h4 class="question">Question</h4>
               	<p class="answer">Answer.</p>
               	<h4 class="question">What are your opening hours?</h4>
               	<p class="answer">We're open Monday-Friday 8:00am-7:30pm. Appointments are 		available on Saturdays by request only. Free car parking is available.</p>
               	<h4 class="question">Question</h4>
               	<p class="answer">Answer bla bla bla... </p>
   	</div>
</asp:Content>
