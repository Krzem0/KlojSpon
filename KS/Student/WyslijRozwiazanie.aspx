<%@ Page Title="Wyślij rozwiązanie" Language="C#" MasterPageFile="~/MasterPage.master"
    AutoEventWireup="true" CodeFile="WyslijRozwiazanie.aspx.cs" Inherits="Student_ZglosZadanie"
    ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>
        Wyślij rozwiązanie zadania</h1>
    <p>
        <asp:Label ID="DoneLabel" runat="server" Text="Rozwiązanie przesłane<br />" ForeColor="#009933"
            Visible="False"></asp:Label>
        <asp:DropDownList ID="ZadaniaDropDownList" runat="server" DataTextField="Tytul" DataValueField="IdZadania"
            OnSelectedIndexChanged="ZadaniaDropDownList_SelectedIndexChanged" AutoPostBack="True">
        </asp:DropDownList>
    </p>
    <p>
        <asp:Label ID="OpisZadaniaLabel" runat="server" Text=""></asp:Label></p>
    <p>
        <asp:Label ID="DatyLabel" runat="server" Text=""></asp:Label></p>
    <p class="info">
        Przed wysłaniem kodu upewnij się, że kompiluje się on poprawnie, gdyż nie ma możliwości
        nadesłania zadania ponownie.<br />
        Dane wejściowe należy pobierać ze standardowego wejścia i wysyłać na standardowe wyjście.
    </p>
    <p>
        Tu wklej kod swojego programu:</p>
    <asp:TextBox ID="KodTextBox" runat="server" TextMode="MultiLine" Height="350px" Width="500px"></asp:TextBox>
    <asp:Button ID="SendButton" runat="server" Text="Wyślij" OnClick="SendButton_Click" />
</asp:Content>
