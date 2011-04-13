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
            DataZamknieciaTextBox.Text = "rrrr-mm-dd hh:mm:ss";
            DataOtwarciaTextBox.Text = "rrrr-mm-dd hh:mm:ss";
        }
    }
    protected void WyslijButton_Click(object sender, EventArgs e)
    {
        // RZEROBIĆ KOD NA DZIAŁAJĄCY!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        // 2011-04-13 chyba powinien działać ;)

        DataClassesDataContext db = new DataClassesDataContext();
        //Regex regex = new Regex(@"(-)|(\.)");


        string[] dataOtwarcia = Regex.Split(DataOtwarciaTextBox.Text, " ");
        string[] dataZamkniecia = Regex.Split(DataZamknieciaTextBox.Text, " ");

        string[] dataOtwData = Regex.Split(dataOtwarcia[0], @"(-)|(\.)");
        string[] dataOtwCzas = Regex.Split(dataOtwarcia[1], @":");

        string[] dataZamData = Regex.Split(dataZamkniecia[0], @"(-)|(\.)");
        string[] dataZamCzas = Regex.Split(dataZamkniecia[1], @":");

        int year, month, day, hours, minutes, seconds;
        int.TryParse(dataOtwData[0], out year);
        int.TryParse(dataOtwData[2], out month);
        int.TryParse(dataOtwData[4], out day);
        int.TryParse(dataOtwCzas[0], out hours);
        int.TryParse(dataOtwCzas[1], out minutes);
        int.TryParse(dataOtwCzas[2], out seconds);
        DateTime dataOtw = new DateTime(year, month, day, hours, minutes, seconds);

        int.TryParse(dataZamData[0], out year);
        int.TryParse(dataZamData[2], out month);
        int.TryParse(dataZamData[4], out day);
        int.TryParse(dataZamCzas[0], out hours);
        int.TryParse(dataZamCzas[1], out minutes);
        int.TryParse(dataZamCzas[2], out seconds);
        DateTime dataZam = new DateTime(year, month, day, hours, minutes, seconds);

        Zadania zadanie = new Zadania()
                              {
                                  Tytul = TytulTextBox.Text,
                                  Opis = OpisTextBox.Text,
                                  DataOtwarcia = dataOtw,
                                  DataZamkniecia = dataZam,
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
        SuccesLabel.Text = "Zadanie zostało dodane.";
    }
}