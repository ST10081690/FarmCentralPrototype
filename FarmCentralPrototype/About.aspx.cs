/*
 Project: Farm Central Prototype, PROG7311 POE PART 2
 Owner: Euluis Goncalves, ST10081690
 BCA3 - 2023
*/

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FarmCentralPrototype
{
    public partial class About : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                //restricting unathourised access
                if (Session["loginResult"] != "valid")
                {
                    //Directing user to login page
                    Response.Redirect("~/Login.aspx");
                }
                //setting label text to logged user's name
                Lbl_usrName.Text = (Session["loggedU_Name"].ToString() + "!");

            }
            catch (Exception ex) //error handling
            {
                //setting error message and displaying it
                string errorMessage = "Something went wrong. \nPlease try again.";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + errorMessage + "');", true);

            }

        }

    }
} //-------------------------------------------END OF CLASS---------------------------------------------//