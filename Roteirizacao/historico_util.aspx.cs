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

                //Response.ContentType = "application/pdf";
                //Response.AddHeader("content-disposition", "attachment;filename=Panel.pdf");
                //Response.Cache.SetCacheability(HttpCacheability.NoCache);
                //StringWriter stringWriter = new StringWriter();
                //HtmlTextWriter htmlTextWriter = new HtmlTextWriter(stringWriter);
                //Panel1.RenderControl(htmlTextWriter);

                //StringReader stringReader = new StringReader(stringWriter.ToString());
                //Document Doc = new Document(PageSize.A4, 10f, 10f, 100f, 0f);
                //HTMLWorker htmlparser = new HTMLWorker(Doc);
                //PdfWriter.GetInstance(Doc, Response.OutputStream);
                //Doc.Open();
                //htmlparser.Parse(stringReader);
                //Doc.Close();
                //Response.Write(Doc);
                //Response.End();

                //string repeaterTable = "<table>" +
                //                "<thead>" +
                //                    "<tr>" +
                //                        "<th></ th >" +
                //                        "<th> Id </ th >" +
                //                        "<th> Produto </th>" +
                //                        "<t> Quantidade Kg </ th > " +
                //                        "<th> Origem </ th > " +
                //                        "<th> Local Coleta </ th >" +
                //                        "<th> Local de entrega</ th >" +
                //                        "<th> Data </ th >" +
                //                        "<th> Custo €</ th >" +
                //                        "<th> Matrícula do Veículo </ th >." +
                //                      "</tr > " +
                //                 "</thead >" +
                //                 "<tbody>";

                //foreach (RepeaterItem item in rptViagem.Items)
                //{
                //    if (((CheckBox)item.FindControl("chkBox")).Checked)
                //    {
                //        repeaterTable += 
                //            "<tr>" +
                //                "<td>"+((CheckBox)item.FindControl("chkBox")).Text+ "</td>"+
                //            "</tr>";
                //    }
                //}

                //string tabela = repeaterTable + "<tbody>";




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

    }

}








