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
using System.Net.Mail;
using System.Net;
using System.Text.RegularExpressions;


namespace Roteirizacao
{
    public partial class registar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_registar_Click(object sender, EventArgs e)
        {
            SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["roteirizaçãoConnectionString"].ConnectionString);
            SqlCommand myCommand = new SqlCommand();

            myCommand.Parameters.AddWithValue("@email", tb_email.Value);
            myCommand.Parameters.AddWithValue("@username", tb_user.Value);
            myCommand.Parameters.AddWithValue("@palavra_passe", EncryptString(tb_pw.Value));        
            myCommand.Parameters.AddWithValue("@nome", tb_nome.Value);
            myCommand.Parameters.AddWithValue("@apelido", tb_apelido.Value);
            /*myCommand.Parameters.AddWithValue("@morada", tb_pais.Value);
            myCommand.Parameters.AddWithValue("@cod_postal", tb_cidade.Value);
            myCommand.Parameters.AddWithValue("@pais", tb_pais.Value);
            myCommand.Parameters.AddWithValue("@cidade", tb_cidade.Value);*/



            SqlParameter valor = new SqlParameter();
            valor.ParameterName = "@retorno";
            valor.Direction = ParameterDirection.Output;
            valor.SqlDbType = SqlDbType.Int;
            myCommand.Parameters.Add(valor);



            myCommand.CommandType = CommandType.StoredProcedure;
            myCommand.CommandText = "registar";


            myCommand.Connection = myConn;
            myConn.Open();
            myCommand.ExecuteNonQuery();
            int repostaSP = Convert.ToInt32(myCommand.Parameters["@retorno"].Value);

            myConn.Close();
            
            if (repostaSP == 1)
            {
                enviarEmail();
               

                tb_email.Value = "";
                tb_apelido.Value = "";
                tb_nome.Value = "";
                tb_pw.Value = "";
                tb_user.Value = "";

                lbl_mensagem.Text = "Utilzador registado com sucesso!";


            }
            else if (repostaSP == 2)
            {
                lbl_mensagem.Text = "Utilzador já existe.";

            }
            else if (repostaSP == 3)
            {
                lbl_mensagem.Text = "Email já existe.";
            }
        }

        private bool validaPW(string pw)
        {
            Regex maiusculas = new Regex("[A-Z]");
            Regex minusculas = new Regex("[a-z]");
            Regex numeros = new Regex("[0-9]");
            Regex especiais = new Regex("[^a-zA-Z0-9]");
            Regex plica = new Regex("'");

            if (pw.Length < 6) return false;
            if (maiusculas.Matches(pw).Count < 1) return false;
            if (minusculas.Matches(pw).Count < 1) return false;
            if (numeros.Matches(pw).Count < 1) return false;
            if (especiais.Matches(pw).Count < 1) return false;
            if (plica.Matches(pw).Count > 0) return false;

            return true;
        }

        private void enviarEmail()
        {


            try
            {
                MailMessage mail = new MailMessage();
                SmtpClient sc = new SmtpClient();


                string passEnc = EncryptString(tb_email.Value);


                mail.From = new MailAddress("teste2@gmail.com");

                mail.To.Add(new MailAddress(tb_email.Value));
                mail.Subject = "Ativação da Conta";

                mail.IsBodyHtml = true;

                mail.Body = $"Para ativar sua conta, clique aqui <a href='https://localhost:44399/ativacao.aspx?user={passEnc}'>aqui</a>";

                sc.Host = "smtp.gmail.com";
                sc.Port = 587;
                sc.UseDefaultCredentials = true;
                sc.Credentials = new NetworkCredential("meuemail@gmail.com", "12345687");
                sc.EnableSsl = true;
                sc.Send(mail);



            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
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


    }
}
