using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Prowadzacy_RaportZadanieWGrupie : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack && Session["IdZadania"] != null && Session["IdGrupy"] != null)
        {
            DataClassesDataContext db = new DataClassesDataContext();
            WczytajNazwe(db);
            WczytajListeNadeslanych(db);
        }
    }

    protected void WczytajNazwe(DataClassesDataContext db)
    {
        Zadania zadanie = db.Zadanias.First(z => z.IdZadania == (int)Session["IdZadania"]);
        NazwaZadaniaLabel.Text = zadanie.Tytul;
        TrescLabel.Text = zadanie.Opis;
        DataOtwarciaLabel.Text = zadanie.DataOtwarcia.ToLongTimeString() + " " + zadanie.DataOtwarcia.ToLongDateString();
        DataZamknieciaLabel.Text = zadanie.DataZamkniecia.ToLongTimeString() + " " + zadanie.DataZamkniecia.ToLongDateString();
    }

    protected void WczytajListeNadeslanych(DataClassesDataContext db)
    {
        var querry = from zWg in db.ZadaniawGrupaches
                     join n in db.NadeslaneZadanias on zWg.IdZadania equals n.IdZadania
                     join u in db.aspnet_Users on n.IdStudenta equals u.UserId
                     where n.IdZadania == (int) Session["IdZadania"] && zWg.IdGrupy == (int) Session["IdGrupy"]
                     select new {n.Ocena, u.UserName, u.UserId};

        NadeslaneRozwiazaniaListView.DataSource = querry;
        NadeslaneRozwiazaniaListView.DataBind();
    }
}