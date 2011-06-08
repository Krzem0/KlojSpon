using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Ranking : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataClassesDataContext db = new DataClassesDataContext();
            WczytajRanking(db);
        }
    }

    protected void WczytajRanking(DataClassesDataContext db)
    {
        var zadania = from z in db.Zadanias
                      select z;

        List<ZadaniaRanking> zadaniaRankings = new List<ZadaniaRanking>();
        int indeks = 1;
        foreach (var zadanie in zadania)
        {
            var rozwiazaniaDoZadania = from nZ in db.NadeslaneZadanias
                                       where nZ.IdZadania == zadanie.IdZadania
                                       orderby nZ.Ocena descending, nZ.DataNadeslania ascending
                                       select nZ;

            if (rozwiazaniaDoZadania.Count() != 0)
            {
                NadeslaneZadania rozwiazanie = rozwiazaniaDoZadania.First();
                aspnet_User user = db.aspnet_Users.First(u => u.UserId == rozwiazanie.IdStudenta);

                zadaniaRankings.Add(new ZadaniaRanking()
                {
                    IdZadania = zadanie.IdZadania.ToString(),
                    Lp = indeks.ToString(),
                    Tytul = zadanie.Tytul,
                    UserName = user.UserName,
                    Ocena = string.Format("{0:0}%", rozwiazanie.Ocena * 100),
                    DataNadeslania = rozwiazanie.DataNadeslania.ToString()
                });
            }
            else
            {
                zadaniaRankings.Add(new ZadaniaRanking()
                {
                    IdZadania = zadanie.IdZadania.ToString(),
                    Lp = indeks.ToString(),
                    Tytul = zadanie.Tytul,
                    UserName = "",
                    Ocena = "",
                    DataNadeslania = ""
                });
            }
            indeks++;
        }
        RankingListView.DataSource = zadaniaRankings;
        RankingListView.DataBind();
    }

    protected class ZadaniaRanking
    {
        public string Lp { get; set; }
        public string Tytul { get; set; }
        public string UserName { get; set; }
        public string Ocena { get; set; }
        public string DataNadeslania { get; set; }
        public string IdZadania { get; set; }
    }
    protected void RankingListView_SelectedIndexChanging(object sender, ListViewSelectEventArgs e)
    {
        int id;
        int.TryParse((string) RankingListView.DataKeys[e.NewSelectedIndex].Value, out id);
        Session["RankingIdZadania"] = id;
        Response.Redirect(@"~/RankingZadania.aspx");
    }
}
