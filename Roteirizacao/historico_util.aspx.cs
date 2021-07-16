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
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;

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


            string query = " SELECT historico_viagem.historicoid ,produto.descricao, quantidade, origem,localcoleta, localentrega, convert(char(10), data, 103) 'data', custo, matricula" +
                " FROM historico_viagem" +
                " JOIN carregar ON carregar.historicoid = historico_viagem.historicoid" +
                " JOIN produto ON carregar.produtoid = produto.produtoid" +
                " JOIN camiao ON carregar.camiaoid = camiao.camiaoid" +
                " JOIN utilizador ON utilizador.utilizadorid = camiao.utilizadorid" +
                " JOIN rota ON rota.historicoid = historico_viagem.historicoid" +
                " WHERE username ='" + Session["util"] + "' OR email ='" + Session["util"] + "';";
            SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["roteirizaçãoConnectionString"].ConnectionString);
            myConn.Open();

            SqlCommand myCommand = new SqlCommand(query, myConn);
            DataTable historico = new DataTable();
            SqlDataAdapter adp = new SqlDataAdapter(myCommand);

            adp.Fill(historico);

            rptViagem.DataSource = historico;
            rptViagem.DataBind();

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
                
                Response.Clear();
                Response.AddHeader("Content-Disposition", "attachment; filename=pdf.pdf");

                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.ContentType = "application/pdf";

                /*
                 historicoid
                    descricao
                    quantidade
                    origem
                    localcoleta
                    localentrega
                    data
                    custo
                    matricula

                 */
                //string conteudo = $"<h1>Histórico de Viagens</h1><br/><b>Nome:</b> {tb_nome.Text}<br/><b>Morada:</b> {tb_morada.Text}";
                //StringReader sr = new StringReader(conteudo);

                Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 10f);
                HTMLWorker parser = new HTMLWorker(pdfDoc);
                PdfWriter.GetInstance(pdfDoc, Response.OutputStream);

                pdfDoc.Open();
                //parser.Parse(sr);
                pdfDoc.Close();
                Response.Write(pdfDoc);
                Response.End();
            }
        }
    }

}