﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Student_ZglosZadanie : System.Web.UI.Page
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
                            &&
                            !(from nadZad in db.NadeslaneZadanias
                             where nadZad.IdStudenta == (Guid)Membership.GetUser().ProviderUserKey
                             select nadZad.IdZadania).Contains(zadania.IdZadania)
                     select zadania;

        ZadaniaDropDownList.DataSource = querry;
        ZadaniaDropDownList.DataBind();
        EventArgs e = new EventArgs();
        ZadaniaDropDownList_SelectedIndexChanged(ZadaniaDropDownList, e);
    }
    protected void ZadaniaDropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ZadaniaDropDownList.SelectedItem != null)
        {
            DataClassesDataContext db = new DataClassesDataContext();
            int id;
            int.TryParse(ZadaniaDropDownList.SelectedItem.Value, out id);
            Zadania zadanie = db.Zadanias.FirstOrDefault(z => z.IdZadania == id);
            Session["Zadanie"] = zadanie;
            OpisZadaniaLabel.Text = "Opis:\n" + zadanie.Opis;
            DatyLabel.Text = "Data otwarcia: " + zadanie.DataOtwarcia.ToLocalTime() + " Data zamknięcia: " +
                             zadanie.DataZamkniecia.ToLocalTime();
        }
        else OpisZadaniaLabel.Text = "Nie ma żadnych zadań do których można nadesłać rozwiązanie.";
    }
}