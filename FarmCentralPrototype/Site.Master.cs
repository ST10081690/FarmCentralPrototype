using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FarmCentralPrototype
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // ---------------METHOD TO LOGOUT ---------------//
        //------------------------------------------------------------------//
        protected void Btn_logout_Click(object sender, EventArgs e)
        {
            try
            {
                //clearing session
                Session.Clear();

                //Directing user to login page
                Response.Redirect("~/Login.aspx");

            }
            catch (Exception ex) //error handling
            {
  

            }

        }
        //-----------------------------------END OF METHOD----------------------------------//
    }
}