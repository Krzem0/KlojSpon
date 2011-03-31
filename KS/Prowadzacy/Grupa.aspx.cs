using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.MobileControls;
using System.Web.UI.WebControls;

public partial class Prowadzacy_Grupa : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GroupNameLabel.Text = (string)Session["NazwaGrupy"];

            DataClassesDataContext db = new DataClassesDataContext();
            ReadUsersInGroupList(db);
            ReadFreeUsers(db);
            DescriptionLabelText(db);
        }
    }
    protected void AddButton_Click(object sender, EventArgs e)
    {
        if (GroupNameLabel.Text != "")
        {
            DataClassesDataContext db = new DataClassesDataContext();
            
            bool exist = db.aspnet_Users.Any(u => u.UserName == AddTextBox.Text);   
            if (exist)
            {
                aspnet_User user = db.aspnet_Users.First(u => u.UserName == AddTextBox.Text);
                bool isIn = db.aspnet_UsersInRoles.Any(u => u.UserId == user.UserId);
                if (!isIn)
                {
                    Grupy grupa = db.Grupies.First(g => g.Nazwa == (string)Session["NazwaGrupy"]);
                    StudenciWGrupach studenciWGrupach = new StudenciWGrupach
                    {
                        IdGrupy = grupa.IdGrupy,
                        IdStudenta = user.UserId,
                        DataDodania = DateTime.Now
                    };
                    db.StudenciWGrupaches.InsertOnSubmit(studenciWGrupach);
                    db.SubmitChanges();
                    ReadUsersInGroupList(db);
                }
                else
                {
                    GroupNameExistLabelWrite("Podany użytkownik ma już grupę.");
                }
            }
            else
            {
                GroupNameExistLabelWrite("Podany użytkownik nie istnieje.");
            }
        }
        else
        {
            GroupNameExistLabelWrite("Nie podano nazwy użytkownika.");
        }
    }

    private void ReadUsersInGroupList(DataClassesDataContext db)
    {
        var querry1 = from users in db.aspnet_Users
                      join usersINgroups in db.StudenciWGrupaches on users.UserId equals usersINgroups.IdStudenta
                      join gr in db.Grupies on usersINgroups.IdGrupy equals gr.IdGrupy
                      join daneUsera in db.DaneUseras on users.UserId equals daneUsera.UserId
                      where gr.Nazwa == GroupNameLabel.Text
                      select new { users.UserId, users.UserName, daneUsera.Name, daneUsera.Surname };
        StudentsInGroupList.DataSource = querry1;
        StudentsInGroupList.DataBind();
    }
    private void ReadFreeUsers(DataClassesDataContext db)
    {
        var querry2 = from users in db.aspnet_Users
                      join uINr in db.aspnet_UsersInRoles on users.UserId equals uINr.UserId
                      join role in db.aspnet_Roles on uINr.RoleId equals role.RoleId
                      join daneUsera in db.DaneUseras on users.UserId equals daneUsera.UserId
                      where !(from uINg in db.StudenciWGrupaches
                              select uINg.IdStudenta).Contains(users.UserId) && role.RoleName == "Student"
                      select new { users.UserId, users.UserName, daneUsera.Name, daneUsera.Surname };
        EnableStudentsList.DataSource = querry2;
        EnableStudentsList.DataBind();
    }
    private void GroupNameExistLabelWrite(string text)
    {
        GroupNameExistLabel.Text = text;
        GroupNameExistLabel.ForeColor = Color.Red;
        GroupNameExistLabel.Visible = true;
    }
    private void DescriptionLabelText(DataClassesDataContext db)
    {
        Grupy grupa = db.Grupies.First(g => g.Nazwa == (string) Session["NazwaGrupy"]);
        DescriptionLabel.Text = "utworzona: "+ grupa.DataUtworzenia.Date.ToShortDateString();
    }

    protected void AddCheckedButton_Click(object sender, EventArgs e)
    {
        List<Guid> idList = new List<Guid>();
        for (int i = 0; i < EnableStudentsList.Items.Count; i++)
        {
            CheckBox chk = EnableStudentsList.Items[i].FindControl("CheckBox1") as CheckBox;
            if (chk != null && chk.Checked)
            {
                idList.Add((Guid)EnableStudentsList.DataKeys[i].Value);
            }
        }

        DataClassesDataContext db = new DataClassesDataContext();
        foreach (var guid in idList)
        {
            Grupy grupa = db.Grupies.First(g => g.Nazwa == (string)Session["NazwaGrupy"]);
            StudenciWGrupach studenciWGrupach = new StudenciWGrupach
            {
                IdGrupy = grupa.IdGrupy,
                IdStudenta = guid,
                DataDodania = DateTime.Now
            };
            db.StudenciWGrupaches.InsertOnSubmit(studenciWGrupach);
        }
        db.SubmitChanges();
        ReadUsersInGroupList(db);
        ReadFreeUsers(db);
    }
}