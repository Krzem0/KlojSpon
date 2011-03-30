<%@ Page Title="Wybrana grupa" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Grupa.aspx.cs" Inherits="Prowadzacy_Grupa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>
        <asp:Label ID="GroupNameLabel" runat="server" Text=""></asp:Label></h1>
    <p>
        utworzona: 12.03.11 przez: Roman Stefański</p>
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
                    <td>
                        Brak członków grupy.
                    </td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <LayoutTemplate>
            <table id="itemPlaceholderContainer" runat="server" border="0" style="">
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
    <%--<a href="">Dodaj użytkownika/ów do grupy</a><br />--%>
    Podaj nazwę użytkownika, którego chcesz dodać:
    <asp:TextBox ID="AddTextBox" runat="server"></asp:TextBox>
    <asp:Button ID="AddButton" runat="server" Text="Dodaj do grupy" OnClick="AddButton_Click" /><br />
    <asp:Label ID="GroupNameExistLabel" runat="server" Visible="False"></asp:Label>
    <br />
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
                    <td>
                        Brak wolnych studentów.
                    </td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <LayoutTemplate>
            <table id="itemPlaceholderContainer" runat="server" border="0" style="">
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
