using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Web.Script.Serialization;
using System.Windows.Forms;

namespace Roteirizacao
{
    public partial class principal_user : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["util"] == null)
            {
                Session.Clear();
                Session.Abandon();
                Response.Redirect("principal.aspx");

            }
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


            //quantity of items in the first line veiculo,carga and rota(s)
            for (int l = 0; l < ListaRotas.Count(); l++)
            {
                //add a line
                tblRotas.Rows.Add(new TableRow());

                // for colunm
                for (int c = 0; c < 3; c++)
                {
                    //col veículo
                    tblRotas.Rows[l].Cells.Add(new TableCell());

                    if (c == 0)
                    {
                        // tblRotas.Rows[l].Cells[c].Text = rota.veiculo.ToString();
                        //add ol veiculo
                        tblRotas.Rows[l].Cells[c].Text = ListaRotas[l].veiculo.ToString();
                    }

                    //if (l == Convert.ToInt32(ListaRotas[0].rotas[l].ToString()) && ListaRotas[0].rotas.Count() > 1)
                    //for colun rotas
                    if (c == 1)
                    {
                        for (int r = 0; r < ListaRotas[l].rotas.Count(); r++)
                        {
                            tblRotas.Rows[l].Cells[c].Text = ListaRotas[l].rotas[r].ToString();
                           
                            //MessageBox.Show($"Rota{(r + 1)}:" + ListaRotas[0].rotas[r].ToString());
                            //rt += ListaRotas[i].rotas[r].ToString() + "   ";
                            ////Response.Write(ListaRotas[0].rotas[r].ToString());

                        }
                     
                    }
                    //for colun of cargas
                    // if(l == Convert.ToInt32(ListaRotas[0].cargas[l].ToString()) && ListaRotas[0].cargas.Count() > 1)
                    if (c == 2)
                    {
                        for (int cg = 0; cg < ListaRotas[l].cargas.Count(); cg++)
                        {
                            //carga
                            

                            tblRotas.Rows[l].Cells[c].Text = ListaRotas[l].cargas[cg].Carga.ToString();

                            tblRotas.Rows[l].Cells[c].Text = ListaRotas[l].cargas[cg].qty.ToString();
                        }
                    }

                }


            }

        }




        //<table class="table table-bordered table-hover table-condensed">
        //    <thead>
        //       <tr>
        //     <th title="Field #1">veiculo</th>
        //     <th title="Field #2">rotas/0</th>
        //     <th title="Field #3">rotas/1</th>
        //     <th title="Field #4">rotas/2</th>
        //     <th title="Field #5">rotas/3</th>
        //     <th title="Field #6">cargas/0/Carga</th>
        //     <th title="Field #7">cargas/0/qty</th>
        //       </tr>
        //    </thead>
        //    <tbody>
        //        <tr>
        //     <td>34</td>
        //     <td>aveiro-portugal</td>
        //     <td>lisboa-portugal</td>
        //     <td>sintra-portugal</td>
        //     <td>aveiro-portugal</td>
        //     <td>asdasd</td>
        //     <td align="right">123</td>
        //         </tr>
        //         <tr>
        //     <td>truck</td>
        //     <td>aveiro-portugal</td>
        //     <td>lisboa-portugal</td>
        //     <td>sintra-portugal</td>
        //     <td>aveiro-portugal</td>
        //     <td> </td>
        //     <td align="right"></td>
        //     </tr>
        //    </tbody>
        //    </table>

        //  string b = "";




        //int qtd_veiculos = jObject["veiculo"].Count();
        // int qtd_rotas = jObject["rotas"].ToArray().Count();
        //int qtd_cargas = jObject["cargas"].ToArray().Count();
        //Console.WriteLine(qtd_veiculos);
        //Console.WriteLine(qtd_rotas);
        //Console.WriteLine(qtd_cargas);
        //Console.ReadKey();


        //for (int i = 0; i < ((object[])a).GetLength(0); i++)
        //{
        //    for (int k= 0; k < ((object[])a).GetLength(1); k++)
        //    {

        //        //((object[])a)[i].Items[0].ToString();

        //        //((object[])a)[i].Items[k].ToString();
        //        //((object[])a)[i].Items[k].ToString();
        //        //   var veiculo = ((object[])a)[i][0];
        //    }


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
