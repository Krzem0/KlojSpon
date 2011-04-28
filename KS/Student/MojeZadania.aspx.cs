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
                            where stdWgru.IdStudenta == (Guid) Membership.GetUser().ProviderUserKey
                            select stdWgru.IdGrupy).Contains(zadWgr.IdGrupy)
                     select zadania;
        MojeZadaniaListView.DataSource = querry;
        MojeZadaniaListView.DataBind();
    }

    protected void MojeZadaniaListView_SelectedIndexChanging(object sender, ListViewSelectEventArgs e)
    {
        Session["IdZadania"] = MojeZadaniaListView.DataKeys[e.NewSelectedIndex].Value;
        Response.Redirect("~/Student/ZadanieStudent.aspx");
    }
}