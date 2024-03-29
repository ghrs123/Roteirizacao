﻿using System;
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
using Microsoft.Web.Administration;

namespace Roteirizacao
{
    public partial class recuperar_senha : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void btn_recuperar_Click(object sender, EventArgs e)
        {
            SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["WebStoreConnectionString"].ConnectionString);
            SqlCommand myCommand = new SqlCommand();

            myCommand.Parameters.AddWithValue("@email", tb_email.Value);

            SqlParameter valor = new SqlParameter();
            valor.ParameterName = "@retorno_pw";
            valor.Direction = ParameterDirection.Output;
            valor.SqlDbType = SqlDbType.VarChar;
            valor.Size = 30;
            myCommand.Parameters.Add(valor);


            myCommand.CommandType = CommandType.StoredProcedure;
            myCommand.CommandText = "recuperar";


            myCommand.Connection = myConn;
            myConn.Open();
            myCommand.ExecuteNonQuery();
            string respostaSP = myCommand.Parameters["@retorno_pw"].Value.ToString();


            myConn.Close();

            if (respostaSP == "")
            {
                lbl_mensagem.Text = "Esse endereço de email não está registado";

            }

            else
            {

                lbl_mensagem.Text = $"A sua plavra-passe é {DecryptString(respostaSP)}";
            }

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