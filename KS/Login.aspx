<%@ Page Title="Logowanie" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Login ID="Login1" runat="server" LoginButtonText="Zaloguj" 
    PasswordLabelText="Hasło:" PasswordRequiredErrorMessage="Hasło jest wymagane." 
    RememberMeText="Zapamiętaj moje dane." TitleText="Logowanie" 
    UserNameLabelText="Login:" UserNameRequiredErrorMessage="Legin jest wymagany." 
        FailureText="Twoja próba logowania nie powiodła się.">
    </asp:Login>
</asp:Content>

