using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iTextSharp.text;
using iTextSharp.text.html;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
using System.Net;
using System.Text;


namespace Roteirizacao
{
    public partial class historico_util : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["util"] == null)
            {
                Session.Clear();
                Session.Abandon();
                Response.Redirect("principal.aspx");

            }



            string query = " SELECT historicoid , descricao, peso_carga, origem,localColeta, localEntrega, convert(char(10), data_viagem, 103) 'data',Cast(CONVERT(DECIMAL(10,2),custoKm) as nvarchar) AS custoKm, matricula" +
                " FROM historico_viagem" +
                " JOIN camiao ON historico_viagem.camiaoid = camiao.camiaoid" +
                " JOIN carregar ON carregar.camiaoid = camiao.camiaoid" +
                " JOIN produto ON produto.produtoid = carregar.produtoid" +
                " JOIN rota ON rota.rotaid = carregar.rotaid" +
                " JOIN entrega ON entrega.rotaid = rota.rotaid" +
                " JOIN coleta ON coleta.rotaid = rota.rotaid" +
                " INNER JOIN utilizador ON utilizador.utilizadorid = historico_viagem.utilizadorid" +
                " WHERE utilizador.username ='" + Session["util"] + "' OR email ='" + Session["util"] + "';";

            SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["roteirizaçãoConnectionString"].ConnectionString);
            myConn.Open();

            SqlCommand myCommand = new SqlCommand(query, myConn);
            DataTable historico = new DataTable();
            SqlDataAdapter adp = new SqlDataAdapter(myCommand);

            adp.Fill(historico);

            rptViagem.DataSource = historico;
            rptViagem.DataBind();

        }
        public override void VerifyRenderingInServerForm(Control control)
        {
        }

        protected void btn_log_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("principal.aspx");
        }



        protected void btn_sair_Click1(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("principal.aspx");
        }




        protected void rptViagem_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

            if (e.CommandName.Equals("btnPdf"))
            {

                Response.Redirect("historico_util.aspx");


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
                                              "<tbody>";
                        for (int j = 0; j < rptViagem.Items.Count; j++)
                        {
                            repeaterTable += sw.ToString();
                        }
                        repeaterTable += "</ tbody >" +
                                      "</ table >";

                    }
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


        protected void dtlCamiao_ItemDataBound(object sender, DataListItemEventArgs e)
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

        protected void dtlCamiao_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName.Equals("btnEditC"))
            {
                SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["roteirizaçãoConnectionString"].ConnectionString);
                myConn.Open();
               
                SqlCommand myCommand = new SqlCommand();
                
                myCommand.Parameters.AddWithValue("@matricula", ((TextBox)e.Item.FindControl("tb_matric")).Text);
                myCommand.Parameters.AddWithValue("@quilometragem", ((TextBox)e.Item.FindControl("tb_quilometro")).Text);
                myCommand.Parameters.AddWithValue("@custoKm", ((TextBox)e.Item.FindControl("tb_custKm")).Text);
                myCommand.Parameters.AddWithValue("@capacidade", ((TextBox)e.Item.FindControl("tb_capacidade")).Text);
                myCommand.Parameters.AddWithValue("@tipocamiaoid", ((DropDownList)e.Item.FindControl("ddlTipoCamiao")).SelectedValue);
                myCommand.Parameters.AddWithValue("@username", Session["util"]);

                SqlParameter valor = new SqlParameter();
                valor.ParameterName = "@retorno";
                valor.Direction = ParameterDirection.Output;
                valor.SqlDbType = SqlDbType.Int;
                myCommand.Parameters.Add(valor);

                myCommand.CommandType = CommandType.StoredProcedure;
                myCommand.CommandText = "atualizar_camiao";


                myCommand.Connection = myConn;

                myCommand.ExecuteNonQuery();
                int repostaSP = Convert.ToInt32(myCommand.Parameters["@retorno"].Value);

                myConn.Close();

                if (repostaSP == 1)
                {
                    lblMensagem.Text = "Esse Camião já está registado!";
                }
                else
                {
                    lblMensagem.Text = "Dados atualizados!";
                    //Thread.Sleep(2000);
                    Response.Redirect("historico_util.aspx");
                }

            }
            if (e.CommandName.Equals("btnDeleteC"))
            {

                SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["roteirizaçãoConnectionString"].ConnectionString);

                SqlCommand myCommand = new SqlCommand();
                myConn.Open();

                myCommand.Parameters.AddWithValue("@camiaoid", ((Label)e.Item.FindControl("lblIdCamiao")).Text);


                SqlParameter valor = new SqlParameter();
                valor.ParameterName = "@retorno";
                valor.Direction = ParameterDirection.Output;
                valor.SqlDbType = SqlDbType.Int;
                myCommand.Parameters.Add(valor);

                myCommand.CommandType = CommandType.StoredProcedure;
                myCommand.CommandText = "delete_camiao";


                myCommand.Connection = myConn;

                myCommand.ExecuteNonQuery();
                int repostaSP = Convert.ToInt32(myCommand.Parameters["@retorno"].Value);

                myConn.Close();

                if (repostaSP == 1)
                {

                    lblMsg.Text = "Camião excluido!";
                    Response.Redirect("historico_util.aspx");

                }
                else
                {
                    lblMsg.Text = "Esse camião não está registado.";
                    //Response.Redirect("historico_adm.aspx");
                }

                myConn.Close();
            }
        }

        protected void btnAddC_Click(object sender, EventArgs e)
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
            myCommand.Parameters.AddWithValue("@username", Session["util"]);

            SqlParameter valor = new SqlParameter();
            valor.ParameterName = "@retorno";
            valor.Direction = ParameterDirection.Output;
            valor.SqlDbType = SqlDbType.Int;
            myCommand.Parameters.Add(valor);

            myCommand.CommandType = CommandType.StoredProcedure;
            myCommand.CommandText = "inserir_camiao_utilizador";


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
                //Thread.Sleep(2000);
                Response.Redirect("historico_util.aspx");
            }

        }
    }

}








