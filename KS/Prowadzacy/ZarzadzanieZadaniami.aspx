<%@ Page Title="Zarządzanie zadaniami" Language="C#" MasterPageFile="~/MasterPage.master"
    AutoEventWireup="true" CodeFile="ZarzadzanieZadaniami.aspx.cs" Inherits="Prowadzacy_ZarzadzanieZadaniami" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>
        Zarządzanie zadaniami</h1>
    <h3>
        Lista zadań</h3>
    <asp:ListView runat="server" ID="ZadanieListView" DataKeyNames="IdZadania" OnSelectedIndexChanging="ZadanieListView_SelectedIndexChanging">
        <LayoutTemplate>
            <table class="tabela" id="itemPlaceholderContainer" runat="server" border="0">
                <tr id="Tr1" runat="server" style="">
                    <th id="Th1" runat="server">
                        Tytuł
                    </th>
                    <th id="Th2" runat="server">
                        Data otwarcia
                    </th>
                    <th>
                        Data zamkniecia
                    </th>
                </tr>
                <tr id="itemPlaceholder" runat="server">
                </tr>
            </table>
        </LayoutTemplate>
        <ItemTemplate>
            <tr style="">
                <td>
                    <asp:LinkButton ID="NazwaLinkButton" runat="server" Text='<%# Eval("Tytul") %>'
                        CommandName="Select"></asp:LinkButton>
                </td>
                <td>
                    <asp:Label ID="DataOtwarciaLabel" runat="server" Text='<%# Eval("DataOtwarcia") %>' />
                </td>
                <td>
                    <asp:Label ID="DataZamknieciaLabel" runat="server" Text='<%# Eval("DataZamkniecia") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <EmptyDataTemplate>
            <table id="Table1" runat="server">
                <tr>
                    <td><p class="komunikat info">
                        Nie masz dodanych żadnych zadań.</p>
                    </td>
                </tr>
            </table>
        </EmptyDataTemplate>
    </asp:ListView>
    <a href="DodajZadanie.aspx" class="button"><span>Dodaj zadanie</span></a>
</asp:Content>
