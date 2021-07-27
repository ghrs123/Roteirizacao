using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using System.IO;
using System.Web.UI.DataVisualization.Charting;
using iTextSharp.text.pdf;
using System.Threading;
//using System.Web;
//using System.Web.Services;
//using System.Web.UI;
//using System.Web.UI.WebControls;



namespace Roteirizacao
{
    public partial class historico_adm : System.Web.UI.Page
    {

        private static DataTable GetData(string query)
        {
            string constr = ConfigurationManager.ConnectionStrings["roteirizaçãoConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    return dt;
                }
            }
        }
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

        protected void rptViagem_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

            if (e.CommandName.Equals("btnEdit"))
            {
                string query1 = "", query2 = "", query3 = "", query4 = "", query5 = "", query6 = "", query7 = "";

                SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["roteirizaçãoConnectionString"].ConnectionString);
                myConn.Open();


                foreach (RepeaterItem item in rptViagem.Items)
                {
                    if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                    {
                        query1 = " UPDATE historico_viagem" +
                   " SET data_viagem ='" + ((TextBox)item.FindControl("tb_data")).Text + "'" +
                   " WHERE historico_viagem.historicoid =" + ((Button)item.FindControl("btnEdit")).CommandArgument;

                        query2 = " UPDATE camiao" +
                           " SET custoKm =" + ((TextBox)item.FindControl("tb_custokm")).Text + ", matricula ='" + ((TextBox)item.FindControl("tb_data")).Text + "'";
                        //" WHERE historico_viagem.historicoid =" + ((Button)item.FindControl("btnEdit")).CommandArgument;

                        query3 = " UPDATE carregar" +
                             " SET peso_carga =" + ((TextBox)item.FindControl("tb_peso_carga")).Text;
                        //" WHERE historico_viagem.historicoid =" + ((Button)item.FindControl("btnEdit")).CommandArgument;

                        query4 = " UPDATE produto" +
                           " SET descricao ='" + ((TextBox)item.FindControl("tb_descricao")).Text + "'";
                        //" WHERE historico_viagem.historicoid =" + ((Button)item.FindControl("btnEdit")).CommandArgument;

                        query5 = " UPDATE rota" +
                            " SET origem ='" + ((TextBox)item.FindControl("tb_origem")).Text + "'";
                        //" WHERE historico_viagem.historicoid =" + ((Button)item.FindControl("btnEdit")).CommandArgument;

                        query6 = " UPDATE entrega" +
                           " SET localEntrega ='" + ((TextBox)item.FindControl("tb_localEntrega")).Text + "'";
                        //" WHERE historico_viagem.historicoid =" + ((Button)item.FindControl("btnEdit")).CommandArgument;

                        query7 = " UPDATE coleta" +
                           " SET localColeta ='" + ((TextBox)item.FindControl("tb_localColeta")).Text + "'";
                        //" WHERE historico_viagem.historicoid =" + ((Button)item.FindControl("btnEdit")).CommandArgument;

                    }
                }


                SqlCommand myCommand1 = new SqlCommand(query1, myConn);
                SqlCommand myCommand2 = new SqlCommand(query2, myConn);
                SqlCommand myCommand3 = new SqlCommand(query3, myConn);
                SqlCommand myCommand4 = new SqlCommand(query4, myConn);
                SqlCommand myCommand5 = new SqlCommand(query5, myConn);
                SqlCommand myCommand6 = new SqlCommand(query6, myConn);
                SqlCommand myCommand7 = new SqlCommand(query7, myConn);

                myCommand1.ExecuteNonQuery();
                myCommand2.ExecuteNonQuery();
                myCommand3.ExecuteNonQuery();
                myCommand4.ExecuteNonQuery();
                myCommand5.ExecuteNonQuery();
                myCommand6.ExecuteNonQuery();
                myCommand7.ExecuteNonQuery();
                myConn.Close();

            }
        }

        protected void btnPdf_Click(object sender, EventArgs e)
        {

            string repeaterTable = "";


            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=Panel.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);

            Document Doc = new Document(PageSize.A4, 5f, 5f, 50f, 0f);
            HTMLWorker htmlparser = new HTMLWorker(Doc);
            PdfWriter.GetInstance(Doc, Response.OutputStream);
            Doc.Open();
            for (int i = 0; i < rptViagem.Items.Count; i++)
            {
                using (StringWriter sw = new StringWriter())
                {

                    using (HtmlTextWriter hw = new HtmlTextWriter(sw))
                    {
                        Doc.SetPageSize(new Rectangle(600, 300));
                        Doc.NewPage();
                        rptViagem.Items[i].RenderControl(hw);

                        repeaterTable = "<table>" +
                                            "<thead>" +
                                                "<tr>" +
                                                    "<th> Id </th >" +
                                                    "<th> Produto </th>" +
                                                    "<th> Peso Kg </th > " +
                                                    "<th> Origem </th > " +
                                                    "<th> Local Coleta</th >" +
                                                    "<th> Local de entrega</th >" +
                                                    "<th> Data</th >" +
                                                    "<th> Custo por Km</th >" +
                                                    "<th> Matrícula do Veículo</th >." +
                                                 "</tr> " +
                                             "</thead >" +
                                             "<tbody>" +
                                             sw.ToString() +
                                             "</ tbody >" +
                                          "</ table >";

                    }
                }


                StringWriter stringWriter = new StringWriter();
                HtmlTextWriter htmlTextWriter = new HtmlTextWriter(stringWriter);

                Panel1.RenderControl(htmlTextWriter);

                StringReader stringReader = new StringReader(repeaterTable.ToString());

                htmlparser.Parse(stringReader);
                Doc.Close();
                Response.Write(Doc);
                Response.End();
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            //string query1 = "", query2 = "", query3 = "", query4 = "", query5 = "", query6 = "", query7 = "";


            //SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["roteirizaçãoConnectionString"].ConnectionString);
            //myConn.Open();

            //foreach (RepeaterItem item in rptViagem.Items)
            //{
            //    if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
            //    {
            //        query1 = " UPDATE historico_viagem" +
            //   " SET data_viagem ='" + ((TextBox)item.FindControl("tb_data")).Text + "'" +
            //   " WHERE historico_viagem.historicoid ='" + ((Label)item.FindControl("Label1")).Text + "';";

            //        query2 = " UPDATE camiao" +
            //           " SET custoKm ='" + ((TextBox)item.FindControl("tb_custokm")).Text + ", matricula ='" + ((TextBox)item.FindControl("tb_data")).Text +
            //           " WHERE historico_viagem.historicoid ='" + ((Label)item.FindControl("Label1")).Text + "';";

            //        query3 = " UPDATE carregar" +
            //             " SET peso_carga =" + ((TextBox)item.FindControl("tb_peso_carga")).Text +
            //             " WHERE historico_viagem.historicoid ='" + ((Label)item.FindControl("Label1")).Text + "';";

            //        query4 = " UPDATE produto" +
            //           " SET descricao =" + ((TextBox)item.FindControl("tb_descicao")).Text +
            //           " WHERE historico_viagem.historicoid ='" + ((Label)item.FindControl("Label1")).Text + "';";

            //        query5 = " UPDATE rota" +
            //            " SET origem =" + ((TextBox)item.FindControl("tb_origem")).Text +
            //            " WHERE historico_viagem.historicoid ='" + ((Label)item.FindControl("Label1")).Text + "';";

            //        query6 = " UPDATE entrega" +
            //           " SET localEntrega =" + ((TextBox)item.FindControl("tb_localEntrega")).Text +
            //           " WHERE historico_viagem.historicoid ='" + ((Label)item.FindControl("Label1")).Text + "';";

            //        query7 = " UPDATE coleta" +
            //           " SET localColeta =" + ((TextBox)item.FindControl("tb_localColeta")).Text +
            //           " WHERE historico_viagem.historicoid ='" + ((Label)item.FindControl("Label1")).Text + "';";

            //    }
            //}
            //SqlCommand myCommand1 = new SqlCommand(query1, myConn);
            //SqlCommand myCommand2 = new SqlCommand(query2, myConn);
            //SqlCommand myCommand3 = new SqlCommand(query3, myConn);
            //SqlCommand myCommand4 = new SqlCommand(query4, myConn);
            //SqlCommand myCommand5 = new SqlCommand(query5, myConn);
            //SqlCommand myCommand6 = new SqlCommand(query6, myConn);
            //SqlCommand myCommand7 = new SqlCommand(query7, myConn);

            //myCommand1.ExecuteNonQuery();
            //myCommand2.ExecuteNonQuery();
            //myCommand3.ExecuteNonQuery();
            //myCommand4.ExecuteNonQuery();
            //myCommand5.ExecuteNonQuery();
            //myCommand6.ExecuteNonQuery();
            //myCommand7.ExecuteNonQuery();
            //myConn.Close();

        }



        protected void rptViagem_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRowView dr = (DataRowView)e.Item.DataItem;
                ((Label)e.Item.FindControl("lbl_historidoid")).Text = dr["historicoid"].ToString();
                ((Label)e.Item.FindControl("tb_descricao")).Text = dr["descricao"].ToString();
                ((Label)e.Item.FindControl("tb_peso_carga")).Text = dr["peso_carga"].ToString();
                ((Label)e.Item.FindControl("tb_origem")).Text = dr["origem"].ToString();
                ((Label)e.Item.FindControl("tb_localColeta")).Text = dr["localColeta"].ToString();
                ((Label)e.Item.FindControl("tb_localEntrega")).Text = dr["localEntrega"].ToString();
                ((Label)e.Item.FindControl("tb_data")).Text = dr["data"].ToString();
                ((Label)e.Item.FindControl("tb_custokm")).Text = dr["custoKm"].ToString();
                ((Label)e.Item.FindControl("tb_matricula")).Text = dr["matricula"].ToString();
                //((Button)e.Item.FindControl("btnEdit")).CommandArgument = dr["historicoid"].ToString();
                //((Button)e.Item.FindControl("btnDelete")).CommandArgument = dr["historicoid"].ToString();
            }
        }

        protected void rptUtilizador_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (!IsPostBack)
            {
                if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
                {
                    DataRowView dr = (DataRowView)e.Item.DataItem;
                    ((Label)e.Item.FindControl("lbl_id")).Text = dr["utilizadorid"].ToString();
                    ((TextBox)e.Item.FindControl("tb_nome")).Text = dr["nome"].ToString();
                    ((TextBox)e.Item.FindControl("tb_apelido")).Text = dr["apelido"].ToString();
                    ((TextBox)e.Item.FindControl("tb_username")).Text = dr["username"].ToString();
                    ((TextBox)e.Item.FindControl("tb_email")).Text = dr["email"].ToString();
                    ((TextBox)e.Item.FindControl("tb_pais")).Text = dr["pais"].ToString();
                    ((TextBox)e.Item.FindControl("tb_cidade")).Text = dr["cidade"].ToString();
                    ((TextBox)e.Item.FindControl("tb_cod_postal")).Text = dr["cod_postal"].ToString();
                    ((TextBox)e.Item.FindControl("tb_morada")).Text = dr["morada"].ToString();
                    ((Button)e.Item.FindControl("btnEdit")).CommandArgument = dr["utilizadorid"].ToString();

                }
            }

           
        }

        protected void rptUtilizador_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName.Equals("btnEdit"))
            {
            
                SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["roteirizaçãoConnectionString"].ConnectionString);

                SqlCommand myCommand = new SqlCommand();
                myConn.Open();

                myCommand.Parameters.AddWithValue("@username", ((TextBox)e.Item.FindControl("tb_username")).Text);
                myCommand.Parameters.AddWithValue("@nome", ((TextBox)e.Item.FindControl("tb_nome")).Text);
                myCommand.Parameters.AddWithValue("@apelido", ((TextBox)e.Item.FindControl("tb_apelido")).Text);
                myCommand.Parameters.AddWithValue("@email", ((TextBox)e.Item.FindControl("tb_email")).Text);
                myCommand.Parameters.AddWithValue("@morada", ((TextBox)e.Item.FindControl("tb_morada")).Text);
                myCommand.Parameters.AddWithValue("@cidade", ((TextBox)e.Item.FindControl("tb_cidade")).Text);
                myCommand.Parameters.AddWithValue("@pais", ((TextBox)e.Item.FindControl("tb_pais")).Text);
                myCommand.Parameters.AddWithValue("@cod_postal", ((TextBox)e.Item.FindControl("tb_cod_postal")).Text);

                SqlParameter valor = new SqlParameter();
                valor.ParameterName = "@retorno";
                valor.Direction = ParameterDirection.Output;
                valor.SqlDbType = SqlDbType.Int;
                myCommand.Parameters.Add(valor);

                myCommand.CommandType = CommandType.StoredProcedure;
                myCommand.CommandText = "atualizar_dados";

                
                myCommand.Connection = myConn;

                myCommand.ExecuteNonQuery();
                int repostaSP = Convert.ToInt32(myCommand.Parameters["@retorno"].Value);

                myConn.Close();

                if (repostaSP == 1)
                {

                    lblMsg.Text  = "Dados Atualizados!";
                    
                }
                else
                {
                    lblMsg.Text = "Já existe esse utilizador.";
                    //Response.Redirect("historico_adm.aspx");
                }

                myConn.Close();

               
            }


            if (e.CommandName.Equals("btnDelete"))
            {
               

                SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["roteirizaçãoConnectionString"].ConnectionString);

                SqlCommand myCommand = new SqlCommand();
                myConn.Open();

                myCommand.Parameters.AddWithValue("@utilizadorid", ((Label)e.Item.FindControl("lbl_id")).Text);


                SqlParameter valor = new SqlParameter();
                valor.ParameterName = "@retorno";

                valor.Direction = ParameterDirection.Output;
                valor.SqlDbType = SqlDbType.Int;
                myCommand.Parameters.Add(valor);

                myCommand.CommandType = CommandType.StoredProcedure;
                myCommand.CommandText = "delete_utilizador";


                myCommand.Connection = myConn;

                myCommand.ExecuteNonQuery();
                int repostaSP = Convert.ToInt32(myCommand.Parameters["@retorno"].Value);

                myConn.Close();

                if (repostaSP == 1)
                {

                    lblMsg.Text = "Conta excluida!";

                }
                else
                {
                    lblMsg.Text = "Essa utilizador não existe!";
                   Response.Redirect("historico_adm.aspx");
                    
                }

        
                //string query1 = " DELETE FROM dados_utilizador WHERE utilizadorid=" + ((Label)e.Item.FindControl("lbl_id")).Text + ";";
                //string query2 = " DELETE FROM imagem WHERE utilizadorid=" + ((Label)e.Item.FindControl("lbl_id")).Text + ";";
                //string query3 = " DELETE FROM historico_viagem WHERE utilizadorid=" + ((Label)e.Item.FindControl("lbl_id")).Text + ";";
                //string query4 = " DELETE FROM camiao WHERE utilizadorid=" + ((Label)e.Item.FindControl("lbl_id")).Text + ";";
                //string query5 = " DELETE FROM recuperar_pass WHERE utilizadorid=" + ((Label)e.Item.FindControl("lbl_id")).Text + ";";
                //string query6 = " DELETE FROM utilizador WHERE utilizadorid=" + ((Label)e.Item.FindControl("lbl_id")).Text + ";";

                //SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["roteirizaçãoConnectionString"].ConnectionString);
                //myConn.Open();
                //SqlCommand myCommand = new SqlCommand(query1, myConn);
                //myCommand.ExecuteNonQuery();
                //Thread.Sleep(500);
                //SqlCommand myCommand2 = new SqlCommand(query2, myConn);
                //myCommand2.ExecuteNonQuery();
                //Thread.Sleep(500);
                //SqlCommand myCommand3 = new SqlCommand(query3, myConn);
                //myCommand3.ExecuteNonQuery();
                //SqlCommand myCommand4 = new SqlCommand(query4, myConn);
                //myCommand4.ExecuteNonQuery();
                //Thread.Sleep(500);
                //SqlCommand myCommand5 = new SqlCommand(query5, myConn);
                //myCommand5.ExecuteNonQuery();
                //Thread.Sleep(500);
                //SqlCommand myCommand6 = new SqlCommand(query6, myConn);
                //myCommand6.ExecuteNonQuery();
                myConn.Close();
                
            }
        }

        protected void RptCamiao_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName.Equals("btnEditC"))
            {

                string query1 = " UPDATE camiao SET matricula ='" + ((TextBox)e.Item.FindControl("tb_matric")).Text + "',quilometragem ='" + ((TextBox)e.Item.FindControl("tb_quilometro")).Text + "', custoKm ='" + ((TextBox)e.Item.FindControl("tb_custKm")).Text + "', capacidade ='" + ((TextBox)e.Item.FindControl("tb_capacidade")).Text + "', " +
                    " tipocamiaoid = (Select tipo_camiaoid from tipo_camiao WHERE tipo_camiaoid = " + ((DropDownList)e.Item.FindControl("ddlTipoCamiao")).SelectedValue + "), utilizadorid =" + ((DropDownList)e.Item.FindControl("ddlMotorista")).SelectedValue +
                    " WHERE camiaoid = " + ((Label)e.Item.FindControl("lblIdCamiao")).Text + ";";

                SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["roteirizaçãoConnectionString"].ConnectionString);
                myConn.Open();

                SqlCommand myCommand1 = new SqlCommand(query1, myConn);

                myCommand1.ExecuteNonQuery();

                myConn.Close();

            }
        }

        protected void RptCamiao_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRowView dr = (DataRowView)e.Item.DataItem;
                ((Label)e.Item.FindControl("lblIdCamiao")).Text = dr["camiaoid"].ToString();
                ((TextBox)e.Item.FindControl("tb_matric")).Text = dr["matricula"].ToString();
                ((TextBox)e.Item.FindControl("tb_quilometro")).Text = dr["quilometragem"].ToString();
                ((TextBox)e.Item.FindControl("tb_custKm")).Text = dr["custoKm"].ToString();
                ((TextBox)e.Item.FindControl("tb_capacidade")).Text = dr["capacidade"].ToString();
                ((Button)e.Item.FindControl("btnEditC")).CommandArgument = dr["camiaoid"].ToString();
                ((Button)e.Item.FindControl("btnDeleteC")).CommandArgument = dr["camiaoid"].ToString();
            }
        }

        protected void btnAddtipo_Click(object sender, EventArgs e)
        {
            if (tb_tipoCamiao.Text != "")
            {
                // string query = " INSERT INTO tipo_camiao(descricao) VALUES('" + tb_tipoCamiao.Text + "');";
                SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["roteirizaçãoConnectionString"].ConnectionString);

                myConn.Open();

                //string query = " INSERT INTO camiao(matricula,quilometragem,custoKm,capacidade,tipocamiaoid,utilizadorid)" +
                //    " VALUES ('" + tbMatricula.Text + "','" + tbKm.Text + "'," + tbCusto.Text + "," + tbCap.Text + "," + ddlTipocC.SelectedValue + "," + ddlMoto.SelectedValue + ");";

                SqlCommand myCommand = new SqlCommand();

                myCommand.Parameters.AddWithValue("@descricao", tb_tipoCamiao.Text);


                SqlParameter valor = new SqlParameter();
                valor.ParameterName = "@retorno";
                valor.Direction = ParameterDirection.Output;
                valor.SqlDbType = SqlDbType.Int;
                myCommand.Parameters.Add(valor);

                myCommand.CommandType = CommandType.StoredProcedure;
                myCommand.CommandText = "inserir_tipoCamiao";


                myCommand.Connection = myConn;

                myCommand.ExecuteNonQuery();
                int repostaSP = Convert.ToInt32(myCommand.Parameters["@retorno"].Value);

                myConn.Close();

                if (repostaSP == 1)
                {

                    lblMensagem.Text = "Esse tipo de camião já existe!";
                   
                }
                else
                {
                    lblMensagem.Text = "Tipo de camião inserido!";
                   
                   
                }

            }
        }




        protected void btnAddC_Click1(object sender, EventArgs e)
        {
            SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["roteirizaçãoConnectionString"].ConnectionString);
            myConn.Open();

            //string query = " INSERT INTO camiao(matricula,quilometragem,custoKm,capacidade,tipocamiaoid,utilizadorid)" +
            //    " VALUES ('" + tbMatricula.Text + "','" + tbKm.Text + "'," + tbCusto.Text + "," + tbCap.Text + "," + ddlTipocC.SelectedValue + "," + ddlMoto.SelectedValue + ");";

            SqlCommand myCommand = new SqlCommand();

            myCommand.Parameters.AddWithValue("@matricula", tbMatricula.Text);
            myCommand.Parameters.AddWithValue("@quilometragem", tbKm.Text);
            myCommand.Parameters.AddWithValue("@custoKm", tbCusto.Text);
            myCommand.Parameters.AddWithValue("@capacidade", tbCap.Text);
            myCommand.Parameters.AddWithValue("@tipocamiaoid", ddlTipocC.SelectedValue);
            myCommand.Parameters.AddWithValue("@utilizadorid", ddlMoto.SelectedValue);

            SqlParameter valor = new SqlParameter();
            valor.ParameterName = "@retorno";
            valor.Direction = ParameterDirection.Output;
            valor.SqlDbType = SqlDbType.Int;
            myCommand.Parameters.Add(valor);

            myCommand.CommandType = CommandType.StoredProcedure;
            myCommand.CommandText = "inserir_camiao";


            myCommand.Connection = myConn;

            myCommand.ExecuteNonQuery();
            int repostaSP = Convert.ToInt32(myCommand.Parameters["@retorno"].Value);

            myConn.Close();

            if (repostaSP == 1)
            {
                lblMensagem.Text = "Camião já está registado!";
            }
            else
            {
                lblMensagem.Text = "Camião registado!";
                Thread.Sleep(2000);
                Response.Redirect("historico_adm.aspx");
            }


        }


        //private void BindRepeaterUtilizador()
        //{
        //    string constr = ConfigurationManager.ConnectionStrings["roteirizaçãoConnectionString"].ConnectionString;
        //    using (SqlConnection con = new SqlConnection(constr))
        //    {
        //        using (SqlCommand cmd = new SqlCommand(" SELECT utilizador.utilizadorid, utilizador.nome, utilizador.apelido, utilizador.username, utilizador.email, dados_utilizador.pais, dados_utilizador.cidade, dados_utilizador.morada, dados_utilizador.cod_postal" +
        //            "  FROM utilizador" +
        //            "  INNER JOIN dados_utilizador ON dados_utilizador.utilizadorid = utilizador.utilizadorid" +
        //            "  ORDER BY utilizadorid", con))
        //        {
        //            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
        //            {
        //                DataTable dt = new DataTable();
        //                sda.Fill(dt);
        //                rptUtilizador.DataSource = dt;
        //                rptUtilizador.DataBind();
        //            }
        //        }
        //    }
        //}
    }
}