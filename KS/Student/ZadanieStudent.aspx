<%@ Page Title="Zadanie" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="ZadanieStudent.aspx.cs" Inherits="Student_ZadanieStudent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>
        <asp:Label ID="TytulLabel" runat="server" Text="Nic tu nie ma"></asp:Label>
    </h1>
    <p>
        <asp:Label ID="OpisLabel" runat="server" Text="Nic tu nie ma"></asp:Label>
    </p>
    <p>
        <asp:Label ID="DataLabel" runat="server" Text="Brak daty"></asp:Label></p>
    <p>
        <asp:Label ID="OcenaLabel" runat="server" Text="Brak oceny"></asp:Label><asp:HyperLink
            ID="WyslijZadanieHyperLink" runat="server" Visible="False" NavigateUrl="~/Student/WyslijRozwiazanie.aspx">wyślij</asp:HyperLink></p>
</asp:Content>
