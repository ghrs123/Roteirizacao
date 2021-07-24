using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;
using System.Configuration;

namespace Roteirizacao
{
    public partial class tabela : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //if (!IsPostBack)
            //{
            //    this.BindDummyItem();
            //}
        }


        //private void BindDummyItem()
        //{
        //    DataTable dummy = new DataTable();
        //    dummy.Columns.Add("veicuo");
        //    dummy.Columns.Add("rotas");
        //    dummy.Columns.Add("cargas");
        
        //    int count = dlCustomers.RepeatColumns == 0 ? 1 : dlCustomers.RepeatColumns;
        //    for (int i = 0; i < count; i++)
        //    {
        //        dummy.Rows.Add();
        //    }
        //    dlCustomers.DataSource = dummy;
        //    dlCustomers.DataBind();
        //}

    }


    //[WebMethod]
    //public static string GetCustomers()
    //{
    //    string query = "SELECT top 10 * FROM Customers";
    //    SqlCommand cmd = new SqlCommand(query);
    //    return GetData(cmd).GetXml();
    //}

    //private static DataSet GetData(SqlCommand cmd)
    //{
    //    string strConnString = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
    //    using (SqlConnection con = new SqlConnection(strConnString))
    //    {
    //        using (SqlDataAdapter sda = new SqlDataAdapter())
    //        {
    //            cmd.Connection = con;
    //            sda.SelectCommand = cmd;
    //            using (DataSet ds = new DataSet())
    //            {
    //                sda.Fill(ds);
    //                return ds;

    //            }
    //        }
    //    }
    //}



}