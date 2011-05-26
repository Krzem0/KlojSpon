<%@ Page Title="Raporty" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Raporty.aspx.cs" Inherits="Prowadzacy_Raporty" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>
        Raporty</h1>
        <h2>Twoje grupy</h2>
        <asp:ListView ID="GrupyListView" runat="server" EnableModelValidation="True" DataKeyNames="IdGrupy" 
        OnSelectedIndexChanging="GrupySelectedIndexChanging">
        <EmptyDataTemplate>
            <table id="Table1" runat="server">
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
                    <asp:LinkButton ID="NazwaLinkButton" runat="server" CommandName="Select"
                        Text='<%# Eval("Nazwa") %>'></asp:LinkButton>
                </td>
                <td>
                    <asp:Label ID="DataUtworzeniaLabel" runat="server" Text='<%# Eval("DataUtworzenia") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                <tr id="Tr1" runat="server" style="">
                    <th id="Th1" runat="server">
                        Nazwa
                    </th>
                    <th id="Th2" runat="server">
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
    <p>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </p>
    <h2>Twoje zadania</h2>
    <asp:ListView runat="server" ID="ZadaniaListView" DataKeyNames="IdZadania">
        <LayoutTemplate>
            <table id="itemPlaceholderContainer" runat="server" border="0" style="">
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
                    <asp:Label ID="NazwaLabel" runat="server" Text='<%# Eval("Tytul") %>'
                        ></asp:Label>
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
                    <td>
                        Nie masz dodanych żadnych zadań.
                    </td>
                </tr>
            </table>
        </EmptyDataTemplate>
    </asp:ListView>
    <p>
        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
    </p>
</asp:Content>
