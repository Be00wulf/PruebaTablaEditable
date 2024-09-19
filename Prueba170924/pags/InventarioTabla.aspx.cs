using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Prueba170924.pags
{
    public partial class Datos : System.Web.UI.Page
    {
        string dirProducto = "~/txt/Producto.txt";
        DataTable tablaProducto = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            tablaProducto.Columns.Add("CODIGO");
            tablaProducto.Columns.Add("PRODUCTO");
            tablaProducto.Columns.Add("PRECIOcompra");
            tablaProducto.Columns.Add("PRECIOventa");
            tablaProducto.Columns.Add("EXISTENCIA");

            StreamReader leer = new StreamReader(Server.MapPath(dirProducto));
            while (!leer.EndOfStream)
            {
                string linea = leer.ReadLine();
                string[] aux = linea.Split(',');
                tablaProducto.Rows.Add(aux);
            }
            leer.Close();
            GridViewProductos.DataSource = tablaProducto;
            GridViewProductos.DataBind();
        }

        //desde la ventana de propiedades ->Eventos ->RowCommand 
        protected void GridViewProductos_RowCommand1(object sender, GridViewCommandEventArgs e)
        {
            //SI NO QUIERO QUE EL GRID TENGA TXT BOX NO NECESITO CREAR TEMPLATE FILE
            int indice = Convert.ToInt32(e.CommandArgument);
            TextBoxCodigo.Text = e.CommandArgument.ToString();
            TextBoxCodigo.Text = GridViewProductos.Rows[indice].Cells[0].Text;
            TextBoxProducto.Text = GridViewProductos.Rows[indice].Cells[1].Text;

            ////HALLANDO VALORES: FIND CONTROL 
            ////TextBoxPcompra.Text = GridViewProductos.Rows[indice].FindControl("TextBoxPV_t").ToString();

        }
    }
}