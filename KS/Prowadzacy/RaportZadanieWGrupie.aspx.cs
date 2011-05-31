using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Prowadzacy_RaportZadanieWGrupie : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack && Session["IdZadania"] != null && Session["IdGrupy"] != null)
        {
            DataClassesDataContext db = new DataClassesDataContext();
            WczytajNazwe(db);
            WczytajListeNadeslanych(db);
        }
    }

    protected void WczytajNazwe(DataClassesDataContext db)
    {
        Zadania zadanie = db.Zadanias.First(z => z.IdZadania == (int)Session["IdZadania"]);
        NazwaZadaniaLabel.Text = zadanie.Tytul;
        TrescLabel.Text = zadanie.Opis;
        DataOtwarciaLabel.Text = zadanie.DataOtwarcia.ToLongTimeString() + " " + zadanie.DataOtwarcia.ToLongDateString();
        DataZamknieciaLabel.Text = zadanie.DataZamkniecia.ToLongTimeString() + " " + zadanie.DataZamkniecia.ToLongDateString();
    }

    protected void WczytajListeNadeslanych(DataClassesDataContext db)
    {
        var querry = from zWg in db.ZadaniawGrupaches
                     join n in db.NadeslaneZadanias on zWg.IdZadania equals n.IdZadania
                     join u in db.aspnet_Users on n.IdStudenta equals u.UserId
                     where n.IdZadania == (int)Session["IdZadania"] && zWg.IdGrupy == (int)Session["IdGrupy"]
                     select new { n.Ocena, n.DataNadeslania, n.DataSprawdzenia, u.UserName, u.UserId };

        NadeslaneRozwiazaniaListView.DataSource = querry;
        NadeslaneRozwiazaniaListView.DataBind();
        FormatujOceny();
    }

    protected void FormatujOceny()
    {
        foreach (var item in NadeslaneRozwiazaniaListView.Items)
        {
            Label ocena = (Label)item.FindControl("OcenaLabel");
            if (ocena != null)
            {
                if (ocena.Text == "")
                {
                    ocena.Text = "Nie ocenione";
                }
                else
                {
                    double ocenaProc;
                    double.TryParse(ocena.Text, out ocenaProc);
                    ocena.Text = string.Format("Ocena {0:0}%", ocenaProc * 100);
                }
            }
        }
    }

    // Uwaga BYCZA metoda :D
    protected void WyborNadeslanegoZadania(object sender, ListViewSelectEventArgs e)
    {
        DataClassesDataContext db = new DataClassesDataContext();
        Guid userId = (Guid)NadeslaneRozwiazaniaListView.DataKeys[e.NewSelectedIndex].Value;
        NadeslaneZadania nadeslaneZadanie =
            db.NadeslaneZadanias.FirstOrDefault(z => z.IdStudenta == userId && z.IdZadania == (int)Session["IdZadania"]);
        KodProgramuLabel.Text = nadeslaneZadanie.KodProgramu;

        var querry = from dWz in db.DaneWZadaniaches
                     join dWeWy in db.DaneWeWies on dWz.IdDanych equals dWeWy.IdDanych
                     where dWz.IdZadania == (int)Session["IdZadania"]
                     select new { dWeWy.Wy };

        if (nadeslaneZadanie.WynikiZadania != null)
        {
            string[] wygenerowaneOdp = Regex.Split(nadeslaneZadanie.WynikiZadania, @"\r\n\r\n");

            List<TableCell> tableCellsList1 = new List<TableCell>();
            foreach (var s in wygenerowaneOdp)
            {
                TableCell tableCell = new TableCell();
                tableCell.Text = s.Replace("\r\n", " ");
                tableCellsList1.Add(tableCell);
            }

            List<TableCell> tableCellsList2 = new List<TableCell>();
            foreach (var item in querry)
            {
                TableCell tableCell = new TableCell();
                tableCell.Text = item.Wy;
                tableCellsList2.Add(tableCell);
            }

            for (int i = 0; i < tableCellsList2.Count; i++)
            {
                TableRow tableRow =  new TableRow();
                tableRow.Cells.Add(tableCellsList2[i]);

                try
                {
                    tableRow.Cells.Add(tableCellsList1[i]);
                }
                catch (Exception)
                {
                    tableRow.Cells.Add(new TableCell() { Text = "" });
                }

                DaneWYTable.Rows.Add(tableRow);
            }

            DaneWYTable.Visible = true;
        }

        NadeslaneRozwiazaniaListView.SelectedIndex = e.NewSelectedIndex;
        WczytajListeNadeslanych(db);
    }
}