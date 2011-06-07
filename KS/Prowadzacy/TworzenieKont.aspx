<%@ Page Title="Utwórz konta użytkownikom" Language="C#" MasterPageFile="~/MasterPage.master"
    AutoEventWireup="true" CodeFile="TworzenieKont.aspx.cs" Inherits="Prowadzacy_TwożenieKont" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>
        Utwórz konta użytkownikom</h1>
     
     <p class="info">Każde konto w kolejnej linii, w formacie "login hasło". Separatorem loginu i hasła może być tylko i wyłącznie jeden biały znak (spacja).</p>
     <p><asp:Label ID="ResoultsLabel" runat="server" Text="" Visible="false"></asp:Label></p>
        <asp:TextBox ID="LoginsTextBox" runat="server" Height="220px" TextMode="MultiLine"
            Width="310px"></asp:TextBox>
    <p><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Podaj co najmniej jedno hasło i login"
            ControlToValidate="LoginsTextBox"></asp:RequiredFieldValidator></p>
   
    <p>
        <asp:Button ID="CreateAccountButton" runat="server" Text="Utwórz konta" OnClick="CreateAccountButton_Click" />
    </p>
</asp:Content>
