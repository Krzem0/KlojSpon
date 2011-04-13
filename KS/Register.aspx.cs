using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void UtworzKontoButton_Click(object sender, EventArgs e)
    {
        DataClassesDataContext db = new DataClassesDataContext();
        MembershipUser user;
        try
        {
            user = Membership.CreateUser(UserName.Text, Password.Text, Email.Text);
        }
        catch (Exception exception)
        {
            ErrorMessage.Text = exception.Message;
            return;
        }   
        DaneUsera daneUsera = new DaneUsera()
                                  {
                                      Name = NameTextBox.Text,
                                      Surname = SurnameTextBox.Text,
                                      UserId = (Guid)user.ProviderUserKey,
                                  };
        db.DaneUseras.InsertOnSubmit(daneUsera);
        db.SubmitChanges();
        DoneLabel.Text = "Konto zostało utworzone pomyślnie. Teraz możesz się zalogować.";
        DoneLabel.Visible = true;
    }
}