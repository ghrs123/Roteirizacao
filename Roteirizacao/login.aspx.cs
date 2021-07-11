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
using System.Text;
using System.IO;


namespace Roteirizacao
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_login_Click(object sender, EventArgs e)
        {
            SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["roteirizaçãoConnectionString"].ConnectionString);
            SqlCommand myCommand = new SqlCommand();

            myCommand.Parameters.AddWithValue("@username", tb_user.Value);
            myCommand.Parameters.AddWithValue("@palavra_passe", EncryptString(tb_password.Value));


            SqlParameter valor = new SqlParameter();
            valor.ParameterName = "@retorno";
            valor.Direction = ParameterDirection.Output;
            valor.SqlDbType = SqlDbType.Int;
            myCommand.Parameters.Add(valor);

            SqlParameter valor2 = new SqlParameter();
            valor2.ParameterName = "@retorno_perfil";
            valor2.Direction = ParameterDirection.Output;
            valor2.SqlDbType = SqlDbType.Int;
            myCommand.Parameters.Add(valor2);


            myCommand.CommandType = CommandType.StoredProcedure;
            myCommand.CommandText = "login_ativo";


            myCommand.Connection = myConn;
            myConn.Open();
            myCommand.ExecuteNonQuery();

            int repostaSP = Convert.ToInt32(myCommand.Parameters["@retorno"].Value);
            int respostaPerfilSP = Convert.ToInt32(myCommand.Parameters["@retorno_perfil"].Value);

            myConn.Close();


            if (repostaSP == 1)
            {

                Session["util"] = tb_user.Value;

                if (respostaPerfilSP == 1)
                {

                    Response.Redirect("principal_adm.aspx");
                }         
                else
                {
                    //Response.Redirect("pagina_user.aspx?codigo=repostaCd");
                    Response.Redirect("principal_user.aspx");
                }

            }
            else if (repostaSP == 0)
            {
                lbl_mensagem.Text = "Utilzador ou Plavra Passe errados";
            }
            else
            {
                lbl_mensagem.Text = "Utilzador não ativo";
            }

        }


        public static string EncryptString(string Message)
        {
            string Passphrase = "formacao";
            byte[] Results;
            System.Text.UTF8Encoding UTF8 = new System.Text.UTF8Encoding();

            // Step 1. We hash the passphrase using MD5
            // We use the MD5 hash generator as the result is a 128 bit byte array
            // which is a valid length for the TripleDES encoder we use below

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
        protected void btn_registar_Click(object sender, EventArgs e)
        {
            Response.Redirect("registar.aspx");
        }
    }
}