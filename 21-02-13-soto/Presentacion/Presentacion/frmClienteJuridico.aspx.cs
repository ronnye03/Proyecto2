using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentacion
{
    public partial class frmClienteJuridico : System.Web.UI.Page
    {
        dbDapIIFebrero2013Entities4 context = new dbDapIIFebrero2013Entities4();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                this.cargarcomborubro();
            }
        }
        private void cargarcomborubro()
        {
            var objrubro = from r in context.rubro
                           select r;
            this.cbrubro.DataSource = objrubro;
            this.cbrubro.DataTextField = "nombre_rubro";
            this.cbrubro.DataValueField = "idrubro";
            this.cbrubro.DataBind();

        }


        private bool cargar_objetocliente(ref cliente objcliente)
        {
            bool controlesOK = true;
            objcliente.idcliente = long.Parse(this.txbIdCliente.Text);
            objcliente.direccion = this.txbDireccion.Text;
            if (this.txbTelefono.Text != string.Empty)
            {
                objcliente.telefono = long.Parse(this.txbTelefono.Text);
            }
            if (this.txbNit.Text != string.Empty)
            {
                objcliente.nit = long.Parse(this.txbNit.Text);
            }
            objcliente.idrubro = long.Parse(this.cbrubro.SelectedValue.ToString());
            return controlesOK;
        }
        private bool cargar_objetoJuridico(ref juridico objjuridico)
        {
            bool controlesOK = true;
            objjuridico.idcliente = long.Parse(this.txbIdCliente.Text);
            objjuridico.Razon_social = this.txbRazon.Text;
            objjuridico.Rte_legal = this.txbRteLegal.Text;
            objjuridico.Nro_padron = long.Parse(this.txbNroPadron.Text);
            
            return controlesOK;
        }
        private bool guardar_clientejuridico(cliente objcliente, juridico objjuridico)
        {
            context.AddTocliente(objcliente);
            context.AddTojuridico(objjuridico);
            return context.SaveChanges() >= 2;
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            long idcliente = (from r in context.cliente select r.idcliente).Max() + 1;
            this.txbIdCliente.Text = idcliente.ToString();
            cliente objcliente = new cliente();
            juridico objjuridico = new juridico();
            if (this.cargar_objetocliente(ref objcliente) & this.cargar_objetoJuridico(ref objjuridico))
            {
                if (this.guardar_clientejuridico(objcliente, objjuridico))
                {
                    this.Label1.Text = "Cliente Juridico registrado.";
                }
                else
                {
                    this.Label1.Text = "Error en el registro de clientejuridico!!!.";
                }
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            long idcliente;
            if (long.TryParse(this.txbbuscar.Text, out idcliente) == true)
            {
                var objjuridico = from cj in context.juridico
                                 where cj.idcliente.Equals(idcliente)
                                 select new
                                 {
                                     idcliente = cj.idcliente,
                                     Razon_social = cj.Razon_social
                                 };
                this.dgwcliente.DataSource = objjuridico;
                this.dgwcliente.DataBind();
            }
            else
            {
                string Razon_social = this.txbbuscar.Text;
                var objjuridico = from cj in context.juridico
                                 where cj.Razon_social.Contains(Razon_social)
                                 select new
                                 {
                                     idcliente = cj.idcliente,
                                     Razon_social = cj.Razon_social,
                                     Rte_legal = cj.Rte_legal,
                                    Nro_padron = cj.Nro_padron
                                 };
                this.dgwcliente.DataSource = objjuridico;
                this.dgwcliente.DataBind();
            };

        }



        public string Razon_social { get; set; }
    }
}