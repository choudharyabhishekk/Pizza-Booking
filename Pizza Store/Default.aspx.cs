using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Claims;
using Microsoft.AspNet.Identity;
using Pizza_Store.Models;

namespace Pizza_Store
{
    public partial class _Default : Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "SELECT * FROM Pizza";
                    SqlCommand command = new SqlCommand(query, connection);
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataSet data = new DataSet();
                    adapter.Fill(data, "Pizza");
                    DataList1.DataSource = data.Tables["Pizza"];
                    DataList1.DataBind();
                }
            }
        }
        public string GetShortDescription(object description, int wordCount = 8)
        {
            if (description == null || description == DBNull.Value)
            {
                return "<p class=\"card-text\"></p>"; // Empty p tag
            }

            string shortDescription = description.ToString().Trim();

            if (string.IsNullOrEmpty(shortDescription))
            {
                return "<p class=\"card-text\"></p>"; // Empty p tag if only whitespace
            }

            string[] words = shortDescription.Split(new[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);

            if (words.Length > wordCount)
            {
                shortDescription = string.Join(" ", words.Take(wordCount)) + "...";
            }
            return "<p>" + shortDescription + "</p>";
        }
        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            int PizzaID = int.Parse(button.CommandArgument);
            Response.Redirect("PizzaDetails?PizzaID=" + PizzaID);
          
        }
    }
    }