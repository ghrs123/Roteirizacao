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

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["util"] == null)
            {
                Session.Clear();
                Session.Abandon();
                Response.Redirect("principal.aspx");

            }


            /* LEr Imagem Configuração */
            string query = " SELECT ficheiro FROM imagem" +
                " INNER JOIN utilizador ON imagem.utilizadorid = utilizador.utilizadorid" +
                " WHERE username ='" + Session["util"] + "' OR email='" + Session["util"] + "';";

            SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["roteirizaçãoConnectionString"].ConnectionString);
            SqlCommand myCommand = new SqlCommand(query, myConn);

            myCommand.Connection = myConn;
            myConn.Open();


            SqlDataReader dr = myCommand.ExecuteReader();

            if (dr.Read())
            {

                Image2.ImageUrl = "data:image/png;base64," + Convert.ToBase64String((byte[])dr["ficheiro"]);
            }

            myConn.Close();


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
            if (btnUpload.Text != null) { 
                try
                {
                    string imgContentType = FileUpload1.PostedFile.ContentType;

                    Stream imgStream = FileUpload1.PostedFile.InputStream;

                    int imgLen = FileUpload1.PostedFile.ContentLength;

                    byte[] imgBinaryData = new byte[imgLen];


                    imgStream.Read(imgBinaryData, 0, imgLen);

                    string query = " SELECT utilizadorid FROM utilizador WHERE username = '" + Session["util"] + "' OR email='" + Session["util"] + "';";

                    SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["roteirizaçãoConnectionString"].ConnectionString);
                    SqlCommand myCommand = new SqlCommand();

                    myConn.Open();

                    SqlCommand Command = new SqlCommand(query, myConn);

                    SqlDataReader itemsReader = Command.ExecuteReader();

                    while (itemsReader.Read())
                    {

                        utilizadorid = itemsReader.GetInt32(0);

                    }

                    itemsReader.Close();

                    myCommand.Parameters.AddWithValue("@contentType", imgContentType);
                    myCommand.Parameters.AddWithValue("@ficheiro", imgBinaryData);
                    myCommand.Parameters.AddWithValue("@utilizadorid", utilizadorid);


                    myCommand.CommandType = CommandType.StoredProcedure;
                    myCommand.CommandText = "inserir_imagem";


                    myCommand.Connection = myConn;

                    myCommand.ExecuteNonQuery();
                    myConn.Close();

                    Response.Redirect("config_utilizador.aspx");
                }
                catch
                {
                    Response.Redirect("config_utilizador.aspx");
                }

            }




        }

      

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {

            if (e.CommandName.Equals("btn_salvardados"))
            {
                SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["roteirizaçãoConnectionString"].ConnectionString);

                SqlCommand myCommand = new SqlCommand();
                myConn.Open();

                myCommand.Parameters.AddWithValue("@username", ((TextBox)e.Item.FindControl("tb_username")).Text);
                myCommand.Parameters.AddWithValue("@nome", ((TextBox)e.Item.FindControl("tb_nome")).Text);
                myCommand.Parameters.AddWithValue("@apelido", ((TextBox)e.Item.FindControl("tb_apelido")).Text);
                myCommand.Parameters.AddWithValue("@email", ((TextBox)e.Item.FindControl("tb_email")).Text);
                myCommand.Parameters.AddWithValue("@morada", ((TextBox)e.Item.FindControl("tb_morada")).Text);
                myCommand.Parameters.AddWithValue("@cidade", ((TextBox)e.Item.FindControl("tb_cidade")).Text);
                myCommand.Parameters.AddWithValue("@pais", ((TextBox)e.Item.FindControl("tb_pais")).Text);
                myCommand.Parameters.AddWithValue("@cod_postal", ((TextBox)e.Item.FindControl("tb_postcod")).Text);

                SqlParameter valor = new SqlParameter();
                valor.ParameterName = "@retorno";
                valor.Direction = ParameterDirection.Output;
                valor.SqlDbType = SqlDbType.Int;
                myCommand.Parameters.Add(valor);

                myCommand.CommandType = CommandType.StoredProcedure;
                myCommand.CommandText = "atualizar_dados";


                myCommand.Connection = myConn;

                myCommand.ExecuteNonQuery();

                int repostaSP = Convert.ToInt32(myCommand.Parameters["@retorno"].Value);

                if (repostaSP == 1)
                {
                    
                    Response.Redirect("config_utilizador.aspx");
                }



                myConn.Close();

            }
        }

        protected void btn_salvar_Click1(object sender, EventArgs e)
        {
            try
            {
                SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["roteirizaçãoConnectionString"].ConnectionString);
                SqlCommand myCommand = new SqlCommand();
                myConn.Open();


                myCommand.Parameters.AddWithValue("@utilizador", Session["util"].ToString());
                myCommand.Parameters.AddWithValue("@pw_atual", EncryptString(tb_senhaatual.Text));
                myCommand.Parameters.AddWithValue("@pw_nova", EncryptString(tb_novasenha.Text));

                SqlParameter valor = new SqlParameter();
                valor.ParameterName = "@retorno";
                valor.Direction = ParameterDirection.Output;
                valor.SqlDbType = SqlDbType.Int;
                myCommand.Parameters.Add(valor);

                myCommand.CommandType = CommandType.StoredProcedure;
                myCommand.CommandText = "alterar_pw";


                myCommand.Connection = myConn;

                myCommand.ExecuteNonQuery();

                int repostaSP = Convert.ToInt32(myCommand.Parameters["@retorno"].Value);


                if (repostaSP == 1)
                {

                    tb_novasenha.Text = "";
                    tb_senhaatual.Text = "";

                }
                myConn.Close();

            }
            catch
            {
                lbl_mensagem.Text = "Preencha os campos!";
            }
          
        }
    }



  
}



