<%@ Page Title="Zmiana hasła" Language="C#" MasterPageFile="~/MasterPage.master"
    AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>
        Zmiana hasła</h1>
    <asp:ChangePassword ID="ChangePassword1" runat="server" CancelButtonText="Anuluj"
        ChangePasswordButtonText="Zapisz zmiany" ChangePasswordTitleText="" ConfirmNewPasswordLabelText="Potwierdź Nowe Hasło:"
        ConfirmPasswordCompareErrorMessage="Potwierdzone Hasło musi zgadzać się z Nowym Hasłem."
        ConfirmPasswordRequiredErrorMessage="Potwierdzenie Nowego Hasła jest wymagane."
        NewPasswordLabelText="Nowe Hasło:" NewPasswordRequiredErrorMessage="Nowe Hasło jest wymagane."
        PasswordLabelText="Hasło:" PasswordRequiredErrorMessage=" jest wymagane.">
        <ChangePasswordTemplate>
            <table cellpadding="1" cellspacing="0" style="border-collapse: collapse;">
                <tr>
                    <td>
                        <table cellpadding="0">
                            <tr>
                                <td align="right">
                                    <asp:Label ID="CurrentPasswordLabel" runat="server" AssociatedControlID="CurrentPassword">Hasło:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="CurrentPassword" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="CurrentPasswordRequired" runat="server" ControlToValidate="CurrentPassword"
                                        ErrorMessage=" jest wymagane." ToolTip=" jest wymagane." ValidationGroup="ChangePassword1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="NewPasswordLabel" runat="server" AssociatedControlID="NewPassword">Nowe Hasło:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="NewPassword" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="NewPasswordRequired" runat="server" ControlToValidate="NewPassword"
                                        ErrorMessage="Nowe Hasło jest wymagane." ToolTip="Nowe Hasło jest wymagane."
                                        ValidationGroup="ChangePassword1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="ConfirmNewPasswordLabel" runat="server" AssociatedControlID="ConfirmNewPassword">Potwierdź Nowe Hasło:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="ConfirmNewPassword" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ConfirmNewPasswordRequired" runat="server" ControlToValidate="ConfirmNewPassword"
                                        ErrorMessage="Potwierdzenie Nowego Hasła jest wymagane." ToolTip="Potwierdzenie Nowego Hasła jest wymagane."
                                        ValidationGroup="ChangePassword1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2">
                                    <asp:CompareValidator ID="NewPasswordCompare" runat="server" ControlToCompare="NewPassword"
                                        ControlToValidate="ConfirmNewPassword" Display="Dynamic" ErrorMessage="Potwierdzone Hasło musi zgadzać się z Nowym Hasłem."
                                        ValidationGroup="ChangePassword1"></asp:CompareValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2" style="color: Red;">
                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center">
                                    <asp:Button ID="ChangePasswordPushButton" runat="server" CommandName="ChangePassword"
                                        Text="Zapisz zmiany" ValidationGroup="ChangePassword1" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </ChangePasswordTemplate>
    </asp:ChangePassword>
</asp:Content>
