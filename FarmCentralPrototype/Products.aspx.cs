/*
 Project: Farm Central Prototype, PROG7311 POE PART 2
 Owner: Euluis Goncalves, ST10081690
 BCA3 - 2023
*/

using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FarmCentralPrototype
{
    public partial class Products : System.Web.UI.Page
    {
        //sql connection referencing connection string
        public SqlConnection farmDbConnect = new SqlConnection(ConfigurationManager.ConnectionStrings["FarmDbConnection"].ConnectionString);

        //string to hold calendar selected date
        private string prodDate = "";

        //int to save logged user's ID
        private int loggedUserID;

        //int to save the id of prod type list selected item
        private int prodTypeID;

        //creating data table for product types
        public DataTable ProdTypeTbl = new DataTable();

        //creating data table for products
        public DataTable ProdTbl = new DataTable();

        //string to hold selected prod type list item.text
        public static string selectedPType;


        protected void Page_Load(object sender, EventArgs e)
        {
            /*
             * REFERENCING:
             * Syncfusion (2023) To know the purpose of using IsPostBack property in the OLAP controls, Syncfusion. 
             * Available at: https://support.syncfusion.com/kb/article/5193/what-is-the-purpose-of-using-ispostback-property-in-the-olap-controls#:~:text=Generally%2C%20the%20IsPostBack%20property%20is,IsPostBack%20property%20is%20used%20here.
             * (Accessed: 25 May 2023). 
             */
            if (IsPostBack)
            {
                selectedPType = DDList_prodType.SelectedItem.Text;
            }

            //restricting unauthorized users from accessing page
            if (Session["userType"] != "Farmer")
            {
                //Directing user to home page
                Response.Redirect("~/About.aspx");

            }

            //hiding success message
            Lbl_success.Visible = false;

            //calling method to fetch saved product types
            GetProdTypes();

            //calling method to fectch user id of current user
            GetLoggedUser();
        }

        // ---------------METHOD TO FIND THE LOGGED USER'S ID---------------//
        //------------------------------------------------------------------//
        private void GetLoggedUser()
        {
            SqlConnection farmDB = new SqlConnection(ConfigurationManager.ConnectionStrings["FarmDbConnection"].ConnectionString);
            try
            {
                //local variable holding username of logged in user
                string thisUser = Session["currentUser"].ToString();

                using (farmDB)
                {


                    //searching through database with select query
                    SqlCommand findId = new SqlCommand("select [u_id] from [USER] where [username] = @loggedIn", farmDB);

                    farmDB.Open();

                    //adding parameters to command
                    findId.Parameters.AddWithValue("@loggedIn", thisUser);

                    //executing reader
                    SqlDataReader read = findId.ExecuteReader();

                    //running if reader found a result
                    if (read.Read() == true)
                    {
                        //saving user ID the reader found in the database
                        loggedUserID = (int)read[0];

                    }
                    else
                    {//Directing user to login page
                        Response.Redirect("~/Login.aspx");
                    }

                    //closing reader
                    read.Close();
                }
            }
            catch (Exception ex) //error handling
            {
                //setting error message and displaying it
                string errorMessage = "Something went wrong. \nPlease try again.";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + errorMessage + "');", true);

            }

        }
        //-----------------------------------END OF METHOD----------------------------------//


        // ---------------METHOD TO FILL DATA TABLE WITH INFO---------------//
        //------------------------------------------------------------------//
        /*
         * REFERENCING:
         * ProgrammingGeek (2020) Complete CRUD operation in ASP.NET C# with SQL Server Step by step, YouTube. 
         * Available at: https://www.youtube.com/watch?v=I5cWkoMeQIY (Accessed: 22 May 2023). 
         */
        private void GetProdTypes()
        {
            try
            {
                using (farmDbConnect)
                {
                    //query to select module name
                    SqlCommand findTypes = new SqlCommand("select * from [PRODUCT_TYPE]", farmDbConnect);

                    //opening connection to database
                    farmDbConnect.Open();

                    //filling data table with retieved information
                    ProdTypeTbl.Load(findTypes.ExecuteReader());

                }

                //setting drop down list data source to data table
                DDList_prodType.DataSource = ProdTypeTbl;
                DDList_prodType.DataTextField = "p_type";
                DDList_prodType.DataValueField = "pt_id";
                DDList_prodType.DataBind();
            }

            catch (Exception ex) //error handling
            {
                //setting error message and displaying it
                string errorMessage = "Something went wrong. \nPlease try again.";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + errorMessage + "');", true);


            }
        }
        //-----------------------------------END OF METHOD----------------------------------//


        // ---------------METHOD TO STORE THE PRODUCT ID OF SELECTED ITEM---------------//
        //------------------------------------------------------------------//
        private void SaveProdType()
        {
            SqlConnection farmDbConnect = new SqlConnection(ConfigurationManager.ConnectionStrings["FarmDbConnection"].ConnectionString);

            try
            {
                using (farmDbConnect)
                {
                    SqlCommand findProdTypeID = new SqlCommand("select [pt_id] from [PRODUCT_TYPE] " +
                        "where [p_type] = @selected", farmDbConnect);

                    //opening connection to database
                    farmDbConnect.Open();

                    //adding parameters to command
                    findProdTypeID.Parameters.AddWithValue("@selected", selectedPType);

                    //executing reader
                    SqlDataReader read = findProdTypeID.ExecuteReader();

                    //running if reader found a result
                    if (read.Read() == true)
                    {
                        //saving user ID the reader found in the database
                        prodTypeID = (int)read[0];

                    }

                }


            }
            catch(Exception ex) //error handling
            {
                //setting error message and displaying it
                string errorMessage = "Something went wrong. \nPlease try again.";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + errorMessage + "');", true);

            }

        }

        //-----------------------------------END OF METHOD----------------------------------//



        // ---------METHOD TO ADD A NEW PRODUCT TO THE DATABASE-------------//
        //------------------------------------------------------------------//
        protected void Btn_AddProd_Click(object sender, EventArgs e)
        {

            //calling method to get product type ID selected in list
            SaveProdType();

            try
            {
                //fetching selected date on the calendar
                prodDate = Clndr_prodDate.SelectedDate.ToString();

                //erasing the time that is selected with the date
                prodDate = prodDate.Remove(prodDate.Length - 9);

                //hiding success message
                Lbl_success.Visible = false;

                SqlConnection farmDbConnect = new SqlConnection(ConfigurationManager.ConnectionStrings["FarmDbConnection"].ConnectionString);

                using (farmDbConnect)
                {
                    //Inserting new values into database table
                    SqlCommand newProduct = new SqlCommand("INSERT INTO [PRODUCT] VALUES " +
                                           "('" + TxtBx_prodName.Text + "','R" + TxtBx_prodPrice.Text + "','"
                                            + TxtBx_prodQty.Text + "','" + prodDate
                                            + "'," + loggedUserID + "," + prodTypeID + ")", farmDbConnect);

                    //Opening database connection
                    farmDbConnect.Open();

                    //Executing insert
                    newProduct.ExecuteNonQuery();

                    //Displayng success message
                    Lbl_success.Visible = true;

                }

                //Directing user to view products page
                Response.Redirect("~/ViewProducts.aspx");

            }

            catch (Exception ex) //error handling
            {
                //setting error message and displaying it
                string errorMessage = "Something went wrong. \nPlease try again.";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + errorMessage + "');", true);
            }
        }

        //-----------------------------------END OF METHOD----------------------------------//
    }
}
//-------------------------------------------END OF CLASS---------------------------------------------//