using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Prowadzacy_ZarzadzanieZadaniami : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataClassesDataContext db = new DataClassesDataContext();
        WczytajListeZadan(db);
    }

    private void WczytajListeZadan(DataClassesDataContext db)
    {
        var querry = from zadania in db.Zadanias
                     where zadania.IdWlasciciela == (Guid)Membership.GetUser().ProviderUserKey
                     select zadania;
        ZadanieListView.DataSource = querry;
        ZadanieListView.DataBind();
    }

    protected void ZadanieListView_SelectedIndexChanging(object sender, ListViewSelectEventArgs e)
    {
        Session["IdZadania"] = ZadanieListView.DataKeys[e.NewSelectedIndex];
        Response.Redirect(@"Zadanie.aspx");
    }
}