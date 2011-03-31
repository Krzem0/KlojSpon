<%@ Page Title="Dodaj zadanie" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DodajZadanie.aspx.cs" Inherits="Prowadzacy_DodajZadanie" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
Tytuł, Opis, Data otwarcia, Data zamknięcia
<br />
<p>Tytuł: <asp:TextBox ID="TytulTextBox" runat="server"></asp:TextBox></p>
<p>
    <asp:TextBox ID="OpisTextBox" runat="server" Height="183px" 
        TextMode="MultiLine" Width="432px"></asp:TextBox></p>
    <asp:TextBox ID="DataOtwarciaTextBox" runat="server" ></asp:TextBox>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="RegularExpressionValidator" ControlToValidate="DataOtwarciaTextBox"></asp:RegularExpressionValidator>
    <asp:TextBox ID="DataZamknieciaTextBox" runat="server"></asp:TextBox>
    <asp:Button ID="WyslijButton" runat="server" Text="Dodaj zadanie" />
</asp:Content>

