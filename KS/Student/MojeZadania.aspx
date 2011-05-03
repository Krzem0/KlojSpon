<%@ Page Title="Moje zadania" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MojeZadania.aspx.cs" Inherits="Student_MojeZadania" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ListView ID="MojeZadaniaListView" runat="server" DataKeyNames="IdZadania" OnSelectedIndexChanging="MojeZadaniaListView_SelectedIndexChanging">
    <LayoutTemplate>
     <table id="itemPlaceholderContainer" runat="server">
                <tr id="Tr1" runat="server" style="">
                    <th id="Th1" runat="server">
                        Tytuł zadania
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
     <tr style="">
                <td>
                    <asp:LinkButton ID="NazwaLinkButton" runat="server" Text='<%# Eval("Tytul") %>' CommandName="select"/>
                </td>
                <td>
                    <asp:Label ID="DataUtworzeniaLabel" runat="server" Text='<%# Eval("DataOtwarcia") %>' />
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
                        Nie ma żadnego zadania.
                    </td>
                </tr>
            </table>
        </EmptyDataTemplate>
    </asp:ListView>
</asp:Content>

