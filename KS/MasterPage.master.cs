using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
            MembershipUser user = Membership.GetUser();
            if (user!=null)
            {
                Login1.Visible = false;
                LoginStatus1.Visible = true;
            }
    }
}
