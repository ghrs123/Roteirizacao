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
                Tabela.Columns.Add("Veículo", typeof(string));
                Tabela.Columns.Add("Rotas", typeof(string));
                Tabela.Columns.Add("Cargas", typeof(string));

                DataRow linha = Tabela.NewRow();
                int count = 0;
                //quantidade veiculo
                for (int l = 0; l < ListaRotas.Count(); l++)
                {
                    tblRotas.Rows.Add(new TableRow());
                    //add veículo

                    for (int c = 0; c < 3; c++)
                    {
                        tblRotas.Rows.Add(new TableRow());


                        if (c == 0)
                        {

                            //add veicules
                            linha["Veículo"] = ListaRotas[l].veiculo.ToString();
                        }

                        if (c == 1)
                        {
                            //add Routes

                            for (int v = 0; v < ListaRotas.Count(); v++)
                            {

                                if (v > 1)
                                {
                                    count = ListaRotas[l].rotas.Count() + 1;
                                }

                                linha["Rotas"] = $"{Tabela.Columns.Add($"Ponto{count + 1}", typeof(string))}" + $"{Tabela.Columns.Add($"Ponto{count + 2}", typeof(string))}" + $"{Tabela.Columns.Add($"Ponto{ count + 3}", typeof(string))}" + $"{Tabela.Columns.Add($"Ponto{ count + 4}", typeof(string))}";

                                for (int rt = 0; rt < ListaRotas[l].rotas.Count(); rt++)
                                {
                                    //add line                           
                                    linha[$"Ponto{rt + 1}"] = ListaRotas[l].rotas[rt].ToString();
                                }


                            }

                        }
                        if (c == 2)
                        {

                            //add carga and quatity
                            for (int cg = 0; cg < ListaRotas[l].cargas.Count; cg++)
                            {   //add colunms

                                //lRotas.Rows[l].Cells[c].Text = ListaRotas[l].cargas[cg].ToString();
                                linha["Cargas"] = Tabela.Columns.Add($"Carga{(cg + 1)}", typeof(string));
                                linha["Cargas"] = Tabela.Columns.Add($"Quantidade{(cg + 1)}", typeof(string));
                            }

                            for (int cg = 0; cg < ListaRotas[l].cargas.Count; cg++)
                            {   //add line
                                linha[$"Carga{(cg + 1)}"] += ListaRotas[l].cargas[cg].Carga.ToString();
                                linha[$"Quantidade{ (cg + 1)}"] += ListaRotas[l].cargas[cg].qty.ToString();
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