using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentacion
{
    public partial class frmInformedecliente : System.Web.UI.Page
    {
       protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //this.mostrarreporte(1);
                this.mostrarreporte(Int32.Parse(Request.QueryString["nro_reporte"].ToString()));
                this.cargarcomborubro();
            }
        }
       dbDapIIFebrero2013Entities4 context = new dbDapIIFebrero2013Entities4();

        private void cargarcomborubro() {
            List<rubro> lobjrubro = (from r in context.rubro
                                     select r).ToList();
           
            rubro objrubro = new rubro();
            objrubro.idrubro = 0;
            objrubro.nombre_rubro = "Ver todos..";
            lobjrubro.Add(objrubro);

            this.cbrubro.DataSource = lobjrubro;
            this.cbrubro.DataTextField = "nombre_rubro";
            this.cbrubro.DataValueField = "idrubro";
            this.cbrubro.DataBind ();

        
        }
        private void mostrarreporte(Int32 nro_reporte){
            switch (nro_reporte){
                case 1:
                    var objcliente1 = from r in context.rubro
                                      join c in context.cliente on
                                          r.idrubro equals c.idrubro
                                      join n in context.natural
                                          on c.idcliente equals n.idcliente
                                      select new{
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
                          (new Microsoft.Reporting.WebForms.ReportDataSource("DataSet1", objcliente1));
                    this.ReportViewer1.LocalReport.Refresh();
                    this.ReportViewer1.DataBind();

                    break;
                case 3:
                    var objcliente3 =(from r in context.rubro
                                      join c in context.cliente on
                                          r.idrubro equals c.idrubro
                                      join n in context.natural
                                          on c.idcliente equals n.idcliente
                                      select new{
                                          idrubro=r.idrubro,
                                          nombre_rubro=r.nombre_rubro,
                                          idcliente=c.idcliente,
                                          direccion=c.direccion,
                                          telefono=c.telefono,
                                          nit=c.nit,
                                          nombre_cliente=n.nombre_cliente+" "+n.app +" "+n.apm ,
                                          tipo_cliente="Natural"
                                      }).Union
                                      (from r in context.rubro
                                       join c in context.cliente on
                                           r.idrubro equals c.idrubro
                                       join j in context.juridico 
                                           on c.idcliente equals j.idcliente
                                       select new{
                                           idrubro = r.idrubro,
                                           nombre_rubro = r.nombre_rubro,
                                           idcliente = c.idcliente,
                                           direccion = c.direccion,
                                           telefono = c.telefono,
                                           nit = c.nit,
                                           nombre_cliente = j.Razon_social,
                                           tipo_cliente = "juridico"
                                       });

                    this.ReportViewer1.ProcessingMode = Microsoft.Reporting.WebForms.ProcessingMode.Local;
                    this.ReportViewer1.LocalReport.ReportPath = @"C:\Users\Willy\Desktop\DAP2\21-02-13-soto\Presentacion\Presentacion\reportes\rptClienteGeneralTodos.rdlc";
                    this.ReportViewer1.LocalReport.DataSources.Clear();
                    this.ReportViewer1.LocalReport.DataSources.Add
                          (new Microsoft.Reporting.WebForms.ReportDataSource("DataSet1", objcliente3));
                    this.ReportViewer1.LocalReport.Refresh();
                    this.ReportViewer1.DataBind();

                    break;
                case 4:
                    var objcliente4 = (from r in context.rubro
                                       join c in context.cliente on
                                           r.idrubro equals c.idrubro
                                       join n in context.natural
                                           on c.idcliente equals n.idcliente
                                       select new
                                       {
                                           idrubro = r.idrubro,
                                           nombre_rubro = r.nombre_rubro,
                                           idcliente = c.idcliente,
                                           direccion = c.direccion,
                                           telefono = c.telefono,
                                           nit = c.nit,
                                           nombre_cliente = n.nombre_cliente + " " + n.app + " " + n.apm,
                                           tipo_cliente = "Natural"
                                       }).Union
                                      (from r in context.rubro
                                       join c in context.cliente on
                                           r.idrubro equals c.idrubro
                                       join j in context.juridico
                                           on c.idcliente equals j.idcliente
                                       select new
                                       {
                                           idrubro = r.idrubro,
                                           nombre_rubro = r.nombre_rubro,
                                           idcliente = c.idcliente,
                                           direccion = c.direccion,
                                           telefono = c.telefono,
                                           nit = c.nit,
                                           nombre_cliente = j.Razon_social,
                                           tipo_cliente = "juridico"
                                       });

                    this.ReportViewer1.ProcessingMode = Microsoft.Reporting.WebForms.ProcessingMode.Local;
                    this.ReportViewer1.LocalReport.ReportPath = @"C:\Users\Willy\Desktop\DAP2\21-02-13-soto\Presentacion\Presentacion\reportes\rptResumenClienteEjecutivo.rdlc";
                    this.ReportViewer1.LocalReport.DataSources.Clear();
                    this.ReportViewer1.LocalReport.DataSources.Add
                          (new Microsoft.Reporting.WebForms.ReportDataSource("DataSet1", objcliente4));
                    this.ReportViewer1.LocalReport.Refresh();
                    this.ReportViewer1.DataBind();

                    break;
                default:
                    break;

            }

        }


        protected void btnbuscar_Click(object sender, EventArgs e)
        {
            if (this.rbtodos.Checked == true)
            {
                this.mostrarreporte(3);
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            this.mostrarreporte(4);
        }

        protected void TreeView1_TreeNodeDataBound(object sender, TreeNodeEventArgs e)
        {
         
        }

         
    }
    
}