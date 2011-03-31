<%@ Page Title="Zmiana hasła" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h1>Zmiana hasła</h1>
    <asp:ChangePassword ID="ChangePassword1" runat="server" 
        CancelButtonText="Anuluj" ChangePasswordButtonText="Zapisz zmiany" 
        ChangePasswordTitleText="" 
        ConfirmNewPasswordLabelText="Potwierdź Nowe Hasło:" 
        ConfirmPasswordCompareErrorMessage="Potwierdzone Hasło musi zgadzać się z Nowym Hasłem." 
        ConfirmPasswordRequiredErrorMessage="Potwierdzenie Nowego Hasła jest wymagane." 
        NewPasswordLabelText="Nowe Hasło:" 
        NewPasswordRequiredErrorMessage="Nowe Hasło jest wymagane." 
        PasswordLabelText="Hasło:" PasswordRequiredErrorMessage=" jest wymagane.">
    </asp:ChangePassword>

</asp:Content>

