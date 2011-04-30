<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Cos.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="ExecuteLabel" runat="server" Text="Label" />
        <p>
            <asp:Button ID="ExecuteButton" runat="server" Text="Execute" OnClick="ExecuteButton_Click" /></p>
        <p>
            <asp:TextBox ID="TextBox1" runat="server" Height="177px" TextMode="MultiLine" Width="304px"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="Zapisz" OnClick="Button1_Click" /></p>
        <p>
            <asp:Button ID="Button2" runat="server" Text="Button" OnClick="Button2_Click" /><asp:Label
                ID="TestowyLabel" runat="server" Text=""></asp:Label></p>
    </div>
    </form>
</body>
</html>
