<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="ZglosZadanie.aspx.cs" Inherits="Student_ZglosZadanie" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>Wysyłanie rozwiązania zadania</h1>
    <asp:DropDownList ID="ZadaniaDropDownList" runat="server" DataTextField="Tytul" DataValueField="IdZadania"
        OnSelectedIndexChanged="ZadaniaDropDownList_SelectedIndexChanged" 
        AutoPostBack="True">
    </asp:DropDownList>
    <p>
        <asp:Label ID="OpisZadaniaLabel" runat="server" Text=""></asp:Label></p>
    <p>
        <asp:Label ID="DatyLabel" runat="server" Text=""></asp:Label></p>
</asp:Content>
