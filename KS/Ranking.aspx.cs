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
                TableRow tableRow = new TableRow();
                tableRow.Cells.Add(new TableCell() { Text = indeks.ToString() });
                tableRow.Cells.Add(new TableCell() { Text = zadanie.Tytul });
                tableRow.Cells.Add(new TableCell() { Text = user.UserName });
                tableRow.Cells.Add(new TableCell() { Text = string.Format("{0:0}%", rozwiazanie.Ocena * 100) });
                tableRow.Cells.Add(new TableCell() { Text = rozwiazanie.DataNadeslania.ToString() });
                RankingTable.Rows.Add(tableRow);
            }
            else
            {
                TableRow tableRow = new TableRow();
                tableRow.Cells.Add(new TableCell() { Text = indeks.ToString() });
                tableRow.Cells.Add(new TableCell() { Text = zadanie.Tytul });
                tableRow.Cells.Add(new TableCell() { Text = "" });
                tableRow.Cells.Add(new TableCell() { Text = "" });
                tableRow.Cells.Add(new TableCell() { Text = "" });
                RankingTable.Rows.Add(tableRow);
            }
            indeks++;
        }
    }
}