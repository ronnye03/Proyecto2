using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentacion
{
    public partial class Control_Int : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public string texto
        {
            set { txtInt.Text = value; }
            get { return txtInt.Text; }
        }

        protected void txtInt_TextChanged(object sender, EventArgs e)
        {

        }
    }
}