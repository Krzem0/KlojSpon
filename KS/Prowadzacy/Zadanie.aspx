<%@ Page Title="Zadanie" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Zadanie.aspx.cs" Inherits="Prowadzacy_Zadanie" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>
        <asp:Label ID="ExcrciseLabel" runat="server" Text=""></asp:Label></h1>
    <p>
        <asp:Label ID="DescriptionLabel" runat="server" Text=""></asp:Label></p>
    <p>
        Data rozpoczęcia:
        <asp:Label ID="StartDateLabel" runat="server" Text=""></asp:Label><br />
        Data zakończenia:
        <asp:Label ID="EndDateLabel" runat="server" Text=""></asp:Label></p>
        <asp:Label ID="SuccesLabel" runat="server" Text=""></asp:Label>
    <h3>
        Dodawanie zadania do grup</h3>
        <p>Zaznacz grupy, do których chcesz przydzielić wybrane zadanie.</p>
    <asp:ListView ID="EnableGroupsListView" runat="server" DataKeyNames="IdGrupy">
    <LayoutTemplate>
     <table id="itemPlaceholderContainer" runat="server">
                <tr id="Tr1" runat="server" style="">
                    <th id="Th1" runat="server">
                        Nazwa grupy
                    </th>
                    <th id="Th2" runat="server">
                        DataUtworzenia
                    </th>
                </tr>
                <tr id="itemPlaceholder" runat="server">
                </tr>
            </table>
    </LayoutTemplate>
    <ItemTemplate>
     <tr style="">
                <td>
                    <asp:CheckBox ID="NazwaCheckBox" runat="server" Text='<%# Eval("Nazwa") %>'/>
                </td>
                <td>
                    <asp:Label ID="DataUtworzeniaLabel" runat="server" Text='<%# Eval("DataUtworzenia") %>' />
                </td>
            </tr>
    </ItemTemplate>
    <EmptyDataTemplate>
            <table id="Table1" runat="server">
                <tr>
                    <td>
                        Nie ma grupy, którą możesz dodać.
                    </td>
                </tr>
            </table>
        </EmptyDataTemplate>
    </asp:ListView>
    <asp:Button ID="PrzydzielZadanieButton" runat="server" Text="Przydziel zadanie" 
        onclick="PrzydzielZadanieButton_Click" />
</asp:Content>
