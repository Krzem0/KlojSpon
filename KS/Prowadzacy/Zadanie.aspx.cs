using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
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
        }
    }
}