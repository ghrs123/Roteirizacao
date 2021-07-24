﻿
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Services;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System.Web.Http.Cors;
using System.Web.Script.Serialization;
using System.ServiceModel.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Xml;
using System.Net.Http;
using System.Threading.Tasks;
using System.Data.OleDb;
using System.IO;
using System.Linq;
using System.Text;
using System.Dynamic;
using System.Web.Helpers;
using System.Web.WebPages;
using System.Web.Razor;
using System.Collections.ObjectModel;

namespace Roteirizacao
{



    public partial class principal : System.Web.UI.Page
    {
        private static readonly HttpClient _Client = new HttpClient();

        [System.Web.Http.Cors.EnableCors(origins: "*", headers: "*", methods: "*", SupportsCredentials = true)]


    
        protected void Page_Load(object sender, EventArgs e)
        {
            EnableCorsAttribute cors = new EnableCorsAttribute("https://localhost:44399/principal.aspx", "*", "GET, POST");
            //[System.Web.Http.Cors.EnableCors(origins: "*", headers: "Origin, X-Requested-With, Content-Type, Accept", methods: "POST,GET,PUT,DELETE", SupportsCredentials = true)]


            HttpContext.Current.Response.AddHeader("Access-Control-Allow-Origin", "*");
            HttpContext.Current.Response.AddHeader("Access-Control-Allow-Methods", "GET,POST");
            HttpContext.Current.Response.AddHeader("Access-Control-Allow-Headers", "X-Custom-Header");
            HttpContext.Current.Response.AddHeader("Access-Control-Allow-Credentials", "true");

            HttpContext.Current.Request.Headers.Add("Access-Control-Allow-Origin", "*");
            HttpContext.Current.Request.Headers.Add("Access-Control-Allow-Headers", "X-Custom-Header");
            HttpContext.Current.Request.Headers.Add("Access-Control-Allow-Methods", "POST");
            HttpContext.Current.Request.Headers.Add("Access-Control-Allow-Credentials", "true");

           
            SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["roteirizaçãoConnectionString"].ConnectionString);
           // Root myDeserializedClass = JsonConvert.DeserializeObject<Root>();


            if (!Page.IsPostBack)
            {

            }

         

           

            //dynamic resultado = serializer.DeserializeObject(lbl_nome.Text);
            string xpto = tb_resp.Value;


        }

        [WebMethod]
        public static string GetData(string objRoot)
        {
            string resposta = objRoot;
          //  Root myDeserializedClass = JsonConvert.DeserializeObject<Root>(objRoot);
           return resposta;
            
          
        }

       
      

        protected void enviar_Click(object sender, EventArgs e)
        {
            //JavaScriptSerializer serial = new JavaScriptSerializer();
            //dynamic item = serial.Deserialize<object>(lbl_nome.Text);
            // string test = item["test"];

            //JavaScriptSerializer json_serializer = new JavaScriptSerializer();
            //object routes_list = json_serializer.DeserializeObject(lbl_nome.Text);
            //JObject json = JObject.Parse();
            //foreach (var i in json)
            //{
            //    Console.WriteLine(i);
            //}

         
           // Root myDeserializedClass = JsonConvert.DeserializeObject<Root>(lblnome2.InnerText);
          

            // Console.WriteLine(myDeserializedClass);


            //JavaScriptSerializer serializer = new JavaScriptSerializer();
            //dynamic item = serializer.Deserialize<object>("{ \"test\":\"some data\" }");
            //string test = item["test"];

        }

        protected void brtRecuperar_Click(object sender, EventArgs e)
        {
           //Response.Redirect("login.aspx");
           
           

        }

        protected void btnRegistarRota_Click(object sender, EventArgs e)
        {
            string xpto = tb_resp.Value;
            //string str = xpto;
            //JavaScriptSerializer j = new JavaScriptSerializer();
            //object a = j.Deserialize(str, typeof(object));


            // dynamic stuff = JsonConvert.DeserializeObject(xpto.ToString());
            // Root flight = Newtonsoft.Json.JsonConvert.DeserializeObject<Root>(xpto);s

            //  Root myDeserializedClass = JsonConvert.DeserializeObject<Root>(xpto);

            //JavaScriptSerializer oJS = new JavaScriptSerializer();
            //Root oRootObject = new Root();
            //oRootObject = oJS.Deserialize<Root>(xpto);
            Root rt = new Root();
            var dyn = JsonConvert.DeserializeObject<JObject>(xpto);

            JProperty propAge = dyn.Properties().FirstOrDefault(i => i.Name == "veiculo");
            if (propAge != null)
            {
                int age = int.Parse(propAge.Value.ToString());
                Console.WriteLine("veiculo=" + rt.veiculo );
            }

            //or as a one-liner:
            int myage = int.Parse(dyn.Properties().First(i => i.Name == "veiculo").Value.ToString());



            string b = "";
            //    for (int i = 0; i < ((object[])a).GetLength(0); i++)
            //    {
            //        for (int j = 0; j < ((object[])a).GetLength(1); j++)
            //        {

            //            ((object[])a)[i].Items[0].ToString();

            //            ((object[])a)[i].Items[j].ToString();
            //            ((object[])a)[i].Items[j].ToString();
            //            //   var veiculo = ((object[])a)[i][0];
            //        }



            //}






        }


    }

}





