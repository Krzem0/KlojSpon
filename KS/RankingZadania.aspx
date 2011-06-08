<%@ Page Title="Ranking zadania" Language="C#" MasterPageFile="~/MasterPage.master"
    AutoEventWireup="true" CodeFile="RankingZadania.aspx.cs" Inherits="RankingZadania" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Label ID="TytulZadaniaLabel" runat="server" Text="<h1>o0</h1>"></asp:Label>
    <asp:ListView ID="RankingListView" runat="server">
        <LayoutTemplate>
            <table id="itemPlaceholderContainer" runat="server" class="tabela">
                <tr id="Tr1" runat="server">
                    <th>
                        Lp.
                    </th>
                    <th>
                        Student
                    </th>
                    <th>
                        Ocena
                    </th>
                    <th>
                        Data nadesłania
                    </th>
                </tr>
                <tr id="ItemPlaceholder">
                </tr>
            </table>
        </LayoutTemplate>
        <ItemTemplate>
            <tr>
                <td>
                    <asp:Label ID="LpLabel" runat="server" Text='<%# Eval("Lp") %>'></asp:Label>
                </td>
                <td>
                    <asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>'></asp:Label>
                </td>
                <td>
                    <asp:Label ID="OcenaLabel" runat="server" Text='<%# Eval("Ocena") %>'></asp:Label>
                </td>
                <td>
                    <asp:Label ID="DataNadeslaniaLabel" runat="server" Text='<%# Eval("DataNadeslania") %>'></asp:Label>
                </td>
            </tr>
        </ItemTemplate>
        <EmptyDataTemplate>
            <table id="Table1" runat="server" class="komunikat info">
                <tr>
                    <td>
                        Brak osób w rankingu.
                    </td>
                </tr>
            </table>
        </EmptyDataTemplate>
    </asp:ListView>
</asp:Content>
