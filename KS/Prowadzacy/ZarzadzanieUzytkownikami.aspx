<%@ Page Title="Zarządzanie użytkownikami" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ZarzadzanieUzytkownikami.aspx.cs" Inherits="Prowadzacy_ZarzadzanieUrzytkownikami" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<H1>Zarządzanie Użytkownikami</H1>
<ul>
<li>
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Prowadzacy/TworzenieKont.aspx">Tworzenie kont użytkowników</asp:HyperLink></li>
</ul>
</asp:Content>

