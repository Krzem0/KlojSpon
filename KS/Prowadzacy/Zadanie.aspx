<%@ Page Title="Zadanie" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Zadanie.aspx.cs" Inherits="Prowadzacy_Zadanie" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>
        <asp:Label ID="ExcrciseLabel" runat="server" Text=""></asp:Label></h1>
    <p>
        <asp:Label ID="DescriptionLabel" runat="server" Text=""></asp:Label></p>
    <p>
        Data rozpoczęcia:
        <asp:Label ID="StartDateLabel" runat="server" Text=""></asp:Label><br />
        Data zakończenia:
        <asp:Label ID="EndDateLabel" runat="server" Text=""></asp:Label></p>
</asp:Content>
