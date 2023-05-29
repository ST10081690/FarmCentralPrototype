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
    public partial class ViewFarmers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //restricting unauthorized users from accessing page
            if (Session["userType"] != "Employee")
            {
                //Directing user to home page
                Response.Redirect("~/About.aspx");

            }

        }
    }
}