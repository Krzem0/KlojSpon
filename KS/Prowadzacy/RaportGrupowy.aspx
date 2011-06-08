<%@ Page Title="Raport grupowy" Language="C#" MasterPageFile="~/MasterPage.master"
    AutoEventWireup="true" CodeFile="RaportGrupowy.aspx.cs" Inherits="Prowadzacy_RaportGrupowy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>
        Raport grupowy</h1>
    <h2>
        <asp:Label ID="NazwaGrupyLabel" runat="server" Text="Brak grupy"></asp:Label>
    </h2>
    <h3>
        Studenci w grupie:
    </h3>
    <asp:ListView ID="StudenciWGrupieListView" runat="server" DataKeyNames="UserId">
        <LayoutTemplate>
            <table id="itemPlaceholderContainer" class="tabela" runat="server" border="0" style="">
                <tr id="Tr1" runat="server" style="">
                    <th id="Th1" runat="server">
                        Studenci
                    </th>
                    <th id="Th2" runat="server">
                        Data dodania
                    </th>
                </tr>
                <tr id="itemPlaceholder" runat="server">
                </tr>
            </table>
        </LayoutTemplate>
        <ItemTemplate>
            <tr>
                <td>
                    <asp:Label ID="NazwaUrzytkownikaLabel" runat="server" Text='<%# Eval("UserName") %>'></asp:Label>
                </td>
                <td>
                    <asp:Label ID="DataDodaniaLabel" runat="server" Text='<%# Eval("DataDodania") %>'></asp:Label>
                </td>
            </tr>
        </ItemTemplate>
        <EmptyDataTemplate>
            <table id="Table1" runat="server">
                <tr>
                    <td><p class="komunikat info">
                        Nie ma studentów w tej grupie.</p>
                    </td>
                </tr>
            </table>
        </EmptyDataTemplate>
    </asp:ListView>
    <h3>
        Zadania przydzielone do grupy:
    </h3>
    <asp:ListView ID="ZadaniaWGrupieListView" runat="server" DataKeyNames="IdZadania"
        OnSelectedIndexChanging="ZadanieIndexChanging">
        <LayoutTemplate>
            <table id="itemPlaceholderContainer" class="tabela" runat="server" border="0" style="">
                <tr id="Tr1" runat="server" style="">
                    <th id="Th1" runat="server">
                        Tytuł
                    </th>
                    <th id="Th2" runat="server">
                        Data otwarcia
                    </th>
                    <th id="Th3" runat="server">
                        Data zamknięcia
                    </th>
                </tr>
                <tr id="itemPlaceholder" runat="server">
                </tr>
            </table>
        </LayoutTemplate>
        <ItemTemplate>
            <tr>
                <td>
                    <asp:LinkButton ID="TytulLinkButton" runat="server" Text='<%# Eval("Tytul") %>' CommandName="Select"></asp:LinkButton>
                </td>
                <td>
                    <asp:Label ID="DataOtwarciaLabel" runat="server" Text='<%# Eval("DataOtwarcia") %>'></asp:Label>
                </td>
                <td>
                    <asp:Label ID="DataZamknieciaLabel" runat="server" Text='<%# Eval("DataZamkniecia") %>'></asp:Label>
                </td>
            </tr>
        </ItemTemplate>
        <EmptyDataTemplate>
            <table id="Table1" runat="server">
                <tr>
                    <td><p class="komunikat info">
                        Nie ma zadań przydzielonych do tej grupy.</p>
                    </td>
                </tr>
            </table>
        </EmptyDataTemplate>
    </asp:ListView>
</asp:Content>
