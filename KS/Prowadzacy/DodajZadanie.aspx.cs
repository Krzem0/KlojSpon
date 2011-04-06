using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Prowadzacy_DodajZadanie : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataZamknieciaTextBox.Text = "rrrr-mm-dd";
            DataOtwarciaTextBox.Text = "rrrr-mm-dd";
        }
    }
    protected void WyslijButton_Click(object sender, EventArgs e)
    {
        DataClassesDataContext db = new DataClassesDataContext();
        Regex regex = new Regex(@"(-)|(\.)");

        string[] data = regex.Split(DataOtwarciaTextBox.Text);

        int year, month, day;
        int.TryParse(data[0], out year);
        int.TryParse(data[2], out month);
        int.TryParse(data[4], out day);
        DateTime dataOtwarcia = new DateTime(year,month,day);

        data = regex.Split(DataZamknieciaTextBox.Text);
        int.TryParse(data[0], out year);
        int.TryParse(data[2], out month);
        int.TryParse(data[4], out day);
        DateTime dataZamkniecia = new DateTime(year,month,day);

        Zadania zadanie = new Zadania()
                              {
                                  Tytul = TytulTextBox.Text,
                                  Opis = OpisTextBox.Text,
                                  DataOtwarcia = dataOtwarcia,
                                  DataZamkniecia = dataZamkniecia,
                                  IdWlasciciela = (Guid)Membership.GetUser().ProviderUserKey
                              };
        string[] daneWe = Regex.Split(DaneWeTextBox.Text, "\r\n");
        string[] daneWy = Regex.Split(DaneWyTextBox.Text, "\r\n");

        for (int i = 0; i < daneWe.Length; i++)
        {
            DaneWZadaniach daneDoZadania = new DaneWZadaniach();
            DaneWeWy dane = new DaneWeWy();
            dane.We = daneWe[i];
            dane.Wy = daneWy[i];
            daneDoZadania.DaneWeWy = dane;
            daneDoZadania.Zadania = zadanie;
            db.DaneWZadaniaches.InsertOnSubmit(daneDoZadania);
        }
        
        db.SubmitChanges();
    }
}