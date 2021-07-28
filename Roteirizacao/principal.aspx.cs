
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

            //using (WebClient webClient = new WebClient())
            //{
            //    json = webClient.DownloadString("~/principal_user.aspx");
            //}
            //ReadJson(json);

            string xpto = tb_resp.Value;


            string str = xpto;
            xpto.TrimStart(new char[] { '[' }).TrimEnd(new char[] { ']' });

            JavaScriptSerializer j = new JavaScriptSerializer();

            List<Root> ListaRotas = j.Deserialize<List<Root>>(xpto);

            //GridView 
            //DataTable dataTable = new DataTable();
            //DataRow dataRow = null;
            //dataTable.Columns.Add("Veiculo");
            //dataTable.Columns.Add("Rotas");
            //dataTable.Columns.Add("Cargas");


            //    //quantity of items in the first line veiculo,carga and rota(s)
            //    for (int l = 0; l < ListaRotas.Count(); l++)
            //    {

            //        //inserir uma linha para cada objeto
            //        tblRotas.Rows.Add(new TableRow());
            //        dataRow = dataTable.NewRow();

            //        for (int c = 0; c < 3; c++)
            //        {
            //            tblRotas.Rows[l].Cells.Add(new TableCell());

            //            if (c == 0)
            //            {

            //                // tblRotas.Rows[l].Cells[c].Text = rota.veiculo.ToString();
            //                //add ol veiculo
            //                tblRotas.Rows[l].Cells[c].Text = ListaRotas[l].veiculo.ToString();
            //                dataRow["Veiculo"] += ListaRotas[l].veiculo.ToString();

            //            }

            //            //for colun rotas
            //            if (c == 1)
            //            {

            //                for (int rt = 0; rt < ListaRotas[0].rotas.Count(); rt++ )
            //                {
            //                    tblRotas.Rows[l].Cells[c].Text = ListaRotas[l].rotas[rt].ToString();
            //                    dataRow["Rotas"] += $" Rota{(rt + 1)}: " + ListaRotas[l].rotas[rt].ToString()+ " ";

            //                }

            //                    //MessageBox.Show($"Rota{(r + 1)}:" + ListaRotas[0].rotas[r].ToString());

            //            }
            //            //for colun of cargas

            //            if (c == 2)
            //            {

            //                for (int cg = 0; cg < ListaRotas[l].cargas.Count; cg++)
            //                {
            //                    tblRotas.Rows[l].Cells[c].Text = ListaRotas[l].cargas.ToString();
            //                    dataRow["Cargas"] += " Tipo de Carga:  " + ListaRotas[l].cargas[cg].Carga.ToString() + " Quantidade: " + ListaRotas[l].cargas[cg].qty.ToString();
            //                }
            //            }

            //        }

            //        dataTable.Rows.Add(dataRow);
            //    }
            //    grdRotas.DataSource = dataTable;
            //    grdRotas.DataBind();




            //try
            //{
            DataTable Tabela = new DataTable();


            DataRow linha = Tabela.NewRow();
            int countr1 = 0;
            int countr2 = 0;
            int countc1 = 0;
            int countc2 = 0;
            int countv = 0;
            //qantity object
            for (int l = 0; l < ListaRotas.Count(); l++)
            {
                tblRotas.Rows.Add(new TableRow());

                //add colunm = 3
                for (int c = 0; c < 3; c++)
                {
                    //col 1
                    if (c == 0)
                    {
                        
                        if (l > 0)
                        {
                            countv = ListaRotas[l].veiculo.Count();
                        }
                        Tabela.Columns.Add($"Veículo{countv + 1}", typeof(string));
                        linha[$"Veículo{countv + 1}"] += ListaRotas[l].veiculo.ToString();
                     
                    }
                    //col 2
                    if (c == 1)
                    {
                        if (l > 0)
                        {
                            countr1 = ListaRotas[l].rotas[countr1].Count();
                            countr2 = ListaRotas[l].rotas[countr1].Count();
                        }
                        
                        //for (int cg = 0; cg < ListaRotas[l].Count(); cg++)
                        //{
                            Tabela.Columns.Add($"Ponto{countr1 + 1}", typeof(string));
                            Tabela.Columns.Add($"Ponto{countr1 + 2}", typeof(string));
                            Tabela.Columns.Add($"Ponto{ countr1 + 3}", typeof(string));
                            Tabela.Columns.Add($"Ponto{ countr1 + 4}", typeof(string));
                        //    countr1++;
                        //}
                            //ListaRotas[0].rotas[3] number of point
                        for (int rt = 0; rt < ListaRotas[l].rotas.Count(); rt++)
                        {

                            //add line when l == 0 and add value in col
                            //add value in col                          
                            linha[$"Ponto{countr2 + 1}"] += ListaRotas[l].rotas[rt].ToString();
                            countr2++;
                        }

                        //for (int v = 0; v < ListaRotas[l].rotas.Count(); v++)
                        //{

                        //}


                    }
                    //col 3
                    if (c == 2)
                    {
                       
                        if (l > 0)
                        {
                            countc1 = ListaRotas[l].cargas[countc1].Carga.Count();
                        }
                        
                        for (int cg = 0; cg < ListaRotas[l].cargas.Count(); cg++)
                        {
                            Tabela.Columns.Add($"Carga{(countc1 + 1)}", typeof(string));
                            Tabela.Columns.Add($"Quantidade{(countc1 + 1)}", typeof(string));
                            countc1++;
                        }
                        
                        for (int cg = 0; cg < ListaRotas[l].cargas.Count(); cg++)
                        {
                             
                            //add line
                            linha[$"Carga{(countc2 + 1)}"] = ListaRotas[l].cargas[countc2].Carga.ToString();
                            linha[$"Quantidade{ (countc2 + 1)}"] = ListaRotas[l].cargas[countc2].qty.ToString();
                            countc2++;

                        }

                        

                    }

                }

                Tabela.Rows.Add(linha);
            }
            grdRotas.DataSource = Tabela;
            grdRotas.DataBind();
            //}
            //catch
            //{
            //    Response.Redirect("principal.aspx");

            //}



        }



        public class Cargas
        {

            public string Carga { get; set; }
            public int qty { get; set; }
        }

        public class Root
        {

            public string veiculo { get; set; }
            public List<string> rotas { get; set; }
            public List<Cargas> cargas { get; set; }


        }
    }




}





