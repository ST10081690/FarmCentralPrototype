using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FarmCentralPrototype
{
    public partial class Login : System.Web.UI.Page
    {
        //database connection string
        private static string farmConString = ConfigurationManager.ConnectionStrings["FarmDbConnection"].ConnectionString;

        //sql connection referencing connection string
        SqlConnection farmDbConnect = new SqlConnection(farmConString);

        //Boolean varible to determine login success
        Boolean registered = false;

        //string to save typed username upon login
        public string logged;

        protected void Page_Load(object sender, EventArgs e)
        {
            //Making success label invisible
            Lbl_logSuccess.Visible = false;

            /*
             * REFERENCING:
             * Bean Software (2008) How To Change Page Background Color With ASP.NET Server Side, 
             * How to change page background color with ASP.NET Server Side. 
             * Available at: https://beansoftware.com/ASP.NET-FAQ/Change-Page-Background.aspx (Accessed: 20 May 2023). 
             */

            //setting the page background colour
            //LoginPage.Attributes.Add("bgcolor", "Lavender");

        }

        // ---------------METHOD TO PERFORM LOGIN---------------//
        //------------------------------------------------------------------//
        /*
         * REFERENCING:
         * Sharma, D. (2021) Introduction to ASP.NET sessions, C# Corner. 
         * Available at: https://www.c-sharpcorner.com/UploadFile/225740/introduction-of-session-in-Asp-Net/ 
         * (Accessed: 22 May 2023). 
         */
        protected void Btn_login_Click1(object sender, EventArgs e)
        {
            try
            {
                //saving username typed into the textbox into the session
                logged = TxtBx_logUsrName.Text;

                using (farmDbConnect)
                {
                    //searching through database for username and password
                    SqlCommand search = new SqlCommand("select * from [USER] where [username] = @name and [u_Password] = @pass", farmDbConnect);

                    //Opening database connection
                    farmDbConnect.Open();

                    //adding parameters to command
                    search.Parameters.AddWithValue("@name", logged);
                    search.Parameters.AddWithValue("@pass", TxtBx_logPass.Text);

                    //executing reader
                    SqlDataReader read = search.ExecuteReader();

                    //checking if reader found a result
                    if (read.Read() == true)
                    {
                        //storing user information in the session
                        Session["loggedUserID"] = read[0];
                        Session["currentUser"] = read[1];
                        Session["loggedU_Name"] = read[2];
                        Session["loginResult"] = "valid";
                        int typeID = (int)read[5];

                        //setting user role
                        if (typeID == 1)
                        {
                            Session["userType"] = "Employee";

                        }

                        //setting user role
                        if (typeID == 2)
                        {
                            Session["userType"] = "Farmer";

                        }

                        //making boolean true
                        registered = true;
                    }

                    //closing reader
                    read.Close();
                }

                //calling method to redirect user
                RedirectRegisteredUsr();
            }
            catch(Exception ex) //error handling
            {
                //setting error message and displaying it
                string errorMessage = "Something went wrong. \nPlease try again.";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + errorMessage + "');", true);
            }
        }
        //-----------------------------------END OF METHOD----------------------------------//


        // ---------------METHOD TO REDIRECT USER IF REGISTERED---------------//
        //------------------------------------------------------------------//
        private void RedirectRegisteredUsr()
        {
            //checking if bool true
            if (registered)
            {
                //Making label visible
                Lbl_logSuccess.Visible = true;

                //Directing user to home page
                Response.Redirect("~/About.aspx");
            }
            else
            {
                //Displaying message of unsuccessful login, with label
                Lbl_logSuccess.Visible = true;
                //Changing the text colour
                Lbl_logSuccess.ForeColor = System.Drawing.Color.Red;
                //Changing message
                Lbl_logSuccess.Text = "User Not Found.";
            }
        }
        //-----------------------------------END OF METHOD----------------------------------//
    }
}
//-------------------------------------------------------END OF CLASS--------------------------------------------------------------//