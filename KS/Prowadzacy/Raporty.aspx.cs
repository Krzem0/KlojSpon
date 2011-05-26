using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Prowadzacy_Raporty : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataClassesDataContext db = new DataClassesDataContext();
            PobierzGrupy(db);
            PobierzZadania(db);
            IleGrup();
            IleZadan();
        }
    }

    protected void PobierzGrupy(DataClassesDataContext db)
    {
        var querry = from g in db.Grupies
                     where g.IdWlasciciela == (Guid)Membership.GetUser().ProviderUserKey
                     select g;

        GrupyListView.DataSource = querry;
        GrupyListView.DataBind();
    }

    protected void IleGrup()
    {
        switch (GrupyListView.Items.Count)
        {
            case 1:
                Label1.Text = "Posiadasz tylko jedną grupę.";
                break;
            case 2:
            case 3:
            case 4:
                Label1.Text = "Posiadasz " + GrupyListView.Items.Count + " grupy.";
                break;
            default:
                Label1.Text = "Posiadasz " + GrupyListView.Items.Count + " grup.";
                break;
        }
    }

    protected void PobierzZadania(DataClassesDataContext db)
    {
        var querry = from z in db.Zadanias
                     where z.IdWlasciciela == (Guid)Membership.GetUser().ProviderUserKey
                     select z;

        ZadaniaListView.DataSource = querry;
        ZadaniaListView.DataBind();
    }

    protected void IleZadan()
    {
        switch (ZadaniaListView.Items.Count)
        {
            case 1:
                Label2.Text = "Dodałeś tylko jedne zadanie.";
                break;
            case 2:
            case 3:
            case 4:
                Label2.Text = "Dodałeś razem " + ZadaniaListView.Items.Count + " zadania.";
                break;
            default:
                Label2.Text = "Dodałeś razem " + ZadaniaListView.Items.Count + " zadań.";
                break;
        }
    }

    protected void GrupySelectedIndexChanging(object sender, ListViewSelectEventArgs e)
    {
        Session["IdGrupy"] = GrupyListView.DataKeys[e.NewSelectedIndex].Value;
        Response.Redirect(@"~/Prowadzacy/RaportGrupowy.aspx");
    }
}