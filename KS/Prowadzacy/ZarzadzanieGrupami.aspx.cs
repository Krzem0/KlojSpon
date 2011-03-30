using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

public partial class Prowadzący_ZarzadzanieGrupami : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                Session["IdProwadzacego"] = Membership.GetUser().ProviderUserKey;
            }
            catch (Exception)
            {
            }       
        }
    }
    protected void GroupNameButton_Click(object sender, EventArgs e)
    {
        DataClassesDataContext dataContext = new DataClassesDataContext(WebConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);
        Grupy grupa = new Grupy()
                          {
                              CzyUsuniety = false,
                              DataUtworzenia = DateTime.Now,
                              Nazwa = GroupNameTextBox.Text,
                              IdWlasciciela = (Guid)Membership.GetUser().ProviderUserKey
                          };

        bool exist = dataContext.Grupies.Any(g => g.Nazwa == grupa.Nazwa);
        if (!exist)
        {
            dataContext.Grupies.InsertOnSubmit(grupa);
            dataContext.SubmitChanges();
            ListView1.DataBind();
            GroupNameExistLabel.Text = "Grupa została dodana.";
            GroupNameExistLabel.ForeColor = Color.Green;
            GroupNameExistLabel.Visible = true;
        }
        else
        {
            GroupNameExistLabel.Text = "Grupa o tej nazwie już istnieje. Musisz podać inną nazwę.";
            GroupNameExistLabel.ForeColor = Color.Red;
            GroupNameExistLabel.Visible = true;
        }
    }
    protected void NazwaLinkButton_Click(object sender, EventArgs e)
    {
        LinkButton linkButton = (LinkButton) sender;
        Session["NazwaGrupy"] = linkButton.Text;
        Response.Redirect("Grupa.aspx");
    }
}