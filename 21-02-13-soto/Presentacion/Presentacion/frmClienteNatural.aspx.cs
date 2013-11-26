using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentacion
{
    public partial class frmClienteNatural : System.Web.UI.Page
    {
        dbDapIIFebrero2013Entities4 context = new dbDapIIFebrero2013Entities4();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
                this.cargarcomborubro();
            }
        }
        private void cargarcomborubro() {
            var objrubro = from r in context.rubro
                           select r;
            this.cbrubro.DataSource = objrubro;
            this.cbrubro.DataTextField = "nombre_rubro";
            this.cbrubro.DataValueField = "idrubro";
            this.cbrubro.DataBind();
        
        }
        //protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        //{
        //    this.Calendar1.Visible = true;
        //}

        //protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        //{
        //    this.txbfecha_nacimiento.Text = this.Calendar1.SelectedDate.ToShortDateString();
        //    this.Calendar1.Visible = false;
        //}

        protected void btnGuardar_Click(object sender, EventArgs e){
            long idcliente = (from r in context.cliente select r.idcliente).Max() + 1;
            this.Control_ID1.texto = idcliente.ToString();
            cliente objcliente = new cliente();
            natural objnatural = new natural();
            if (this.cargar_objetocliente(ref objcliente) & this.cargar_objetoNatural(ref objnatural)) {
                if (this.guardar_clientenatural( objcliente,  objnatural)) {
                    this.Label11.Text = "Cliente Natural registrado.";
                }
                else{
                    this.Label11.Text = "Error en el registro de cliente natural!!!.";
                }
            } 
        }
        private bool cargar_objetocliente(ref cliente objcliente) {
            bool controlesOK = true;
            objcliente.idcliente = long.Parse(this.Control_ID1.texto);
            objcliente.direccion = this.Control_String4.texto;
            if (this.Control_Int1.texto != string.Empty) {  
                objcliente.telefono = long.Parse (this.Control_Int1.texto);
            }
            if (this.Control_Int2.texto != string.Empty){
                objcliente.nit = long.Parse(this.Control_Int2.texto);
            }
            objcliente.idrubro = long.Parse(this.cbrubro.SelectedValue.ToString());
            return controlesOK;
        }
        private bool cargar_objetoNatural(ref natural objnatural) {
            bool controlesOK = true;
            objnatural.idcliente = long.Parse(this.Control_ID1.texto);
            objnatural.nombre_cliente = this.Control_String1.texto;
            objnatural.app = this.Control_String2.texto;
            objnatural.apm = this.Control_String3.texto;
            objnatural.fecha_nacimiento = DateTime.Parse(this.Control_Fecha1.texto); 
            return controlesOK ;
        }
        private bool guardar_clientenatural( cliente objcliente,  natural objnatural) {
            context.AddTocliente(objcliente);
            context.AddTonatural(objnatural);
            return context.SaveChanges() >= 2;    
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            long idcliente;
            if (long.TryParse(this.txbbuscar.Text, out idcliente) == true)
            {
                var objnatural = from cn in context.natural
                                 where cn.idcliente.Equals(idcliente)
                                 select new
                                 {
                                     idcliente = cn.idcliente,
                                     Nombre_cliente = cn.nombre_cliente
                                 };
                this.dgwcliente.DataSource = objnatural;
                this.dgwcliente.DataBind();
            }
            else
            {
                string nombre_cliente = this.txbbuscar.Text;
                var objnatural = from cn in context.natural
                                 where cn.nombre_cliente.Contains(nombre_cliente)
                                 select new
                                 {
                                     idcliente = cn.idcliente,
                                     Nombre_cliente = cn.nombre_cliente,
                                     App = cn.app,
                                     Apm =cn.apm,
                                     Fecha_nacimiento=cn.fecha_nacimiento
                                 };
                this.dgwcliente.DataSource = objnatural;
                this.dgwcliente.DataBind();
            };
            
        }

        protected void btnImprimirKardex_Click(object sender, EventArgs e)
        {
            long idcliente = long.Parse(this.Control_ID1.texto);
            Response.Redirect("frmreportes.aspx?nro_reporte=1&idcliente="+idcliente.ToString());
        }

        protected void btnInforme_Click(object sender, EventArgs e)
        {
            long idcliente = long.Parse(this.Control_ID1.texto);
            Response.Redirect("frmreportes.aspx?nro_reporte=2&idcliente=" + idcliente.ToString());
        }

        protected void txbidcliente_TextChanged(object sender, EventArgs e)
        {

        }
    }
}