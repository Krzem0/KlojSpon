using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Prowadzacy_TwożenieKont : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void CreateAccountButton_Click(object sender, EventArgs e)
    {
        string exceptions = "";
        string[] loginyIhasla = Regex.Split(LoginsTextBox.Text, @"\r\n");
        foreach (var s in loginyIhasla)
        {
            string[] daneKonta = Regex.Split(s, @"\s");
            if (daneKonta.Length == 2)
            {
                try
                {
                    Membership.CreateUser(daneKonta[0], daneKonta[1]);
                    Roles.AddUserToRole(daneKonta[0],"Student");
                }
                catch (Exception exception)
                {
                    ResoultsLabel.Text += "Nastąpił wyjątek: " + exception.Message + "</br>";
                }
            }
            else
            {
                foreach (var s1 in daneKonta)
                {
                    exceptions += s1 + " ";
                }
                exceptions += "</br>";
            }
        }
        ResoultsLabel.ForeColor = System.Drawing.Color.Red;
        if (exceptions != "")
            ResoultsLabel.Text += "Nie udało sie utworzyć następujących kont:</br>" + exceptions;

        if (ResoultsLabel.Text != "") ResoultsLabel.Visible = true;
        else
        {
            ResoultsLabel.ForeColor = System.Drawing.Color.Green;
            ResoultsLabel.Text = "Wszystkie konta zostały utworzone pomyślnie";
            ResoultsLabel.Visible = true;
        }
    }
}