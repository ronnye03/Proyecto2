using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentacion
{
    public partial class frmBuscarProducto : System.Web.UI.Page
    {
        dbDapIIFebrero2013Entities4 context = new dbDapIIFebrero2013Entities4();
        private void cargarcomboproducto()
        {
            List<producto> lobjproducto = (from p in context.producto
                                     select p).ToList();

            producto objproducto = new producto();
            objproducto.idproducto = 0;
            objproducto.nombre_producto = "Ver todos..";
            lobjproducto.Add(objproducto);

            this.cbproducto.DataSource = lobjproducto;
            this.cbproducto.DataTextField = "nombre_producto";
            this.cbproducto.DataValueField = "idproducto";
            this.cbproducto.DataBind();
        }
        private void cargarcombocategoria()
        {
            List<categoria> lobjcategoria = (from c in context.categoria
                                        select c).ToList();

            categoria objcategoria = new categoria();
            objcategoria.idcategoria = 0;
            objcategoria.nombre_categoria = "Ver todos..";
            lobjcategoria.Add(objcategoria);

            this.cbcategoria.DataSource = lobjcategoria;
            this.cbcategoria.DataTextField = "nombre_categoria";
            this.cbcategoria.DataValueField = "idcategoria";
            this.cbcategoria.DataBind();
        }
        private void cargarcombosubcategoria()
        {
            List<subcategoria> lobjsubcategoria = (from sc in context.subcategoria
                                        select sc).ToList();

            subcategoria objsubcategoria = new subcategoria();
            objsubcategoria.idsubcategoria = 0;
            objsubcategoria.nombre_subcategoria = "Ver todos..";
            lobjsubcategoria.Add(objsubcategoria);

            this.cbsubcategoria.DataSource = lobjsubcategoria;
            this.cbsubcategoria.DataTextField = "nombre_subcategoria";
            this.cbsubcategoria.DataValueField = "idsubcategoria";
            this.cbsubcategoria.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            this.cargarcombocategoria();
            this.cargarcomboproducto();
            this.cargarcombosubcategoria();
        }

        private void mostrarreporte(Int32 nro_reporte) { }

        protected void btnbuscar_Click(object sender, EventArgs e)
        {
            
        }

        public producto objproducto { get; set; }
    }
}