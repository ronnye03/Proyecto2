using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentacion
{
    public partial class frmEditarJuridico : System.Web.UI.Page
    {
        dbDapIIFebrero2013Entities4 context = new dbDapIIFebrero2013Entities4();



        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                this.cargardatosdelcliente(long.Parse(Request.QueryString["idcliente"].ToString()));
                this.cargarcomborubro();
            }
        }


        private void cargardatosdelcliente(long idcliente)
        {
            var objclientej = from cj in context.juridico
                              where cj.idcliente.Equals(idcliente)
                              select cj;

            var objcliente = from c in context.cliente
                             where c.idcliente.Equals(idcliente)
                             select c;

            foreach (var result in objclientej)
            {
                this.txbIdCliente.Text = result.idcliente.ToString();
                this.txbRazon.Text = result.Razon_social;
                this.txbRteLegal.Text = result.Rte_legal;
                this.txbNroPadron.Text = result.Nro_padron.ToString();
            }
            foreach (var result in objcliente)
            {
                this.txbDireccion.Text = result.direccion;
                this.txbNit.Text = result.nit.ToString();
                this.txbTelefono.Text = result.telefono.ToString();
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


        private bool cargarobjetocliente(ref juridico objcliente)
        {
            bool controlesOK = true;
            long idcliente;

            if (long.TryParse(txbIdCliente.Text, out idcliente) == true)
            {
                long id = long.Parse(this.txbIdCliente.Text);
                objcliente = context.juridico.FirstOrDefault(a => a.idcliente == id);
            }
            else
            {
                this.Label1.Text = "Error el el codigo del cliente";
                controlesOK = false;
            }


            if (this.txbRazon.Text.Trim() != String.Empty)
            {
                objcliente.Razon_social = this.txbRazon.Text;
            }
            else
            {
                this.Label1.Text = "Introduzca una Razon Social del cliente";
                controlesOK = false;
            }

            if (this.txbRteLegal.Text.Trim() != String.Empty)
            {
                objcliente.Rte_legal = this.txbRteLegal.Text;
            }
            else
            {
                this.Label1.Text = "Introduzca un Rte. Legal";
                controlesOK = false;
            }


            if (this.txbNroPadron.Text.Trim() != String.Empty)
            {
                objcliente.Nro_padron = long.Parse(this.txbNroPadron.Text);
            }
            else
            {
                this.Label1.Text = "Introduzca un Numero de Padron";
                controlesOK = false;
            }

            return controlesOK;
        }

        private bool actulizarcliente()
        {
            return context.SaveChanges() >= 0;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            juridico objcliente = new juridico();
            if (this.cargarobjetocliente(ref objcliente))
            {
                if (this.actulizarcliente())
                {
                    this.Label1.Text = "Modificacion Correcta";
                }
                else
                {
                    this.Label1.Text = "Error en la modificacion";
                }
            }
        }

        
    }
}