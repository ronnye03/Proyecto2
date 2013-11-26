using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Presentacion
{
    public partial class Control_ID : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public string texto
        {
            set { txtID.Text = value; }
            get { return txtID.Text; }
        }

       
        protected void txtID_TextChanged(object sender, EventArgs e)
        {

        }

    }
}