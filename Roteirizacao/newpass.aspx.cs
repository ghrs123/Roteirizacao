using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Configuration;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Data;

namespace Roteirizacao
{
    public partial class newpass : System.Web.UI.Page
    {
        private string email = "g_henrique19@hotmail.com";
        protected void Page_Load(object sender, EventArgs e)
        {
            email = DecryptString(Request.QueryString["user"].ToString());

        }


        protected void btnAlterar_Click(object sender, EventArgs e)
        {

            SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["roteirizaçãoConnectionString"].ConnectionString);
            SqlCommand myCommand = new SqlCommand();
            myConn.Open();

            myCommand.Parameters.AddWithValue("@utilizador", DecryptString(email.ToString()));
            myCommand.Parameters.AddWithValue("@pw_nova", EncryptString(tbNewPass.Text));
            
            SqlParameter valor = new SqlParameter();
            valor.ParameterName = "@retorno";
            valor.Direction = ParameterDirection.Output;
            valor.SqlDbType = SqlDbType.Int;
            myCommand.Parameters.Add(valor);

            myCommand.CommandType = CommandType.StoredProcedure;
            myCommand.CommandText = "redefinir_pw";


            myCommand.Connection = myConn;

            myCommand.ExecuteNonQuery();

            int repostaSP = Convert.ToInt32(myCommand.Parameters["@retorno"].Value);


            if (repostaSP == 1)
            {

                tbNewPass.Text = "";
               tbRepNewPass.Text = "";
                lbl_mensagem.Text = "Palavra-Passe redefinida";
              

            }else if(repostaSP == 0){

                lbl_mensagem.Text = "Não é possível redefinir a Palarva-Passe, tente novamente!!";
            }
            myConn.Close();
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
        public static string DecryptString(string Message)
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

            // Step 3. Setup the decoder
            TDESAlgorithm.Key = TDESKey;
            TDESAlgorithm.Mode = CipherMode.ECB;
            TDESAlgorithm.Padding = PaddingMode.PKCS7;

            // Step 4. Convert the input string to a byte[]

            Message = Message.Replace("KKK", "+");
            Message = Message.Replace("JJJ", "/");
            Message = Message.Replace("III", "\\");


            byte[] DataToDecrypt = Convert.FromBase64String(Message);

            // Step 5. Attempt to decrypt the string
            try
            {
                ICryptoTransform Decryptor = TDESAlgorithm.CreateDecryptor();
                Results = Decryptor.TransformFinalBlock(DataToDecrypt, 0, DataToDecrypt.Length);
            }
            finally
            {
                // Clear the TripleDes and Hashprovider services of any sensitive information
                TDESAlgorithm.Clear();
                HashProvider.Clear();
            }

            // Step 6. Return the decrypted string in UTF8 format
            return UTF8.GetString(Results);
        }



    }


}