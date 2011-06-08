using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RankingZadania : System.Web.UI.Page
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
        Zadania zadanie;
        try
        {
            zadanie = db.Zadanias.FirstOrDefault(z => z.IdZadania == (int)Session["RankingIdZadania"]);
            Session.Remove("RankingIdZadania");
        }
        catch (Exception exception)
        {
            zadanie = null;
        }

        if (zadanie != null)
        {
            TytulZadaniaLabel.Text = "<h1>" + zadanie.Tytul + "</h1>";
            List<ZadaniaRanking> zadaniaRankings = new List<ZadaniaRanking>();
            int indeks = 1;

            var rozwiazaniaDoZadania = from nZ in db.NadeslaneZadanias
                                       where nZ.IdZadania == zadanie.IdZadania
                                       orderby nZ.Ocena descending, nZ.DataNadeslania ascending
                                       select nZ;

            foreach (NadeslaneZadania rozwiazanie in rozwiazaniaDoZadania)
            {
                aspnet_User user = db.aspnet_Users.First(u => u.UserId == rozwiazanie.IdStudenta);

                zadaniaRankings.Add(new ZadaniaRanking()
                                        {
                                            IdZadania = zadanie.IdZadania.ToString(),
                                            Lp = indeks.ToString(),
                                            UserName = user.UserName,
                                            Ocena = string.Format("{0:0}%", rozwiazanie.Ocena * 100),
                                            DataNadeslania = rozwiazanie.DataNadeslania.ToString()
                                        });
                indeks++;
            }
            RankingListView.DataSource = zadaniaRankings;
            RankingListView.DataBind();
        }
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
}