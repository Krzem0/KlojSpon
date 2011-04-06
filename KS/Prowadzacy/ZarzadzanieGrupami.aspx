<%@ Page Title="Zarządzanie grupami" Language="C#" MasterPageFile="~/MasterPage.master"
    AutoEventWireup="true" CodeFile="ZarzadzanieGrupami.aspx.cs" Inherits="Prowadzący_ZarzadzanieGrupami" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>
        Zarządzanie grupami</h1>
    <h3>
        Lista grup</h3>
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" EnableModelValidation="True">
        <EmptyDataTemplate>
            <table runat="server">
                <tr>
                    <td>
                        Nie posiadasz żadnej grupy.
                    </td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <ItemTemplate>
            <tr style="">
                <td>
                    <asp:LinkButton ID="NazwaLinkButton" runat="server" OnClick="NazwaLinkButton_Click"
                        Text='<%# Eval("Nazwa") %>'></asp:LinkButton>
                </td>
                <td>
                    <asp:Label ID="DataUtworzeniaLabel" runat="server" Text='<%# Eval("DataUtworzenia") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                <tr runat="server" style="">
                    <th runat="server">
                        Nazwa
                    </th>
                    <th runat="server">
                        DataUtworzenia
                    </th>
                </tr>
                <tr id="itemPlaceholder" runat="server">
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="NazwaLabel" runat="server" Text='<%# Eval("Nazwa") %>' />
                </td>
                <td>
                    <asp:Label ID="DataUtworzeniaLabel" runat="server" Text='<%# Eval("DataUtworzenia") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyConnectionString %>"
        SelectCommand="SELECT [Nazwa], [DataUtworzenia] FROM [Grupy] WHERE ([IdWlasciciela] = @IdWlasciciela)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="IdWlasciciela" SessionField="IdProwadzacego"
                Type="Object" />
        </SelectParameters>
    </asp:SqlDataSource>
    <h3>
        Dodawanie grupy</h3>
    <asp:Label ID="GroupNameLabel" runat="server" Text="Nazwa grupy: "></asp:Label>
    <asp:TextBox ID="GroupNameTextBox" runat="server" ValidationGroup="GroupName"></asp:TextBox>
    <asp:RequiredFieldValidator
        ID="ChoosenGroupName" runat="server" ErrorMessage="Musisz podać nazwę grupy"
        ControlToValidate="GroupNameTextBox" ValidationGroup="GroupName">*</asp:RequiredFieldValidator>
    <asp:Button ID="GroupNameButton" runat="server" Text="Dodaj grupę" OnClick="GroupNameButton_Click"
        ValidationGroup="GroupName" />
    <br />
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="GroupName" />
    <br />
    <asp:Label ID="GroupNameExistLabel" runat="server" Visible="False"></asp:Label>
</asp:Content>
