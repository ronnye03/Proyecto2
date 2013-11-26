using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentacion
{
    public partial class frmEditarRubro : System.Web.UI.Page
    {
        dbDapIIFebrero2013Entities4 context = new dbDapIIFebrero2013Entities4();
        private void cargardatosdelrubro(long idrubro) {
            var objrubro = from r in context.rubro
                           where r.idrubro.Equals (idrubro)
                           select r;
            //List<rubro >l=new List<rubro> ();
            //l=objrubro.ToList ();
            //if (l.Count > 0){
            //    this.txbidrubro.Text = l[0].idrubro.ToString();
            //    this.txbnombre_rubro.Text = l[0].nombre_rubro.ToString();
            //}
            foreach (var result in objrubro){
                this.txbidrubro.Text = result.idrubro.ToString ();
                this.txbnombre_rubro.Text =result.nombre_rubro; 
            }
          
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
                this.cargardatosdelrubro(long.Parse(Request.QueryString["idrubro"].ToString()));
            
            }
        }
        private bool  cargarobjetorubro(ref rubro objrubro) {
            bool controlesOK = true;
            long idrubro;
            if (long.TryParse(txbidrubro.Text, out idrubro) == true){
                long id = long.Parse(this.txbidrubro.Text);
                objrubro = context.rubro.FirstOrDefault(a => a.idrubro == id);
               }
            else {
                this.Label3.Text = "Error el el codigo del rubro";
                controlesOK = false;
            }
            if (this.txbnombre_rubro.Text.Trim() != String.Empty){
                objrubro.nombre_rubro = this.txbnombre_rubro.Text;
            }
            else {
                this.Label3.Text = "Introdusca un nombre de rubro";
                controlesOK = false;
            }
            return controlesOK;
        }
        private bool  actulizarrubro() {
            return context.SaveChanges() >= 0;
        }
        protected void btnGuardarEdicion_Click(object sender, EventArgs e){
            rubro objrubro = new rubro();
            if (this.cargarobjetorubro(ref objrubro)) {
                if (this.actulizarrubro()){
                    this.Label3.Text ="Modificacion Correcta";
                }
                else{
                    this.Label3.Text ="Error en la modificacion";
                
                }
            }

        }
    }
}