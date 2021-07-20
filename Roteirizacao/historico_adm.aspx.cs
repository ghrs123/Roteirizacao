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
using iTextSharp.text.pdf;

namespace Roteirizacao
{
    public partial class historico_adm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["util"] == null)
            {
                Session.Clear();
                Session.Abandon();
                Response.Redirect("principal.aspx");

            }

            //string query = " SELECT historicoid , descricao, peso_carga, origem,localColeta, localEntrega, convert(char(10), data_viagem, 103) 'data',Cast(CONVERT(DECIMAL(10,2),custoKm) as nvarchar) AS custoKm, matricula" +
            //    " FROM historico_viagem" +
            //    " JOIN camiao ON historico_viagem.camiaoid = camiao.camiaoid" +
            //    " JOIN carregar ON carregar.camiaoid = camiao.camiaoid" +
            //    " JOIN produto ON produto.produtoid = carregar.produtoid" +
            //    " JOIN rota ON rota.rotaid = carregar.rotaid" +
            //    " JOIN entrega ON entrega.rotaid = rota.rotaid" +
            //    " JOIN coleta ON coleta.rotaid = rota.rotaid;";

            //SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["roteirizaçãoConnectionString"].ConnectionString);
            //myConn.Open();

            //SqlCommand myCommand = new SqlCommand(query, myConn);
            //DataTable historico = new DataTable();
            //SqlDataAdapter adp = new SqlDataAdapter(myCommand);

            //adp.Fill(historico);

            //rptViagem.DataSource = historico;
            //rptViagem.DataBind();


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
                   " SET data_viagem ='" + ((TextBox)item.FindControl("tb_data")).Text + "'"+ 
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
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem )
            {
                DataRowView dr = (DataRowView)e.Item.DataItem;
                ((Label)e.Item.FindControl("lbl_historidoid")).Text = dr["historicoid"].ToString();
                ((TextBox)e.Item.FindControl("tb_descricao")).Text = dr["descricao"].ToString();
                ((TextBox)e.Item.FindControl("tb_peso_carga")).Text = dr["peso_carga"].ToString();
                ((TextBox)e.Item.FindControl("tb_origem")).Text = dr["origem"].ToString();
                ((TextBox)e.Item.FindControl("tb_localColeta")).Text = dr["localColeta"].ToString();
                ((TextBox)e.Item.FindControl("tb_localEntrega")).Text = dr["localEntrega"].ToString();
                ((TextBox)e.Item.FindControl("tb_data")).Text = dr["data"].ToString();
                ((TextBox)e.Item.FindControl("tb_custokm")).Text = dr["custoKm"].ToString();
                ((TextBox)e.Item.FindControl("tb_matricula")).Text = dr["matricula"].ToString();
                ((Button)e.Item.FindControl("btnEdit")).CommandArgument = dr["historicoid"].ToString();
                ((Button)e.Item.FindControl("btnDelete")).CommandArgument = dr["historicoid"].ToString();
            }
        }

        protected void rptUtilizador_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRowView dr = (DataRowView)e.Item.DataItem;
                ((Label)e.Item.FindControl("lbl_id")).Text = dr["utilizadorid"].ToString();
                ((TextBox)e.Item.FindControl("tb_nome")).Text = dr["nome"].ToString();
                ((TextBox)e.Item.FindControl("tb_apelido")).Text = dr["apelido"].ToString();
                ((TextBox)e.Item.FindControl("tb_email")).Text = dr["email"].ToString();
                ((TextBox)e.Item.FindControl("tb_pais")).Text = dr["pais"].ToString();
                ((TextBox)e.Item.FindControl("tb_cidade")).Text = dr["cidade"].ToString();
                ((TextBox)e.Item.FindControl("tb_cod_postal")).Text = dr["cod_postal"].ToString();
                ((TextBox)e.Item.FindControl("tb_morada")).Text = dr["morada"].ToString();
                ((Button)e.Item.FindControl("btnEdit")).CommandArgument = dr["utilizadorid"].ToString();
               
            }
        }

        protected void rptUtilizador_ItemCommand(object source, RepeaterCommandEventArgs e)
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



    }
}