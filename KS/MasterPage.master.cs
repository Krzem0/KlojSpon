using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        MembershipUser user = Membership.GetUser();
        if (user != null)
        {
            Login1.Visible = false;
            LoginStatus1.Visible = true;
            Label1.Text = "<h2>Twoje konto</h2><p>Jesteś zalogowany jako: </p>";
            TwojeKontoLabel.Visible = true;
            if (Roles.IsUserInRole("Prowadzacy"))
            {
                MenuProwadzacy.Visible = true;
            }
            else if (Roles.IsUserInRole("Student"))
            {
                MenuStudent.Visible = true;
            }
            else
            {
                MenuOgolne.Visible = true;
            }
        }
        WczytajStatystyki();
    }

    protected void WczytajStatystyki()
    {
        DataClassesDataContext db = new DataClassesDataContext();

        int liczbaWszystkichZadan = db.Zadanias.Count();
        LiczbaWszystkichZadanLabel.Text = liczbaWszystkichZadan.ToString();

        var querry = from n in db.NadeslaneZadanias
                     where n.Ocena != null
                     select n;
        LiczbaNadeslanychZadanLabel.Text = querry.Count().ToString();

        float skutecznosc = 0;
        foreach (var nadeslaneZadania in querry)
        {
            skutecznosc += (float)nadeslaneZadania.Ocena;
        }
        if (querry.Count() != 0)
        {
            skutecznosc /= querry.Count();
        }
        SkutecznoscLabel.Text = string.Format("{0:0}%", skutecznosc*100);
    }
}
