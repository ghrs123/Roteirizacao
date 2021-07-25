using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
            string xpto = tb_resp.Value;
            //string str = xpto;
            //JavaScriptSerializer j = new JavaScriptSerializer();
            //object a = j.Deserialize(str, typeof(object));


            // dynamic stuff = JsonConvert.DeserializeObject(xpto.ToString());
            // Root flight = Newtonsoft.Json.JsonConvert.DeserializeObject<Root>(xpto);s

            //  Root myDeserializedClass = JsonConvert.DeserializeObject<Root>(xpto);

            //JavaScriptSerializer oJS = new JavaScriptSerializer();
            //Root oRootObject = new Root();
            //oRootObject = oJS.Deserialize<Root>(xpto);
            Root rt = new Root();
            var dyn = JsonConvert.DeserializeObject<JObject>(xpto);

            JProperty propAge = dyn.Properties().FirstOrDefault(i => i.Name == "veiculo");
            if (propAge != null)
            {
                int age = int.Parse(propAge.Value.ToString());
                Console.WriteLine("veiculo=" + rt.veiculo);
            }

            //or as a one-liner:
            int myage = int.Parse(dyn.Properties().First(i => i.Name == "veiculo").Value.ToString());



            string b = "";
            //    for (int i = 0; i < ((object[])a).GetLength(0); i++)
            //    {
            //        for (int j = 0; j < ((object[])a).GetLength(1); j++)
            //        {

            //            ((object[])a)[i].Items[0].ToString();

            //            ((object[])a)[i].Items[j].ToString();
            //            ((object[])a)[i].Items[j].ToString();
            //            //   var veiculo = ((object[])a)[i][0];
            //        }



            //}




        }
    }
}