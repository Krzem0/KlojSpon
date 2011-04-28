using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Student_ZadanieStudent : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataClassesDataContext db = new DataClassesDataContext();
            Zadania zadanie = db.Zadanias.FirstOrDefault(z => z.IdZadania == (int)Session["IdZadania"]);
            TytulLabel.Text = zadanie.Tytul;
            OpisLabel.Text = zadanie.Opis;
            DataLabel.Text = "Data otwarcia: " + zadanie.DataOtwarcia.ToLocalTime() + " Data zamkniecia: " +
                             zadanie.DataZamkniecia.ToLocalTime();
        }
    }
}