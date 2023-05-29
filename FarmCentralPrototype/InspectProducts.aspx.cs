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
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FarmCentralPrototype
{
    public partial class InspectProducts : System.Web.UI.Page
    {

        //sql connection referencing connection string
        public SqlConnection farmDbConnect = new SqlConnection(ConfigurationManager.ConnectionStrings["FarmDbConnection"].ConnectionString);

        //creating data table for farmer names
        public DataTable FarmerTbl = new DataTable();

        //creating data table for product types
        public DataTable ProdTypesTbl = new DataTable();

        //creating data table for product dates
        public DataTable ProdDatesTbl = new DataTable();

        public static string selectedFarmer;

        public static string selectedType;

        public bool givenStartDt = false;

        public bool givenEndDt = false;

        public bool farmerSelected = false;

        public bool typeSelected = false;


        protected void Page_Load(object sender, EventArgs e)
        {
            //restricting unauthorized users from accessing page
            if (Session["userType"] != "Employee")
            {
                //Directing user to home page
                Response.Redirect("~/About.aspx");

            }

            if (IsPostBack)
            {
                selectedFarmer = DDList_pFarmer.SelectedItem.Text;

                selectedType = DDList_pType.SelectedItem.Text;

                farmerSelected = true;

                typeSelected = true;

             }


            //changing label description
            Lbl_filtersOn.Text = "No Detected Filters.";

            Lbl_noFarmer.Visible = false;

            farmerSelected = false;

            typeSelected = false;


            //making default panel visible
            Pnl_AllProd.Visible = true;

            //hiding labels
            Lbl_SelectStrt.Visible = false;
            Lbl_SelectEnd.Visible = false;
        }

       

        // -------------------METHOD TO CLEAR ALL FILTERS-------------------//
        //------------------------------------------------------------------//
        protected void Btn_ClearFilter_Click(object sender, EventArgs e)
        {
            //seeting data source to default
            GrdV_AllProd.DataSourceID = "SearchAllProdSource";

        }
        //-----------------------------------END OF METHOD----------------------------------//

        protected void DDList_pFarmer_SelectedIndexChanged(object sender, EventArgs e)
        {
            //saving selection
            selectedFarmer = DDList_pFarmer.SelectedItem.Text;

            farmerSelected = true;

            //calling method to filter and display results
            GetProdFiltered_Frmr();

            //setting gridview data source
            GrdV_AllProd.DataSourceID = "SearchByFarmer";

        }
        //-----------------------------------END OF METHOD----------------------------------//


        //---------------METHOD TO FIND MATCHING FARMER'S ID----------------//
        //------------------------------------------------------------------//
        private void GetProdFiltered_Frmr()
        {
            //creating sql connection
            SqlConnection farmDb = new SqlConnection(ConfigurationManager.ConnectionStrings["FarmDbConnection"].ConnectionString);

            try 
            {
                using (farmDb)
                {
                    //query to select module name
                    SqlCommand search = new SqlCommand("select [u_id] from [USER] where [username] = @selectedFrmr", farmDb);

                    ///Opening database connection
                    farmDb.Open();

                    //adding parameters to command
                    search.Parameters.AddWithValue("@selectedFrmr", selectedFarmer);

                    //executing reader
                    SqlDataReader read = search.ExecuteReader();

                    //checking if reader found a result
                    if (read.Read() == true)
                    {
                        //storing user information in the session
                        Session["filterFrmrSearch"] = (int)read[0];

                        //changing label description
                        Lbl_filtersOn.Text = "Filtering - Farmer";
                    }
                }

            }
            catch (Exception ex) //error handling 
            { 
                //setting error message and displaying it
                string errorMessage = "Something went wrong. \nPlease try again.";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + errorMessage + "');", true);
            }
            
        }
        //-----------------------------------------------END OF METHOD---------------------------------------------------------//



        // ---------------METHOD TO HANDLE PRODUCT TYPE SELECTION---------------//
        //----------------------------------------------------------------------//
        protected void DDList_pType_SelectedIndexChanged(object sender, EventArgs e)
        {
            //saving selection
            selectedType = DDList_pType.SelectedItem.Text;

            typeSelected = true;

            if(farmerSelected || typeSelected)
            {
                //calling method to filter and display results
                GetProdFiltered_Type();

                GrdV_AllProd.DataSourceID = "SearchByFrmrNType";

            }
            else
            {
                //editing error label
                Lbl_noFarmer.Visible = true;
                Lbl_noFarmer.Text = "Please select a farmer";
                Lbl_noFarmer.ForeColor = System.Drawing.Color.Red;
            }

        }
        //-----------------------------------END OF METHOD----------------------------------//



        // ---------------METHOD TO FIND MATCHING PRODUCT TYPE ID---------------//
        //----------------------------------------------------------------------//
        private void GetProdFiltered_Type()
        {
            //creating sql connection
            SqlConnection farmDb = new SqlConnection(ConfigurationManager.ConnectionStrings["FarmDbConnection"].ConnectionString);

            try 
            {
                using (farmDb)
                {
                    //query to select module name
                    SqlCommand search = new SqlCommand("select [pt_id] from [PRODUCT_TYPE] where [p_type] = @selectedType", farmDb);

                    ///Opening database connection
                    farmDb.Open();

                    //adding parameters to command
                    search.Parameters.AddWithValue("@selectedType", selectedType);

                    //executing reader
                    SqlDataReader read = search.ExecuteReader();

                    //checking if reader found a result
                    if (read.Read() == true)
                    {
                        //storing user information in the session
                        Session["filterTypeSearch"] = (int)read[0];

                        //changing label description
                        Lbl_filtersOn.Text = "Filtering - Farmer & Product Type";
                    }
                }

            }
            catch (Exception ex) //error handling
            {
                //setting error message and displaying it
                string errorMessage = "Something went wrong. \nPlease try again.";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + errorMessage + "');", true);
            }
            
        }
        //-----------------------------------END OF METHOD----------------------------------------------------------------------------------//


        // ---------------METHOD TO HANDLE START DATE SELECTION---------------//
        //------------------------------------------------------------------//
        /*
         * REFERENCING:
         * Chaudhary, M. (2016) How to search/filter data in gridview [asp.net], YouTube. 
         * Available at: https://www.youtube.com/watch?v=yvervVjdGSs (Accessed: 27 May 2023). 
         */
        protected void DDList_pStartDate_SelectedIndexChanged(object sender, EventArgs e)
        {
            //calling method to save start date selection
            SaveStrtDt();

            //hiding label
            Lbl_SelectStrt.Visible = false;


            //showing label if user has not selected an end date
            if (givenEndDt == false)
            {
                //making label visible
                Lbl_SelectEnd.Visible = true;

            }

        }
        //-----------------------------------END OF METHOD----------------------------------//


        // ---------------METHOD TO SAVE SELECTED START DATE ---------------//
        //------------------------------------------------------------------//
        private void SaveStrtDt()
        {
            //saving content to session
            Session["filterStrtDtSearch"] = DDList_pStartDate.SelectedItem.Text;

            //making bool true
            givenStartDt = true;

        }
        //-----------------------------------END OF METHOD----------------------------------//



        // ---------------METHOD TO FILTER PRODUCT BY FARMER & DATE ---------------//
        //-------------------------------------------------------------------------//
        /*
         * REFERENCING:
         * Khan, M. (2017) Get selected text and value inside Dropdownlist selectedindexchanged event in ASP.NET, ASPSnippets. 
         * Available at: https://www.aspsnippets.com/Articles/Get-Selected-Text-and-Value-inside-DropDownList-SelectedIndexChanged-event-in-ASPNet.aspx 
         * (Accessed: 25 May 2023). 
         */
        protected void DDList_pEndDate_SelectedIndexChanged(object sender, EventArgs e)
        {
            //calling method to save end date selection
            SaveEndDate();
            
            //hiding label
            Lbl_SelectEnd.Visible = false;

            try 
            {
                if (farmerSelected || givenEndDt == true || givenStartDt == true)
                {
                    //hiding labels
                    Lbl_SelectStrt.Visible = false;
                    Lbl_SelectEnd.Visible = false;

                    //setting gridview data source
                    GrdV_AllProd.DataSourceID = "SearchByFrmrNDate";

                    //changing label description
                    Lbl_filtersOn.Text = "Filtering - Farmer & Date Range";

                }
                else
                {
                    //editing and displaying error label
                    Lbl_noFarmer.Visible = true;
                    Lbl_noFarmer.Text = "Please select a farmer";
                    Lbl_noFarmer.ForeColor = System.Drawing.Color.Red;

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


        // ---------------METHOD TO SAVE SELECTED END DATE ---------------//
        //-------------------------------------------------------------------------//
        private void SaveEndDate()
        {
            Session["filterEndDtSearch"] = DDList_pEndDate.SelectedItem.Text;


            //making bool true
            givenEndDt = true;

        }
        //-----------------------------------END OF METHOD----------------------------------//


    }
}//-------------------------------------------END OF CLASS---------------------------------------------//