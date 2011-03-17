<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ZarzadzanieGrupami.aspx.cs" Inherits="Prowadzący_ZarzadzanieGrupami" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h1>Zarządzanie grupami</h1>
<h3>Lista grup</h3>
<table class="lista">
    <thead>
        <tr>
            <th>id</th>
            <th>nazwa grupy</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td align="center">1.</td>
            <td><a href="">II rok IOG, gr I</a></td>
        </tr>
        <tr>
            <td align="center">2.</td>
            <td><a href="">II rok IOG, gr II</a></td>
        </tr>
        <tr>
            <td align="center">3.</td>
            <td><a href="">III rok IOG, gr I</a></td>
        </tr>
        <tr>
            <td align="center">4.</td>
            <td><a href="">III rok IOG, gr II</a></td>
        </tr>
    </tbody>
</table>
<h3>Dodawanie grupy</h3>
<form>
<label>Nazwa grupy: <input type="text" /><input type="submit" /></label>

<h1>Grupa III rok IOG, gr I</h1>
<p>utworzona: 12.03.11 przez: Roman Stefański</p>
<h3>Lista członków</h3>
<table class="lista">
    <thead>
        <tr>
            <th>id</th>
            <th>imię i nazwisko</th>
            <th>nr indeksu</th>
            <th>&nbsp</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td align="center">1.</td>
            <td><a href="">Zbysław Jakotaki</a></td>
            <td align="center">564331</td>
            <td><a href="">usuń</a></td>
        </tr>
        <tr>
            <td align="center">2.</td>
            <td><a href="">Jan Kowalikowski</a></td>
            <td align="center">563331</td>
            <td><a href="">usuń</a></td>
        </tr>
        <tr>
            <td align="center">3.</td>
            <td><a href="">Ktoś Jeszcze</a></td>
            <td align="center">164331</td>
            <td><a href="">usuń</a></td>
        </tr>
    </tbody>
</table>

<a href="">Dodaj użytkownika/ów do grupy</a>

</form>
</asp:Content>

