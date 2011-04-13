<%@ Page Title="Rejestracja" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Register.aspx.cs" Inherits="Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>
        Utwórz Konto</h1>
    <table>
        <tr>
            <td align="right">
                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Login:</asp:Label>
            </td>
            <td>
                <asp:TextBox ID="UserName" runat="server" ValidationGroup="CreateUser"></asp:TextBox>
                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                    ErrorMessage="Login jest wymagany." ToolTip="Login jest wymagany." ValidationGroup="CreateUser">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Hasło:</asp:Label>
            </td>
            <td>
                <asp:TextBox ID="Password" runat="server" TextMode="Password" ValidationGroup="CreateUser"></asp:TextBox>
                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                    ErrorMessage="Hasło jest wymagane." ToolTip="Hasło jest wymagane." ValidationGroup="CreateUser">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">Potwierdź Hasło:</asp:Label>
            </td>
            <td>
                <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password" ValidationGroup="CreateUser"></asp:TextBox>
                <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword"
                    ErrorMessage="Potwierdzenie Hasła jest wymagane." ToolTip="Potwierdzenie Hasła jest wymagane."
                    ValidationGroup="CreateUser">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">E-mail:</asp:Label>
            </td>
            <td>
                <asp:TextBox ID="Email" runat="server" ValidationGroup="CreateUser"></asp:TextBox>
                <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email"
                    ErrorMessage="E-mail jest wymagany." ToolTip="E-mail jest wymagany." ValidationGroup="CreateUser">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:Label ID="NameLabel" runat="server" AssociatedControlID="NameTextBox">Imię:</asp:Label>
            </td>
            <td>
                <asp:TextBox ID="NameTextBox" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:Label ID="SurnameLabel" runat="server" AssociatedControlID="SurnameTextBox">Nazwisko:</asp:Label>
            </td>
            <td>
                <asp:TextBox ID="SurnameTextBox" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password"
                    ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="Hasło i Powtórzone Hasło muszę być identyczne."
                    ValidationGroup="CreateUser"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2" style="color: Red;">
                <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="CreateUser" />
            </td>
        </tr>
        <tr>
            <td colspan="2" style="color: Green;">
                <asp:Label ID="DoneLabel" runat="server" Text="" Visible="false"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right" colspan="2">
                <asp:Button ID="UtworzKontoButton" runat="server" Text="Utwórz" OnClick="UtworzKontoButton_Click"
                    ValidationGroup="CreateUser" />
            </td>
        </tr>
    </table>
</asp:Content>
