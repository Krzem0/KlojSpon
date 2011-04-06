<%@ Page Title="Dodaj zadanie" Language="C#" MasterPageFile="~/MasterPage.master"
    AutoEventWireup="true" CodeFile="DodajZadanie.aspx.cs" Inherits="Prowadzacy_DodajZadanie" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <p>
        Tytuł:
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Podaj tytuł"
            Text="*" ControlToValidate="TytulTextBox"></asp:RequiredFieldValidator>
        <asp:TextBox ID="TytulTextBox" runat="server"></asp:TextBox></p>
    <p>
        Opis:
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Podaj opis"
            Text="*" ControlToValidate="OpisTextBox"></asp:RequiredFieldValidator>
        <asp:TextBox ID="OpisTextBox" runat="server" Height="183px" TextMode="MultiLine"
            Width="432px"></asp:TextBox></p>
    <p>
        Data otwarcia:
        <asp:TextBox ID="DataOtwarciaTextBox" runat="server" Height="19px" Width="75px"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Wprowadź poprawny format daty otwarcia"
            Text="*" ControlToValidate="DataOtwarciaTextBox" ValidationExpression="^(19|20)\d\d[- /.](0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])$">
        </asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Wprowadź datę otwarcia"
            Text="*" ControlToValidate="DataOtwarciaTextBox">
        </asp:RequiredFieldValidator>
        Data zamknięcia:
        <asp:TextBox ID="DataZamknieciaTextBox" runat="server" Height="19px" Width="75px"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Wprowadź poprawny format daty zamknięcia"
            Text="*" ControlToValidate="DataZamknieciaTextBox" ValidationExpression="^(19|20)\d\d[- /.](0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])$">
        </asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Wprowadź datę zamknięcia"
            Text="*" ControlToValidate="DataZamknieciaTextBox">
        </asp:RequiredFieldValidator></p>
    <p>
        Dane wejściowe:
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Podaj dane wejściowe"
            Text="*" ControlToValidate="DaneWeTextBox">
        </asp:RequiredFieldValidator>
        <asp:TextBox ID="DaneWeTextBox" runat="server" Height="113px" TextMode="MultiLine"
            Width="205px"></asp:TextBox>
        
        Dane wyjściowe:
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Podaj dane wyjściowe"
            Text="*" ControlToValidate="DaneWyTextBox">
        </asp:RequiredFieldValidator>
        <asp:TextBox ID="DaneWyTextBox" runat="server" Height="106px" TextMode="MultiLine"
            Width="204px"></asp:TextBox></p>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
    <asp:Button ID="WyslijButton" runat="server" Text="Dodaj zadanie" 
        onclick="WyslijButton_Click" />
</asp:Content>
