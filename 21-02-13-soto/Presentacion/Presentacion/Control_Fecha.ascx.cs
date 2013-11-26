using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentacion
{
    public partial class Control_Fecha : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public string texto
        {
            set { txtFn.Text = value; }
            get { return txtFn.Text; }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            this.Calendar1.Visible = true;
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            this.txtFn.Text = this.Calendar1.SelectedDate.ToShortDateString();
            this.Calendar1.Visible = false;
        }

        protected void txtFn_TextChanged(object sender, EventArgs e)
        {

        }
    }
}