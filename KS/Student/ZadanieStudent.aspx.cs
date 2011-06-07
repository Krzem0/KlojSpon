using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Student_ZadanieStudent : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataClassesDataContext db = new DataClassesDataContext();
            WczytajZadanie(db);
            WczytajOcene(db);
        }
    }

    private void WczytajZadanie(DataClassesDataContext db)
    {
        Zadania zadanie = db.Zadanias.FirstOrDefault(z => z.IdZadania == (int)Session["IdZadania"]);
        TytulLabel.Text = zadanie.Tytul;
        OpisLabel.Text = zadanie.Opis;
        DataLabel.Text = "Data otwarcia: " + zadanie.DataOtwarcia.ToLocalTime() + " Data zamkniecia: " +
                         zadanie.DataZamkniecia.ToLocalTime();
    }

    private void WczytajOcene(DataClassesDataContext db)
    {
        NadeslaneZadania nadeslaneZadania = null;
        try
        {
            nadeslaneZadania = db.NadeslaneZadanias.First(z => z.IdStudenta == (Guid)Membership.GetUser().ProviderUserKey
                                                                 && z.IdZadania == (int)Session["IdZadania"]);
        }
        catch (Exception)
        {
        }
        if (nadeslaneZadania != null)
        {
            if (nadeslaneZadania.Ocena != null)
                OcenaLabel.Text = string.Format("Twoja ocena za to zadanie to: {0:0}%",nadeslaneZadania.Ocena*100);
            else OcenaLabel.Text = "To zadanie nie zostało jeszcze ocenione";
        }
        else
        {
            OcenaLabel.Text = "Nie wysłano jeszcze rozwiązania do tego zadania. ";
            WyslijZadanieHyperLink.Visible = true;
        }
    }
}