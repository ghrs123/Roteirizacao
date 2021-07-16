
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Http;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Net;
using System.Net.Http;
using System.Globalization;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Runtime.Serialization;
using System.Text;
using System.Web.Http.Cors;
using ServiceStack.Text;
using Confluent.Kafka;
using Config = Confluent.Kafka.Config;
using System.Web.Script.Serialization;
using Newtonsoft.Json.Linq;

namespace Roteirizacao
{

    public partial class principal : System.Web.UI.Page
    {

        [System.Web.Http.Cors.EnableCors(origins: "*", headers: "*", methods: "*", SupportsCredentials = true)]

        [WebMethod]
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

            //HttpContext.Current.Response.AppendHeader("Access-Control-Allow-Origin", "*");
            //HttpContext.Current.Response.AppendHeader("Access-Control-Allow-Headers", "X-Custom-Header");
            //HttpContext.Current.Response.AppendHeader("Access-Control-Allow-Methods", "POST");
            //HttpContext.Current.Response.AppendHeader("Access-Control-Allow-Credentials", "true");

            JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();

           //dynamic resultado = serializer.DeserializeObject(lbl_nome.Text);


            var package = new Package
            {
                Name = "Newtonsoft.json",
                Version = "12.0.3",
                Author = "Newtonsoft"

            };



         
        }






        public partial class Root
        {
            [JsonProperty("veiculo")]
        
            public long Veiculo { get; set; }

            [JsonProperty("rotas")]
            public string[] Rotas { get; set; }

            [JsonProperty("cargas")]
            public Cargas[] Cargas { get; set; }
        }

        public partial class Cargas
        {
            [JsonProperty("Carga")]
            public string Carga { get; set; }

            [JsonProperty("qty")]
            public long Qty { get; set; }
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

            Root myDeserializedClass = JsonConvert.DeserializeObject<Root>(lbl_nome.Text);

            // Console.WriteLine(myDeserializedClass);


            //JavaScriptSerializer serializer = new JavaScriptSerializer();
            //dynamic item = serializer.Deserialize<object>("{ \"test\":\"some data\" }");
            //string test = item["test"];

        }


    }
}





