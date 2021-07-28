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
                //    DataTable dataTable = new DataTable();
                //    DataRow dataRow = null;
                //    dataTable.Columns.Add("Veiculo");
                //    dataTable.Columns.Add("Rotas");
                //    dataTable.Columns.Add("Cargas");


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


                DataTable Tabela = new DataTable();
                Tabela.Columns.Add("Veículo", typeof(string));
                Tabela.Columns.Add("Rotas", typeof(string));
                Tabela.Columns.Add("Cargas", typeof(string));

                DataRow linha = Tabela.NewRow();

                //quantidade veiculo
                for (int l = 0; l < ListaRotas.Count(); l++)
                {
                    tblRotas.Rows.Add(new TableRow());
                    //add veículo

                    for (int c = 0; c < 3; c++)
                    {

                        if (c == 0)
                        {
                         
                            //add veicules
                            linha["Veículo"] = ListaRotas[l].veiculo.ToString();
                        }

                        if (c == 1)
                        {
                            //add Routes
                            for (int rt = 0; rt < ListaRotas[l].rotas.Count(); rt++)
                            {

                                //add colunms
                                tblRotas.Rows[l].Cells[c].Text = ListaRotas[l].rotas[rt].ToString();
                                linha["Rotas"] = Tabela.Columns.Add($"Ponto{(rt + 1)}: ", typeof(string));
                            }

                            for (int rt = 0; rt < ListaRotas[l].rotas.Count(); rt++)
                            {
                                //add line                           
                                linha[$"Ponto{(rt + 1)}"] = ListaRotas[l].rotas[rt].ToString();
                            }

                        }
                        if (c == 2)
                        {

                            //add carga and quatity
                            for (int cg = 0; cg < ListaRotas[l].cargas.Count; cg++)
                            {   //add colunms
                                tblRotas.Rows[c].Cells[cg].Text = ListaRotas[l].rotas[cg].ToString();
                                linha["Cargas"] = Tabela.Columns.Add($"Carga{(cg + 1)}: ", typeof(string));
                                linha["Cargas"] = Tabela.Columns.Add($"Quantidade{(cg + 1)}: ", typeof(string));
                            }

                            for (int cg = 0; cg < ListaRotas[l].cargas.Count; cg++)
                            {   //add line
                                linha["Cargas"] += " Tipo de Carga:  " + ListaRotas[l].cargas[cg].Carga.ToString();
                                linha["Cargas"] += " Quantidade: " + ListaRotas[l].cargas[cg].qty.ToString();
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
                Response.Redirect("principal_user.aspx");
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
