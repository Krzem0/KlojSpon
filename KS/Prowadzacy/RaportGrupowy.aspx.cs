using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Prowadzacy_RaportGrupowy : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack && Session["IdGrupy"] != null)
        {
            DataClassesDataContext db = new DataClassesDataContext();
            Wczytaj(db);
            StudenciWGrupie(db);
            ZadaniaWGrupie(db);
        }
    }

    protected void Wczytaj(DataClassesDataContext db)
    {
        Grupy grupa = db.Grupies.First(z => z.IdGrupy == (int)Session["IdGrupy"]);
        NazwaGrupyLabel.Text = grupa.Nazwa;
    }

    protected void StudenciWGrupie(DataClassesDataContext db)
    {
        var querry = from u in db.aspnet_Users
                     join sWg in db.StudenciWGrupaches on u.UserId equals sWg.IdStudenta
                     where sWg.IdGrupy == (int)Session["IdGrupy"]
                     select new { u.UserId, u.UserName, sWg.DataDodania };

        StudenciWGrupieListView.DataSource = querry;
        StudenciWGrupieListView.DataBind();
    }

    protected void ZadaniaWGrupie(DataClassesDataContext db)
    {
        var querry = from z in db.Zadanias
                     join zWg in db.ZadaniawGrupaches on z.IdZadania equals zWg.IdZadania
                     where zWg.IdGrupy == (int)Session["IdGrupy"]
                     select z;

        ZadaniaWGrupieListView.DataSource = querry;
        ZadaniaWGrupieListView.DataBind();
    }

    protected void ZadanieIndexChanging(object sender, ListViewSelectEventArgs e)
    {
        Session["IdZadania"] = ZadaniaWGrupieListView.DataKeys[e.NewSelectedIndex].Value;
        Response.Redirect(@"~/Prowadzacy/RaportZadanieWGrupie.aspx");
    }
}