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

        // Chyba działa xD
        var querry = from grupy in db.Grupies
                     where !(from zadaniaWgrupach in db.ZadaniawGrupaches
                             where zadaniaWgrupach.IdZadania == (int)((DataKey)Session["IdZadania"]).Value
                             select zadaniaWgrupach.IdGrupy).Contains(grupy.IdGrupy)
                         &&
                     grupy.IdWlasciciela == (Guid)Membership.GetUser().ProviderUserKey
                     select new { grupy.IdGrupy, grupy.Nazwa, grupy.DataUtworzenia };

        EnableGroupsListView.DataSource = querry;
        EnableGroupsListView.DataBind();
    }

    protected void PrzydzielZadanieButton_Click(object sender, EventArgs e)
    {
        List<int> idGrupList = new List<int>();
        for (int i = 0; i < EnableGroupsListView.Items.Count; i++)
        {
            CheckBox chk = EnableGroupsListView.Items[i].FindControl("NazwaCheckBox") as CheckBox;
            if (chk != null && chk.Checked)
            {
                idGrupList.Add((int)EnableGroupsListView.DataKeys[i].Value);
            }
        }

        DataClassesDataContext db = new DataClassesDataContext();
        Zadania zadanie = db.Zadanias.FirstOrDefault(g => g.IdZadania == (int)((DataKey)Session["IdZadania"]).Value);
        foreach (int id in idGrupList)
        {
            ZadaniawGrupach zadaniawGrupach = new ZadaniawGrupach
                                                  {
                                                      Zadania = zadanie,
                                                      IdGrupy = id,
                                                      DataDodania = DateTime.Now
                                                  };
            db.ZadaniawGrupaches.InsertOnSubmit(zadaniawGrupach);
        }
        db.SubmitChanges();
        WczytajListeGrup(db);
        SuccesLabel.Text = "Dodano zadanie do grup/y";
        SuccesLabel.ForeColor = System.Drawing.Color.Green;
    }
}