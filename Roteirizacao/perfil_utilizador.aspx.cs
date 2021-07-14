using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Roteirizacao
{
    public partial class perfil_utilizador : System.Web.UI.Page
    {
        string email, username, palavra_passe, nome, apelido, morada, cod_postal, pais, cidade, name, Image1;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["util"] == null)
            {
                Session.Clear();
                Session.Abandon();
                Response.Redirect("principal.aspx");

            }

            //SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["bd_atecPALConnectionString"].ConnectionString);
            //SqlCommand myCommand = new SqlCommand();

            //myCommand.Parameters.AddWithValue("@cod", ddl_imagem.SelectedValue);

            //myCommand.CommandType = CommandType.StoredProcedure;
            //myCommand.CommandText = "ler_imagem";




            ////matriz ou arrey de grandes dimen´sões para guardar valores de uma select vindo da base de dados
            //SqlDataReader dr = myCommand.ExecuteReader();
            ////se existir conteudo em dr
            //if (dr.Read())
            //{
            //    //despejar o conteudo no ecram
            //    //Response.ContentType = dr["contentType"].ToString();
            //    //Response.BinaryWrite((byte[])dr["ficheiro"]);

            //    Image1.ImageUrl = "data:image/png;base64," + Convert.ToBase64String((byte[])dr["noticia"]);
            //}

            //myConn.Close();


            //string query = " SELECT * FROM utilizador " +
            //    " INNER JOIN dados_utilizador ON dados_utilizador.utilizadorid = utilizador.utilizadorid " +
            //    " INNER JOIN imagem ON utilizador.utilizadorid = imagem.utilizadorid " +
            //    " WHERE username = '" + Session["util"] + "';";

            //SqlConnection myCon = new SqlConnection(ConfigurationManager.ConnectionStrings["roteirizaçãoConnectionString"].ConnectionString);
            //myCon.Open();
            //SqlCommand myCommand = new SqlCommand(query, myCon);

            //SqlDataReader itemsReader = myCommand.ExecuteReader();

            //while (itemsReader.Read())
            //{
            //    email = itemsReader.GetString(1);
            //    username = itemsReader.GetString(2);
            //    palavra_passe = itemsReader.GetString(3);
            //    nome = itemsReader.GetString(4);
            //    apelido = itemsReader.GetString(5);
            //    morada = itemsReader.GetString(9);
            //    cod_postal = itemsReader.GetString(10);
            //    pais = itemsReader.GetString(11);
            //    cidade = itemsReader.GetString(12);
            //    Image1 = "data:image/png;base64," + Convert.ToBase64String((byte[])itemsReader["ficheiro"]);
            //    name = itemsReader.GetString(4);


            //}

            //itemsReader.Close();

            //DataTable dt = new DataTable();

            //SqlDataAdapter da = new SqlDataAdapter(myCommand);
            //da.Fill(dt);

            //DataList1.DataSource = dt;
            //DataList1.DataBind();


            //myCon.Close();
        }

        protected void btn_sair_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("principal.aspx");
        }

        protected void btn_log_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("principal.aspx");
        }
    }
}