using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Roteirizacao
{
    public partial class principal_adm : System.Web.UI.Page
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

        protected void btn_sair_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("principal.aspx");
        }

        protected void btn_log_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("principal.aspx");
        }

        protected void btnRegistarRota_Click(object sender, EventArgs e)
        {

            try
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
                                //Tabela.Columns.Add($"Carga{(countc1 + 1)}", typeof(string));
                                //Tabela.Columns.Add($"Quantidade{(countc1 + 1)}", typeof(string));
                                //countc1++;
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
               
            }
            catch
            {
                Response.Redirect("principal_adm.aspx");
            }
            

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