<%@ Page Title="Raport zadania w grupie" Language="C#" MasterPageFile="~/MasterPage.master"
    AutoEventWireup="true" CodeFile="RaportZadanieWGrupie.aspx.cs" Inherits="Prowadzacy_RaportZadanieWGrupie" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>
        Raport z zadania</h1>
    <h2>
        <asp:Label ID="NazwaZadaniaLabel" runat="server" Text="Brak zadania"></asp:Label>
    </h2>
    <p>
        Treść zadania:<br />
        <asp:Label ID="TrescLabel" runat="server" Text="Brak treści"></asp:Label>
    </p>
    <table>
        <tr>
            <td>
                Data otwarcia:&nbsp<asp:Label ID="DataOtwarciaLabel" runat="server" Text="Brak"></asp:Label>
            </td>
            <td>
                Data zamknięcia:&nbsp<asp:Label ID="DataZamknieciaLabel" runat="server" Text="Brak"></asp:Label>
            </td>
        </tr>
    </table>
    <h3>
        Nadesłane rozwiązania:</h3>
    <asp:ListView ID="NadeslaneRozwiazaniaListView" runat="server" DataKeyNames="UserId">
        <LayoutTemplate>
            <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                <tr id="Tr1" runat="server" style="">
                    <th id="Th1" runat="server">
                        Student
                    </th>
                    <th id="Th2" runat="server">
                        Ocena
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
                    <asp:Label ID="DataDodaniaLabel" runat="server" Text='<%# Eval("Ocena") %>'></asp:Label>
                </td>
            </tr>
        </ItemTemplate>
        <EmptyDataTemplate>
            <table id="Table1" runat="server">
                <tr>
                    <td>
                        Nie ma nadesłanych rozwiązań.
                    </td>
                </tr>
            </table>
        </EmptyDataTemplate>
    </asp:ListView>
</asp:Content>
