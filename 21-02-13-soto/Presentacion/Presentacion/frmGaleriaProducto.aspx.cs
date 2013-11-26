using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace Presentacion
{
    public partial class frmGaleriaProducto : System.Web.UI.Page
    {
        dbDapIIFebrero2013Entities4 context = new dbDapIIFebrero2013Entities4();

        protected void Page_Load(object sender, EventArgs e)
        {
            this.cargardatalist();
        }

        private void cargardatalist() {
            if (!Page.IsPostBack) {
                this.cargardatalistImagen();
            }
        }

        private void cargardatalistImagen() {
            var objproducto = from p in context.producto
                              select p;
            this.DataList1.DataSource = objproducto.ToList();
            this.DataList1.DataBind();
        }

        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            string dirfisica = @"C:\Users\Willy\Desktop\DAP2\21-02-13-soto\Presentacion\Presentacion\images";
            producto objproducto = (producto)e.Item.DataItem;
            ListBox lb = (ListBox)e.Item.FindControl("ListBox1");
            lb.Items.Add("Producto :" + objproducto.nombre_producto);
            lb.Items.Add("Precio :" + objproducto.precio_venta.ToString());
            lb.Items.Add("Stock :" + objproducto.stock.ToString());
            //cargando la imagen al control
            dirfisica = dirfisica + objproducto.Nombre_imagen;
            File.WriteAllBytes(dirfisica, objproducto.img1);
            ImageButton im = (ImageButton)e.Item.FindControl("ImageButton1");
            string dirlogica = "~\\images\\" + objproducto.Nombre_imagen;
            im.ImageUrl = dirlogica;

            ImageButton im2 = (ImageButton)e.Item.FindControl("ImageButton2");
            im2.PostBackUrl = "frmCompras.aspx?idproducto" + objproducto.idproducto.ToString();
        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}