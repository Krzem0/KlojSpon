﻿<%@ Page Title="Ranking" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Ranking.aspx.cs" Inherits="Ranking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>
        Ranking</h1>
    <asp:ListView ID="RankingListView" runat="server" DataKeyNames="IdZadania" OnSelectedIndexChanging="RankingListView_SelectedIndexChanging">
        <LayoutTemplate>
            <table id="itemPlaceholderContainer" runat="server" class="tabela">
                <tr id="Tr1" runat="server">
                    <th>
                        Lp.
                    </th>
                    <th>
                        Tytuł zadania
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
                    <asp:LinkButton ID="TytulLinkButton" runat="server" Text='<%# Eval("Tytul") %>' CommandName="Select"></asp:LinkButton>
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
            <table runat="server">
                <tr>
                    <td>
                        Brak zadań w rankingu.
                    </td>
                </tr>
            </table>
        </EmptyDataTemplate>
    </asp:ListView>
</asp:Content>
