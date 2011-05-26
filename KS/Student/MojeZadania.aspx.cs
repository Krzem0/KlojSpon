using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Student_MojeZadania : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataClassesDataContext db = new DataClassesDataContext();
            WczytajListeZadan(db);
        }
    }

    private void WczytajListeZadan(DataClassesDataContext db)
    {
        var querry = from zadania in db.Zadanias
                     join zadWgr in db.ZadaniawGrupaches on zadania.IdZadania equals zadWgr.IdZadania
                     where (from stdWgru in db.StudenciWGrupaches
                            where stdWgru.IdStudenta == (Guid)Membership.GetUser().ProviderUserKey
                            select stdWgru.IdGrupy).Contains(zadWgr.IdGrupy)
                     select zadania;

        MojeZadaniaListView.DataSource = querry;
        MojeZadaniaListView.DataBind();

        WczytajStatus(db);
    }

    protected void WczytajStatus(DataClassesDataContext db)
    {
        for (int i = 0; i < MojeZadaniaListView.DataKeys.Count; i++)
        {
            NadeslaneZadania nadeslaneZadania = null;
            try
            {
                nadeslaneZadania = db.NadeslaneZadanias.First(z => z.IdStudenta == (Guid)Membership.GetUser().ProviderUserKey
                                                                   && z.IdZadania == (int)MojeZadaniaListView.DataKeys[i].Value);
            }
            catch (Exception)
            {
            }
            if (nadeslaneZadania != null)
            {
                if (nadeslaneZadania.Ocena != null)
                    ((Label)MojeZadaniaListView.Items[i].FindControl("OcenaLabel")).Text =
                        string.Format("Ocena {0}%", nadeslaneZadania.Ocena * 100);
                else
                    ((Label)MojeZadaniaListView.Items[i].FindControl("OcenaLabel")).Text = "Nie ocenione";
            }
            else
            {
                ((Label)MojeZadaniaListView.Items[i].FindControl("OcenaLabel")).Text = "Nie nadesłane";
            }
        }
    }

    protected void MojeZadaniaListView_SelectedIndexChanging(object sender, ListViewSelectEventArgs e)
    {
        Session["IdZadania"] = MojeZadaniaListView.DataKeys[e.NewSelectedIndex].Value;
        Response.Redirect("~/Student/ZadanieStudent.aspx");
    }
}