﻿<%@ Page Title="Wybrana grupa" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Grupa.aspx.cs" Inherits="Prowadzacy_Grupa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>
        <asp:Label ID="GroupNameLabel" runat="server" Text=""></asp:Label></h1>
    <p>
        <asp:Label ID="DescriptionLabel" runat="server" Text="Label"></asp:Label></p>
    <h3>
        Lista członków</h3>
    <asp:ListView ID="StudentsInGroupList" runat="server" DataKeyNames="UserId">
        <ItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="NazwaLabel" runat="server" Text='<%# Eval("UserName") %>' />
                </td>
                <td>
                    <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                </td>
                <td>
                    <asp:Label ID="SurnameLabel" runat="server" Text='<%# Eval("Surname") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <EmptyDataTemplate>
            <table id="Table1" runat="server">
                <tr>
                    <td><p class="komunikat info">
                        Brak członków grupy.</p>
                    </td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <LayoutTemplate>
            <table id="itemPlaceholderContainer" runat="server" class="tabela" border="0" style="">
                <tr id="Tr2" runat="server" style="">
                    <th id="Th1" runat="server">
                        Nazwa Użytkownika
                    </th>
                    <th id="Th2" runat="server">
                        Imię
                    </th>
                    <th id="Th3" runat="server">
                        Nazwisko
                    </th>
                </tr>
                <tr id="itemPlaceholder" runat="server">
                </tr>
            </table>
        </LayoutTemplate>
    </asp:ListView>
    <br />
    <h3>
        Dodawanie osób do grupy</h3>
    <%--<a href="">Dodaj użytkownika/ów do grupy</a><br />--%>
    <asp:Label ID="AddLabel" runat="server" Text="<p>Podaj nazwę użytkownika, którego chcesz dodać:</p>"></asp:Label>
    <asp:TextBox ID="AddTextBox" runat="server"></asp:TextBox>
    <asp:Button ID="AddButton" runat="server" Text="Dodaj do grupy" OnClick="AddButton_Click" />
    <asp:Label ID="GroupNameExistLabel" runat="server" Visible="False"></asp:Label>
    
    <asp:ListView ID="EnableStudentsList" runat="server" DataKeyNames="UserId">
        <ItemTemplate>
            <tr style="">
                <td>
                    <asp:CheckBox ID="CheckBox1" runat="server" Text='<%# Eval("UserName") %>' TextAlign="Right"/>
                </td>
                <td>
                    <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                </td>
                <td>
                    <asp:Label ID="SurnameLabel" runat="server" Text='<%# Eval("Surname") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <EmptyDataTemplate>
            <table id="Table1" runat="server">
                <tr>
                    <td><p class="komunikat info">
                        Brak studentów, którzy nie są przypisani do żadnej grupy.</p>
                    </td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <LayoutTemplate>
            <table class="tabela" id="itemPlaceholderContainer" runat="server" border="0" style="">
                <tr id="Tr2" runat="server" style="">
                    <th id="Th1" runat="server">
                        Nazwa Użytkownika
                    </th>
                    <th id="Th2" runat="server">
                        Imię
                    </th>
                    <th id="Th3" runat="server">
                        Nazwisko
                    </th>
                </tr>
                <tr id="itemPlaceholder" runat="server">
                </tr>
            </table>
        </LayoutTemplate>
    </asp:ListView>
    <br />
    <asp:Button ID="AddCheckedButton" runat="server" Text="Dodaj zaznaczone" OnClick="AddCheckedButton_Click" />
</asp:Content>
