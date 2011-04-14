using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Prowadzacy_Zadanie : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataClassesDataContext db = new DataClassesDataContext();
            Zadania zadanie = db.Zadanias.First(z => z.IdZadania == (int)((DataKey)Session["IdZadania"]).Value);
            ExcrciseLabel.Text = zadanie.Tytul;
            DescriptionLabel.Text = zadanie.Opis;
            StartDateLabel.Text = zadanie.DataOtwarcia.ToLongDateString();
            EndDateLabel.Text = zadanie.DataZamkniecia.ToLongDateString();

            WczytajListeGrup(db);
        }
    }

    private void WczytajListeGrup(DataClassesDataContext db)
    {
        // Napsiać zapytanie które wyciąga zadania

        //ZadaniawGrupach zadaniawGrupach = new ZadaniawGrupach()
        //                                      {
                                                  
        //                                      };
        var querry = from grupy in db.Grupies
                     join zadaniaWgrupach in db.ZadaniawGrupaches on grupy.IdGrupy equals zadaniaWgrupach.IdGrupy
                     //where grupy.IdWlasciciela == (Guid)Membership.GetUser().ProviderUserKey
                     where zadaniaWgrupach.IdZadania != (int)((DataKey)Session["IdZadania"]).Value
                           &&
                           zadaniaWgrupach.IdGrupy != grupy.IdGrupy
                     select new { grupy.IdGrupy, grupy.Nazwa, grupy.DataUtworzenia };


        EnableGroupsListView.DataSource = querry;
        EnableGroupsListView.DataBind();
    }
}