using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentacion
{
    public partial class frmreportes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
                this.mostrarreporte(Int32.Parse(Request.QueryString["nro_reporte"].ToString()));
            }
        }


        dbDapIIFebrero2013Entities4 context = new dbDapIIFebrero2013Entities4();

        //private void cargarcomborubro()
        //{
        //    List<rubro>lobjrubro=from r in context.rubro
        //                   select r;
            
        //    this.cbrubro.DataSource = objrubro;
        //    this.cbrubro.DataTextField = "nombre_rubro";
        //    this.cbrubro.DataValueField = "idrubro";
        //    this.cbrubro.DataBind();

        //}

        private void mostrarreporte(Int32 nro_reporte) {
            switch (nro_reporte) { 
                

                case 1:
                    long idcliente = long.Parse(Request.QueryString["idcliente"].ToString());
                    var objcliente1 = from r in context.rubro
                                      join c in context.cliente on
                                          r.idrubro equals c.idrubro
                                      join n in context.natural
                                          on c.idcliente equals n.idcliente
                                      where c.idcliente.Equals(idcliente)
                                      select new
                                      {
                                          r.idrubro,
                                          r.nombre_rubro,
                                          c.idcliente,
                                          c.direccion,
                                          c.telefono,
                                          c.nit,
                                          n.nombre_cliente,
                                          n.app,
                                          n.apm,
                                          n.fecha_nacimiento
                                      };
                    this.ReportViewer1.ProcessingMode = Microsoft.Reporting.WebForms.ProcessingMode.Local;
                    this.ReportViewer1.LocalReport.ReportPath = @"C:\Users\Willy\Desktop\DAP2\21-02-13-soto\Presentacion\Presentacion\reportes\rptKardexClienteNatural.rdlc";
                    this.ReportViewer1.LocalReport.DataSources.Clear();
                    this.ReportViewer1.LocalReport.DataSources.Add
                        (new Microsoft.Reporting.WebForms.ReportDataSource("DataSet1", objcliente1));
                    this.ReportViewer1.LocalReport.Refresh();
                    this.ReportViewer1.DataBind();
                    break;

                case 2:
                  //  long idcliente2 = long.Parse(Request.QueryString["idcliente"].ToString());
                    var objcliente2 = from r in context.rubro
                                      join c in context.cliente on
                                          r.idrubro equals c.idrubro
                                      join n in context.natural
                                          on c.idcliente equals n.idcliente
                                      select new
                                      {
                                          r.idrubro,
                                          r.nombre_rubro,
                                          c.idcliente,
                                          c.direccion,
                                          c.telefono,
                                          c.nit,
                                          n.nombre_cliente,
                                          n.app,
                                          n.apm,
                                          n.fecha_nacimiento
                                      };
                    this.ReportViewer1.ProcessingMode = Microsoft.Reporting.WebForms.ProcessingMode.Local;
                    this.ReportViewer1.LocalReport.ReportPath = @"C:\Users\Willy\Desktop\DAP2\21-02-13-soto\Presentacion\Presentacion\reportes\rptInformeCliente.rdlc";
                    this.ReportViewer1.LocalReport.DataSources.Clear();
                    this.ReportViewer1.LocalReport.DataSources.Add
                        (new Microsoft.Reporting.WebForms.ReportDataSource("DataSet1", objcliente2));
                    this.ReportViewer1.LocalReport.Refresh();
                    this.ReportViewer1.DataBind();
                    break;

                case 3:
                    long idproducto = long.Parse(Request.QueryString["idproducto"].ToString());
                    var objproducto = from p in context.producto
                                      
                                      where p.idproducto.Equals(idproducto)
                                      select new
                                      {
                                          p.idproducto,
                                          p.nombre_producto,
                                          p.precio_venta,
                                          p.stock
                                          
                                      };
                    this.ReportViewer1.ProcessingMode = Microsoft.Reporting.WebForms.ProcessingMode.Local;
                    this.ReportViewer1.LocalReport.ReportPath = @"C:\Users\Willy\Desktop\DAP2\21-02-13-soto\Presentacion\Presentacion\reportes\rptInformacionProducto.rdlc";
                    this.ReportViewer1.LocalReport.DataSources.Clear();
                    this.ReportViewer1.LocalReport.DataSources.Add
                        (new Microsoft.Reporting.WebForms.ReportDataSource("DataSet1", objproducto));
                    this.ReportViewer1.LocalReport.Refresh();
                    this.ReportViewer1.DataBind();
                    break;

                

                default:
                    break;
            }
        }

      
       
        
    }
}