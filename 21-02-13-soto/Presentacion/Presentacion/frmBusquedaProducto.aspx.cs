using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

namespace Presentacion
{
    public partial class frmBusquedaProducto : System.Web.UI.Page
    {
        dbDapIIFebrero2013Entities4 context = new dbDapIIFebrero2013Entities4();

        protected void Page_Load(object sender, EventArgs e)
        {
            cargarcomboCategoriaSubcategoria();
            this.cargardatalist();
        }

        private void cargarcomboCategoriaSubcategoria()
        {
            DataTable dta = new DataTable();
            dta.Columns.Add(new DataColumn("idsubcategoria"));
            dta.Columns.Add(new DataColumn("nombre_subcategoria"));
            var objcategoria = from c in context.categoria
                               select c;
            foreach (var fila in objcategoria)
            {
                long idcategoria = fila.idcategoria;
                var objsubcategoria = from sc in context.subcategoria
                                      where sc.idcategoria.Equals(idcategoria)
                                      select sc;
                foreach (var fila2 in objsubcategoria)
                {
                    DataRow drColumnas = dta.NewRow();
                    drColumnas["idsubcategoria"] = fila2.idsubcategoria.ToString();
                    drColumnas["nombre_subcategoria"] = fila.nombre_categoria + "/ " + fila2.nombre_subcategoria;
                    dta.Rows.Add(drColumnas);
                }
            }
            this.cbCategoria.DataSource = dta;
            this.cbCategoria.DataTextField = "nombre_subcategoria";
            this.cbCategoria.DataValueField = "idsubcategoria";
            this.cbCategoria.DataBind();
        }

        private void cargardatalist()
        {
            if (!Page.IsPostBack)
            {
                this.cargardatalistImagen();
            }
        }

        private void cargardatalistImagen()
        {
            var objproducto = from p in context.producto
                              select p;


            this.DataList1.DataSource = objproducto.ToList();
            this.DataList1.DataBind();
        }

        //private void cargardatosdelproducto(long idproducto)
        //{
        //    var objproducto = from p in context.producto
        //                      where p.idproducto.Equals(idproducto)
        //                      select p;

        //    foreach (var result in objproducto)
        //    {
        //        string dirfisica = @"C:\Users\Willy\Desktop\DAP2\21-02-13-soto\Presentacion\Presentacion\images";
        //        //producto objproductoLB = (producto)e.Item.DataItem;

        //        //subcategoria objsubcate=(subcategoria)e.Item.DataItem;

        //        ListBox lb = (ListBox)e.Item.FindControl("ListBox1");
        //        lb.Items.Add("Producto :" + objproducto.nombre_producto);
        //        lb.Items.Add("Precio :" + objproducto.precio_venta.ToString());
        //        lb.Items.Add("Stock :" + objproducto.stock.ToString());
        //        lb.Items.Add("Categoria :" + objproducto.idsubcategoria);

        //        //lb.Items.Add("Subcategoria: " + objproducto);

        //        //cargando la imagen al control

        //        dirfisica = dirfisica + objproducto.Nombre_imagen;
        //        File.WriteAllBytes(dirfisica, objproducto.img1);
        //        ImageButton im = (ImageButton)e.Item.FindControl("ImageButton1");
        //        string dirlogica = "~\\images\\" + objproducto.Nombre_imagen;
        //        im.ImageUrl = dirlogica;
        //        this.txbidcliente.Text = result.idcliente.ToString();
        //        this.txbnombre_cliente.Text = result.nombre_cliente;
        //        this.txbapp.Text = result.app;
        //        this.txbapm.Text = result.apm;
        //        this.txbfecha_nacimiento.Text = result.fecha_nacimiento.ToString();
        //    }


        //}

        protected void Button1_Click(object sender, EventArgs e)
        {
            //long idproducto;
            //if (long.TryParse(this.txbbuscar.Text, out idproducto) == true)
            //{
            //    //var objpro= from c in context.producto
            //    //            {};
            //    string nombre_producto = this.cbCategoria.Text;
            //    var objproducto = from p in context.producto
            //                      where p.nombre_producto.Contains(nombre_producto)
            //                      select new
            //                      {
            //                          nombre_producto = p.nombre_producto
            //                          //nombre_producto = p.nombre_producto
            //                      };
            //    this.dgwcliente.DataSource = objproducto;
            //    this.dgwcliente.DataBind();
            //};
            ////else
            ////{
            ////    string nombre_producto = this.txbbuscar.Text;
            ////    var objproducto = from p in context.producto
            ////                      where p.nombre_producto.Contains(nombre_producto)
            ////                      select new
            ////                      {
            ////                          idproducto = p.idproducto,
            ////                          nombre_producto = p.nombre_producto
            ////                      };
            ////this.dgwcliente.DataSource = objproducto;
            ////this.dgwcliente.DataBind();

            if (cbCategoria.SelectedItem.Text != "A/ A1")
            {
                DataList1.Visible = false;
            }
            else {
                DataList1.Visible = true;
            }
        }

        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            string dirfisica = @"C:\Users\Willy\Desktop\DAP2\21-02-13-soto\Presentacion\Presentacion\images";
            producto objproducto = (producto)e.Item.DataItem;

            //subcategoria objsubcate=(subcategoria)e.Item.DataItem;

            ListBox lb = (ListBox)e.Item.FindControl("ListBox1");
            lb.Items.Add("Producto :" + objproducto.nombre_producto);
            lb.Items.Add("Precio :" + objproducto.precio_venta.ToString());
            lb.Items.Add("Stock :" + objproducto.stock.ToString());
            lb.Items.Add("Categoria : A");
            lb.Items.Add("SubCategoria : A1");

            //lb.Items.Add("Subcategoria: " + objproducto);

            //cargando la imagen al control

            dirfisica = dirfisica + objproducto.Nombre_imagen;
            File.WriteAllBytes(dirfisica, objproducto.img1);
            ImageButton im = (ImageButton)e.Item.FindControl("ImageButton1");
            string dirlogica = "~\\images\\" + objproducto.Nombre_imagen;
            im.ImageUrl = dirlogica;

            //ImageButton im2 = (ImageButton)e.Item.FindControl("ImageButton2");
            //im2.PostBackUrl = "frmCompras.aspx?idproducto" + objproducto.idproducto.ToString();
        }

        protected void cbCategoria_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

       
    }
}
