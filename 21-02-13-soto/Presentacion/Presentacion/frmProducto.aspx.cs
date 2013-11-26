using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Presentacion
{
    public partial class frmEditarProducto : System.Web.UI.Page
    {

        dbDapIIFebrero2013Entities4 context = new dbDapIIFebrero2013Entities4();

        protected void Page_Load(object sender, EventArgs e)
        {
            cargarcomboCategoriaSubcategoria();
        }

        private void cargarcomboCategoriaSubcategoria() {
            DataTable dta = new DataTable();
            dta.Columns.Add(new DataColumn("idsubcategoria"));
            dta.Columns.Add(new DataColumn("nombre_subcategoria"));
            var objcategoria = from c in context.categoria
                               select c;
            foreach (var fila in objcategoria) {
                long idcategoria = fila.idcategoria;
                var objsubcategoria = from sc in context.subcategoria
                                      where sc.idcategoria.Equals(idcategoria)
                                      select sc;
                foreach (var fila2 in objsubcategoria) {
                    DataRow drColumnas = dta.NewRow();
                    drColumnas["idsubcategoria"] = fila2.idsubcategoria.ToString();
                    drColumnas["nombre_subcategoria"] = fila.nombre_categoria + "/ " + fila2.nombre_subcategoria;
                    dta.Rows.Add(drColumnas);
                }
            }
            this.cbCategoria.DataSource = dta;
            this.cbCategoria.DataTextField= "nombre_subcategoria";
            this.cbCategoria.DataValueField= "idsubcategoria";
            this.cbCategoria.DataBind();
        }



        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            producto objproducto = new producto();
            this.cargarobjetoproducto(objproducto);
            if (this.guardarproducto(objproducto))
            {
                this.Label1.Text = "Producto guardado";
            }
            else {
                Label1.Text = "Error en el registro de producto...";
            }
        }

        private bool guardarproducto(producto objproducto) {
            context.AddToproducto(objproducto);
            return context.SaveChanges() >= 1;
        }

        private void cargarobjetoproducto(producto objproducto) {
            long idproducto = (from r in context.producto select r.idproducto).Max() + 1;
            this.txbidproducto.Text = idproducto.ToString();

            objproducto.idproducto = long.Parse(this.txbidproducto.Text);
            objproducto.nombre_producto = this.txbnombre_producto.Text;
            objproducto.precio_venta = float.Parse(txbprecio.Text);
            objproducto.stock = float.Parse(txbstock.Text);
            objproducto.Nombre_imagen = FileUpload1.FileName;
            objproducto.img1 = FileUpload1.FileBytes;
            objproducto.extension = FileUpload1.FileName.Substring(FileUpload1.FileName.Length - 3, 3);
            objproducto.idsubcategoria=long.Parse(cbCategoria.SelectedValue.ToString());
        
        }
           
        
            

        
    }
}