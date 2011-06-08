<%@ Page Title="Raport zadania w grupie" Language="C#" MasterPageFile="~/MasterPage.master"
    AutoEventWireup="true" CodeFile="RaportZadanieWGrupie.aspx.cs" Inherits="Prowadzacy_RaportZadanieWGrupie" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="../Scripts/sh/shCore.js"></script>
    <script type="text/javascript" src="../Scripts/sh/shBrushCSharp.js"></script>
    <link href="../Scripts/sh/css/shCore.css" rel="stylesheet" type="text/css" />
    <link href="../Scripts/sh/css/shThemeDefault.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>
        Raport z zadania</h1>
    <h2>
        <asp:Label ID="NazwaZadaniaLabel" runat="server" Text="Brak zadania"></asp:Label>
    </h2>
    <p>
        <b>Treść zadania:</b><br />
        <asp:Label ID="TrescLabel" runat="server" Text="Brak treści"></asp:Label>
    </p>
    <table >
        <tr>
            <td>
                <b>Data otwarcia:</b>&nbsp<asp:Label ID="DataOtwarciaLabel" runat="server" Text="Brak"></asp:Label>
            </td>
            <td>
                <b>Data zamknięcia:</b>&nbsp<asp:Label ID="DataZamknieciaLabel" runat="server" Text="Brak"></asp:Label>
            </td>
        </tr>
    </table>
    <h3>
        Nadesłane rozwiązania:</h3>
    <asp:ListView ID="NadeslaneRozwiazaniaListView" runat="server" DataKeyNames="UserId"
        OnSelectedIndexChanging="WyborNadeslanegoZadania">
        <LayoutTemplate>
            <table id="itemPlaceholderContainer" class="tabela" runat="server" border="0" style="">
                <tr id="Tr1" runat="server" style="">
                    <th id="Th1" runat="server">
                        Student
                    </th>
                    <th id="Th2" runat="server">
                        Data nadesłania
                    </th>
                    <th id="Th3" runat="server">
                        Data sprawdzenia
                    </th>
                    <th id="Th4" runat="server">
                        Ocena
                    </th>
                </tr>
                <tr id="itemPlaceholder" runat="server">
                </tr>
            </table>
        </LayoutTemplate>
        <ItemTemplate>
            <tr runat="server">
                <td>
                    <asp:LinkButton ID="NazwaUrzytkownikaLabel" runat="server" Text='<%# Eval("UserName") %>'
                        CommandName="Select"></asp:LinkButton>
                </td>
                <td>
                    <asp:Label ID="DataNadeslaniaLabel" runat="server" Text='<%# Eval("DataNadeslania") %>'></asp:Label>
                </td>
                <td>
                    <asp:Label ID="DataSprawdzeniaLabel" runat="server" Text='<%# Eval("DataSprawdzenia") %>' />
                </td>
                <td>
                    <asp:Label ID="OcenaLabel" runat="server" Text='<%# Eval("Ocena") %>'></asp:Label>
                </td>
            </tr>
        </ItemTemplate>
        <EmptyDataTemplate>
            <table id="Table1" runat="server">
                <tr>
                    <td><p class="komunikat info">
                        Nie ma nadesłanych rozwiązań.</p>
                    </td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <SelectedItemTemplate>
            <tr runat="server" class="aktywne">
                <td>
                    <asp:LinkButton ID="NazwaUrzytkownikaLabel" runat="server" Text='<%# Eval("UserName") %>'
                        CommandName="Select"></asp:LinkButton>
                </td>
                <td>
                    <asp:Label ID="DataNadeslaniaLabel" runat="server" Text='<%# Eval("DataNadeslania") %>'></asp:Label>
                </td>
                <td>
                    <asp:Label ID="DataSprawdzeniaLabel" runat="server" Text='<%# Eval("DataSprawdzenia") %>' />
                </td>
                <td>
                    <asp:Label ID="OcenaLabel" runat="server" Text='<%# Eval("Ocena") %>'></asp:Label>
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:Label ID="KodProgramuLabel" runat="server" Text="" />
    <asp:Table ID="DaneWYTable" runat="server" Visible="false">
        <asp:TableHeaderRow>
            <asp:TableHeaderCell>
                Zestaw wyjściowy zadania
            </asp:TableHeaderCell>
            <asp:TableHeaderCell>
                Zestaw wyjściowy wygenerowany
            </asp:TableHeaderCell>
            <asp:TableHeaderCell>
                Czas wykonania w sek.
            </asp:TableHeaderCell>
        </asp:TableHeaderRow>
    </asp:Table>
    <script type="text/javascript">
         SyntaxHighlighter.all()
    </script>
</asp:Content>
