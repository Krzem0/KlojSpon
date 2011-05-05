<%@ Page Title="Dodaj zadanie" Language="C#" MasterPageFile="~/MasterPage.master"
    AutoEventWireup="true" CodeFile="DodajZadanie.aspx.cs" Inherits="Prowadzacy_DodajZadanie" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link type="text/css" href="../Scripts/ui-lightness/jquery-ui-1.8.11.custom.css"
        rel="stylesheet" />
    <script type="text/javascript" src="../Scripts/jquery-1.5.1.min.js"></script>
    <script type="text/javascript" src="../Scripts/jquery.ui.core.js"></script>
    <script type="text/javascript" src="../Scripts/jquery-ui-1.8.11.custom.min.js"></script>
    <script type="text/javascript" src="../Scripts/jquery-ui-timepicker-addon.js"></script>
    <script type="text/javascript">
        $(function () {
            $('#ctl00_ContentPlaceHolder1_DataOtwarciaTextBox').datetimepicker({
                dateFormat: 'yy-mm-dd',
                timeFormat: 'hh:mm:ss',
                separator: ' @ ',
                stepMinute: 5,
                onSelect: function (inst) {
                    $('#ctl00_ContentPlaceHolder1_DataZamknieciaTextBox').datetimepicker('option', 'minDate', this.value);
                    $('#ctl00_ContentPlaceHolder1_DataZamknieciaTextBox').datetimepicker('option', 'minTime', this.time);
                }
            });
            $('#ctl00_ContentPlaceHolder1_DataZamknieciaTextBox').datetimepicker({
                dateFormat: 'yy-mm-dd',
                timeFormat: 'hh:mm:ss',
                separator: ' @ ',
                stepMinute: 5
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <p>
        <asp:Label ID="SuccesLabel" runat="server" ForeColor="#00CC00"></asp:Label></p>
    <p>
        Tytuł:
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Podaj tytuł"
            Text="*" ControlToValidate="TytulTextBox"></asp:RequiredFieldValidator>
        <asp:TextBox ID="TytulTextBox" runat="server"></asp:TextBox></p>
    <p>
        Opis (treść) zadania:
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Podaj opis"
            Text="*" ControlToValidate="OpisTextBox"></asp:RequiredFieldValidator></p>
        <asp:TextBox ID="OpisTextBox" runat="server" Height="183px" TextMode="MultiLine"
            Width="432px"></asp:TextBox>
    <p>
        Data otwarcia:
        <asp:TextBox ID="DataOtwarciaTextBox" runat="server" Height="19px" Width="130px"
            MaxLength="19"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Wprowadź poprawny format daty otwarcia"
            Text="*" ControlToValidate="DataOtwarciaTextBox" ValidationExpression="^(19|20)\d\d[- /.](0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])[ ](0[1-9]|1[0-9]|2[0-3])[:]([0-5][0-9])[:]([0-5][0-9])$">
        </asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Wprowadź datę otwarcia"
            Text="*" ControlToValidate="DataOtwarciaTextBox">
        </asp:RequiredFieldValidator>
        Data zamknięcia:
        <asp:TextBox ID="DataZamknieciaTextBox" runat="server" Height="19px" Width="130px"
            MaxLength="19"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Wprowadź poprawny format daty zamknięcia"
            Text="*" ControlToValidate="DataZamknieciaTextBox" ValidationExpression="^(19|20)\d\d[- /.](0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])[ ](0[1-9]|1[0-9]|2[0-3])[:]([0-5][0-9])[:]([0-5][0-9])$">
        </asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Wprowadź datę zamknięcia"
            Text="*" ControlToValidate="DataZamknieciaTextBox">
        </asp:RequiredFieldValidator>
    <div class="blok1-2"><p>
        Dane wejściowe:
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Podaj dane wejściowe"
            Text="*" ControlToValidate="DaneWeTextBox">
        </asp:RequiredFieldValidator></p>
        
       <p> <span class="opis">Po jednym zestawie danych wejściowych w jednym wierszu. Wartości oddzielone pojedynczym białym znakiem.</span></p>
        <asp:TextBox ID="DaneWeTextBox" runat="server" Height="113px" TextMode="MultiLine"
            Width="205px"></asp:TextBox></div>
       <div class="blok1-2"><p>
        Dane wyjściowe:
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Podaj dane wyjściowe"
            Text="*" ControlToValidate="DaneWyTextBox">
        </asp:RequiredFieldValidator>
        </p><p>
        <span class="opis">Każdy zestaw wartości w kolejnym wierszu, odpowiadającym zestawowi wejściowemu.</span></p>
        <asp:TextBox ID="DaneWyTextBox" runat="server" Height="106px" TextMode="MultiLine"
            Width="204px"></asp:TextBox></div>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
    <asp:Button ID="WyslijButton" runat="server" Text="Dodaj zadanie" OnClick="WyslijButton_Click" />
</asp:Content>
