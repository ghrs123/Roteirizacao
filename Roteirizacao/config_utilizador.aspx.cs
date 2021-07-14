using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Security.Cryptography;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Web.SessionState;
using System.Web.UI.HtmlControls;
using System.IO;



namespace Roteirizacao
{
    public partial class config_utilizador : System.Web.UI.Page
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

            //string query = " SELECT * FROM utilizador " +
            //  " INNER JOIN dados_utilizador ON dados_utilizador.utilizadorid = utilizador.utilizadorid " +
            //  " INNER JOIN imagem ON utilizador.utilizadorid = imagem.utilizadorid " +
            //  " WHERE username = '" + Session["util"] + "';";

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
            //   // Image1 = "data:image/png;base64," + Convert.ToBase64String((byte[])itemsReader["ficheiro"]);
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

        protected void btn_log_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("principal.aspx");
        }

        protected void btn_sair_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("principal.aspx");
        }

        protected void btn_salvar_Click(object sender, EventArgs e)
        {
            //SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["roteirizaçãoConnectionString"].ConnectionString);
            //SqlCommand myCommand = new SqlCommand();

            //myCommand.Parameters.AddWithValue("@utilizador", Session["util"].ToString());
            //myCommand.Parameters.AddWithValue("@pw_atual", EncryptString(tb_senhaatual.Text));
            //myCommand.Parameters.AddWithValue("@pw_nova", EncryptString(tb_novasenha.Text));


            //SqlParameter valor = new SqlParameter();
            //valor.ParameterName = "@retorno";
            //valor.Direction = ParameterDirection.Output;
            //valor.SqlDbType = SqlDbType.Int;
            //myCommand.Parameters.Add(valor);

            //myCommand.CommandType = CommandType.StoredProcedure;
            //myCommand.CommandText = "alterar_pw";


            //myCommand.Connection = myConn;
            //myConn.Open();
            //myCommand.ExecuteNonQuery();
            //int repostaSP = Convert.ToInt32(myCommand.Parameters["@retorno"].Value);

            //myConn.Close();

            //if (repostaSP == 0)
            //{
            //    lbl_mensagem.Text = "A palavra-passe atual é inválida";


            //}

            //else
            //{
            //    lbl_mensagem.Text = "Palavra-passe alterada com sucesso!";
            //}

        }

        public static string EncryptString(string Message)
        {
            string Passphrase = "formacao";
            byte[] Results;
            System.Text.UTF8Encoding UTF8 = new System.Text.UTF8Encoding();


            MD5CryptoServiceProvider HashProvider = new MD5CryptoServiceProvider();
            byte[] TDESKey = HashProvider.ComputeHash(UTF8.GetBytes(Passphrase));

            // Step 2. Create a new TripleDESCryptoServiceProvider object
            TripleDESCryptoServiceProvider TDESAlgorithm = new TripleDESCryptoServiceProvider();

            // Step 3. Setup the encoder
            TDESAlgorithm.Key = TDESKey;
            TDESAlgorithm.Mode = CipherMode.ECB;
            TDESAlgorithm.Padding = PaddingMode.PKCS7;

            // Step 4. Convert the input string to a byte[]
            byte[] DataToEncrypt = UTF8.GetBytes(Message);

            // Step 5. Attempt to encrypt the string
            try
            {
                ICryptoTransform Encryptor = TDESAlgorithm.CreateEncryptor();
                Results = Encryptor.TransformFinalBlock(DataToEncrypt, 0, DataToEncrypt.Length);
            }
            finally
            {
                // Clear the TripleDes and Hashprovider services of any sensitive information
                TDESAlgorithm.Clear();
                HashProvider.Clear();
            }

            // Step 6. Return the encrypted string as a base64 encoded string

            string enc = Convert.ToBase64String(Results);
            enc = enc.Replace("+", "KKK");
            enc = enc.Replace("/", "JJJ");
            enc = enc.Replace("\\", "III");
            return enc;
        }



        int utilizadorid;
        protected void btnUpload_Click(object sender, EventArgs e)
        {
            
            //string utilizador = Session["util"].ToString();
            //string imgName ;

            //tipo do arquivo
            string imgContentType = FileUpload1.PostedFile.ContentType;

            //conhecer o conteudo do ficheiro
            Stream imgStream = FileUpload1.PostedFile.InputStream;

            //saber o tamanho do ficheiro
            int imgLen = FileUpload1.PostedFile.ContentLength;

            byte[] imgBinaryData = new byte[imgLen];

            //adicionar o conteudo 
            imgStream.Read(imgBinaryData, 0, imgLen);

            string query = " SELECT utilizadorid FROM utilizador WHERE username = '" + Session["util"] + "' OR email='" + Session["util"] + "';";

            SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["roteirizaçãoConnectionString"].ConnectionString);
            SqlCommand myCommand = new SqlCommand();
    
            myConn.Open();

            SqlCommand Command = new SqlCommand(query, myConn);
            
            SqlDataReader itemsReader = Command.ExecuteReader();

            while (itemsReader.Read())
            {
                //imgName = itemsReader.GetString(1);
                utilizadorid = itemsReader.GetInt32(0);

            }

            itemsReader.Close();

            //myCommand.Parameters.AddWithValue("@foto", imgName);
            myCommand.Parameters.AddWithValue("@contentType", imgContentType);
            myCommand.Parameters.AddWithValue("@ficheiro", imgBinaryData);
            myCommand.Parameters.AddWithValue("@utilizadorid", utilizadorid);


            myCommand.CommandType = CommandType.StoredProcedure;
            myCommand.CommandText = "inserir_imagem";


            myCommand.Connection = myConn;

            myCommand.ExecuteNonQuery();
            myConn.Close();
        }

        protected void btn_salvardados_Click(object sender, EventArgs e)
        {
             //SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["roteirizaçãoConnectionString"].ConnectionString);
             //SqlCommand myCommand = new SqlCommand();

             //myCommand.Parameters.AddWithValue("@utilizador", Session["util"].ToString());
             //myCommand.Parameters.AddWithValue("@username", tb_user.Value);
             //myCommand.Parameters.AddWithValue("@nome", tb_nome.Value);
             //myCommand.Parameters.AddWithValue("@apelido", tb_apelido.Value);
             //myCommand.Parameters.AddWithValue("@email", tb_email.Value);
             //myCommand.Parameters.AddWithValue("@morada", tb_morada.Value);
             //myCommand.Parameters.AddWithValue("@cidade", tb_cidade.Value);
             //myCommand.Parameters.AddWithValue("@pais", tb_pais.Value);
             //myCommand.Parameters.AddWithValue("@code_postal", tb_postcod.Value);


           //SqlParameter valor = new SqlParameter();
           //  valor.ParameterName = "@retorno";
           //  valor.Direction = ParameterDirection.Output;
           //  valor.SqlDbType = SqlDbType.Int;
           //  myCommand.Parameters.Add(valor);


            // SqlParameter valor2 = new SqlParameter();
            // valor2.ParameterName = "@retorno_user";
            // valor2.Direction = ParameterDirection.Output;
            // valor2.SqlDbType = SqlDbType.Int;
            // myCommand.Parameters.Add(valor2);


             //myCommand.CommandType = CommandType.StoredProcedure;
             //myCommand.CommandText = "alterar_dados";


            // myCommand.Connection = myConn;
            // myConn.Open();
            // myCommand.ExecuteNonQuery();

            // int repostaSP = Convert.ToInt32(myCommand.Parameters["@retorno"].Value);
            // int respostaUserSP = Convert.ToInt32(myCommand.Parameters["@retorno_user"].Value);


            //myConn.Close();

            // if (repostaSP == 0)
            // {
            //     lbl_mensagem.Text = "A palavra-passe atual é inválida";
            // }

            // else
            // {
            //     lbl_mensagem.Text = "Palavra-passe alterada com sucesso!";
            // }



        }

    }
}