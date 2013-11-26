using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentacion
{
    public partial class frmrubro : System.Web.UI.Page
    {
        dbDapIIFebrero2013Entities4 context = new dbDapIIFebrero2013Entities4();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private void cargarGrillarubro() {
            var objrubro = from r in context.rubro
                           select r;
            this.dgwrubro.DataSource = objrubro;
            this.dgwrubro.DataBind();
        }
        protected void btnGuardar_Click(object sender, EventArgs e){
            rubro objrubro = new rubro();

            long idrubro = (from r in context.rubro select r.idrubro).Max() + 1;
            this.txbidrubro.Text = idrubro.ToString();

            objrubro.idrubro = long.Parse (this.txbidrubro.Text);
            objrubro.nombre_rubro = this.txbNombre_rubro.Text;
            context.AddTorubro(objrubro);
            if (context.SaveChanges() > 0){
                this.Label4.Text = "rubro registrado";
                this.cargarGrillarubro();
            }
            else {
                this.Label4.Text = "Error en el registro de rubro...!!!";
            }
        }

        protected void txbNombre_rubro_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            long idrubro;
            if (long.TryParse(this.txbbuscar.Text, out idrubro) == true){
                var objrubro = from r in context.rubro
                               where r.idrubro.Equals(idrubro)
                               select new
                               {
                                   idrubro = r.idrubro,
                                   Nombre_rubro = r.nombre_rubro
                               };
                this.dgwrubro.DataSource = objrubro;
                this.dgwrubro.DataBind();
            }
            else {
                string nombre_rubro = this.txbbuscar.Text;  
                var objrubro = from r in context.rubro
                               where r.nombre_rubro.Contains (nombre_rubro)
                               select new
                               {
                                   idrubro = r.idrubro,
                                   Nombre_rubro = r.nombre_rubro
                               };

               // objrubro = objrubro.Where(p => p.Nombre_rubro  == nombre);

                this.dgwrubro.DataSource = objrubro;
                this.dgwrubro.DataBind();
            
            }

        }
    }
}