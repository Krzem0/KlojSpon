<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Ranking.aspx.cs" Inherits="Ranking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h1>Ranking</h1>
    <asp:Table ID="RankingTable" runat="server" CssClass="tabela">
    <asp:TableHeaderRow>
    <asp:TableHeaderCell>Lp.</asp:TableHeaderCell>
    <asp:TableHeaderCell>Tytuł zadania</asp:TableHeaderCell>
    <asp:TableHeaderCell>Student</asp:TableHeaderCell>
    <asp:TableHeaderCell>Ocena</asp:TableHeaderCell>
    <asp:TableHeaderCell>Data nadesłania</asp:TableHeaderCell>
    </asp:TableHeaderRow>
    </asp:Table>
</asp:Content>

