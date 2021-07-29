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
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

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

            try
            {


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
                            //for (int vc = 0;vc < ListaRotas[l].veiculo.Count(); vc++)
                            //{

                            //    //add line when l == 0 and add value in col
                            //    //add value in col                          
                            //    linha[$"Veiculo{countr2 + 1}"] += ListaRotas[l].rotas[vc].ToString();
                            //    countv++;
                            //}
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



                //DataTable Tabela = new DataTable();
                //Tabela.Columns.Add("Veículo", typeof(string));
                //Tabela.Columns.Add("Rotas", typeof(string));
                //Tabela.Columns.Add("Cargas", typeof(string));

                //DataRow linha = Tabela.NewRow();

                ////quantidade veiculo
                //for (int l = 0; l < ListaRotas.Count(); l++)
                //{
                //    tblRotas.Rows.Add(new TableRow());
                //    //add veículo

                //    for (int c = 0; c < 3; c++)
                //    {

                //        if (c == 0)
                //        {

                //            //add veicules
                //            linha["Veículo"] = ListaRotas[l].veiculo.ToString();
                //        }

                //        if (c == 1)
                //        {
                //            //add Routes
                //            for (int rt = 0; rt < ListaRotas[l].rotas.Count(); rt++)
                //            {

                //                //add colunms
                //                tblRotas.Rows[l].Cells[c].Text = ListaRotas[l].rotas[rt].ToString();
                //                linha["Rotas"] = Tabela.Columns.Add($"Ponto{(rt + 1)}: ", typeof(string));
                //            }

                //            for (int rt = 0; rt < ListaRotas[l].rotas.Count(); rt++)
                //            {
                //                //add line                           
                //                linha[$"Ponto{(rt + 1)}"] = ListaRotas[l].rotas[rt].ToString();
                //            }

                //        }
                //        if (c == 2)
                //        {

                //            //add carga and quatity
                //            for (int cg = 0; cg < ListaRotas[l].cargas.Count; cg++)
                //            {   //add colunms
                //                tblRotas.Rows[c].Cells[cg].Text = ListaRotas[l].rotas[cg].ToString();
                //                linha["Cargas"] = Tabela.Columns.Add($"Carga{(cg + 1)}: ", typeof(string));
                //                linha["Cargas"] = Tabela.Columns.Add($"Quantidade{(cg + 1)}: ", typeof(string));
                //            }

                //            for (int cg = 0; cg < ListaRotas[l].cargas.Count; cg++)
                //            {   //add line
                //                linha["Cargas"] += " Tipo de Carga:  " + ListaRotas[l].cargas[cg].Carga.ToString();
                //                linha["Cargas"] += " Quantidade: " + ListaRotas[l].cargas[cg].qty.ToString();
                //            }
                //        }

                //    }

                //    Tabela.Rows.Add(linha);
                //}
                //grdRotas.DataSource = Tabela;
                //grdRotas.DataBind();


            }
            catch
            {
                Response.Redirect("principal_user.aspx");
            }

            try
            {

                string xpto = tb_resp.Value;


                string str = xpto;
                xpto.TrimStart(new char[] { '[' }).TrimEnd(new char[] { ']' });

                JavaScriptSerializer j = new JavaScriptSerializer();

                List<Root> ListaRotas = j.Deserialize<List<Root>>(xpto);


                string veiculo = "";
                string origem = "", recolha = "", entrega = "";
                double quantidade = 0;
                string carga = "";

                for (int c = 0; c < ListaRotas.Count; c++)
                {

                    veiculo = ListaRotas[c].veiculo.ToString();

                    origem = ListaRotas[c].rotas[0].ToString();
                    recolha = ListaRotas[c].rotas[1].ToString();
                    entrega = ListaRotas[c].rotas[2].ToString();

                   
                        
                        quantidade = Convert.ToDouble(ListaRotas[c].cargas[0].qty.ToString());
                    
            
                    carga = ListaRotas[c].cargas[0].Carga.ToString();


                }








                //   INSERT INTO historico_viagem (data_viagem, camiaoid,rotaid,utilizadorid) VALUES ((SELECT CAST(GETDATE() AS Date )),@camiaoid,@rotaValor,@utilizadorid)

                //INSERT INTO coleta (localColeta, rotaid) VALUES (@localColeta,@rotaValor)

                //INSERT INTO entrega(localEntrega, rotaid) VALUES (@localEntrega,@rotaValor)

                //INSERT INTO produto(descricao, peso_total) VALUES (@descricao,@peso_total);

                //INSERT INTO carregar(produtoid, camiaoid,peso_carga,rotaid)	VALUES (@prodVal,@camiaoid,@peso_carga,@rotaValor);

                //INSERT INTO entrega_coleta(coletaid, entregaid)	VALUES (@coletaVal,@entregaVal,@carregarVal);

            }
            catch
            {

            }


        }
        private void InsertRota()
        {
            Root rota = new Root();
            SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["roteirizaçãoConnectionString"].ConnectionString);
            SqlCommand myCommand = new SqlCommand();


            myCommand.Parameters.AddWithValue("@carga", rota.cargas[0].ToString());
            myCommand.Parameters.AddWithValue("@quantidade", rota.cargas[1].ToString());
            myCommand.Parameters.AddWithValue("@origem", rota.rotas[0].ToString());
            myCommand.Parameters.AddWithValue("@recolha", rota.rotas[1].ToString());
            myCommand.Parameters.AddWithValue("@entrega", rota.rotas[2].ToString());
            myCommand.Parameters.AddWithValue("@veiculo", rota.veiculo.ToString());
            myCommand.Parameters.AddWithValue("@utilizador", Session["util"].ToString());


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
                //enviarEmail();


                //tb_email.Value = "";
                //tb_apelido.Value = "";
                //tb_nome.Value = "";
                //tb_pw.Value = "";
                //tb_user.Value = "";

                //lbl_mensagem.Text = "Utilzador registado com sucesso!";


            }
            else if (repostaSP == 2)
            {
                //lbl_mensagem.Text = "Utilzador já existe.";

            }
            else if (repostaSP == 3)
            {
                //    lbl_mensagem.Text = "Email já existe.";
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
