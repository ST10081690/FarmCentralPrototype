using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FarmCentralPrototype
{
    public partial class Farmers : System.Web.UI.Page
    {
        //database connection string
        private static string farmConString = ConfigurationManager.ConnectionStrings["FarmDbConnection"].ConnectionString;

        //sql connection referencing connection string
        SqlConnection farmDbConnect = new SqlConnection(farmConString);

        protected void Page_Load(object sender, EventArgs e)
        {
            //hiding success message
            Lbl_success.Visible = false;

            //restricting unauthorized users from accessing page
            if (Session["userType"] != "Employee")
            {
                //Directing user to home page
                Response.Redirect("~/About.aspx");

            }
        }

        protected void Btn_AddFarmer_Click(object sender, EventArgs e)
        {
            //hiding success message
            Lbl_success.Visible = false;

            try
            {
                //Opening database connection
                farmDbConnect.Open();

                //Inserting new values into database table
                SqlCommand newFarmer = new SqlCommand("INSERT INTO [USER] VALUES " +
                                       "('" + TxtBx_f_usrName.Text + "','" + TxtBx_f_Name.Text + "','" + TxtBx_f_Surname.Text
                                        + "','" + TxtBx_f_AccPass.Text + "'," + 2 + ")", farmDbConnect);

                //Executing insert
                newFarmer.ExecuteNonQuery();

                //Closing database connection
                farmDbConnect.Close();


                //Displayng success message
                Lbl_success.Visible = true;

                //Directing user to view farmer page
                Response.Redirect("~/ViewFarmers.aspx");

            }
            catch(Exception ex) //error handling
            {
                //setting error message and displaying it
                string errorMessage = "Something went wrong. \nPlease ensure there are no empty boxes and details are correct.";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + errorMessage + "');", true);

            }
            
        }
    }
}