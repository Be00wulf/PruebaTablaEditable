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
        string dirProducto = "~/txt/Producto1.txt";
        DataTable tablaProducto = new DataTable();      //creando afuera la tabla
         
        //para llamar la tabla cuando se refresca para que no se borren los datos
        public void cargarProductos()
        {
            tablaProducto.Rows.Clear();

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

        protected void Page_Load(object sender, EventArgs e)
        {
            tablaProducto.Columns.Add("CODIGO");
            tablaProducto.Columns.Add("PRODUCTO");
            tablaProducto.Columns.Add("PRECIOcompra");
            tablaProducto.Columns.Add("PRECIOventa");
            tablaProducto.Columns.Add("EXISTENCIA");

            if (!IsPostBack)
            {
                cargarProductos();
            }
                        
        }

        //desde la ventana de propiedades ->Eventos ->RowCommand 
        protected void GridViewProductos_RowCommand1(object sender, GridViewCommandEventArgs e)
        {
            ////SI NO QUIERO QUE EL GRID TENGA TXT BOX NO NECESITO CREAR TEMPLATE FILE
            int indiceP = Convert.ToInt32(e.CommandArgument);
            //TextBoxCodigo.Text = e.CommandArgument.ToString();
            //TextBoxCodigo.Text = GridViewProductos.Rows[indiceP].Cells[0].Text;
            //TextBoxProducto.Text = GridViewProductos.Rows[indiceP].Cells[1].Text;

            ////HALLANDO VALORES: FIND CONTROL 
            ////TextBoxPcompra.Text = GridViewProductos.Rows[indice].FindControl("TextBoxPV_t").ToString();

            int indice = Convert.ToInt32(e.CommandArgument);
            int codigoProd = Convert.ToInt32(GridViewProductos.Rows[indice].Cells[0].Text);

            TextBoxCodigo.Text = e.CommandArgument.ToString();
            TextBoxCodigo.Text = GridViewProductos.Rows[indiceP].Cells[0].Text;
            TextBoxProducto.Text = GridViewProductos.Rows[indiceP].Cells[1].Text;

            //conversion forzada
            //TextBox miTextBox = (TextBox)GridViewProductos.Rows[indice].FindControl("TextBoxPC_t");
            //TextBoxPcompra.Text = miTextBox.Text;

            //conversion forzada en una linea, halla el control
            decimal pc = Convert.ToDecimal(((TextBox)GridViewProductos.Rows[indice].FindControl("TextBoxPC_t")).Text);
            decimal pv = Convert.ToDecimal(((TextBox)GridViewProductos.Rows[indice].FindControl("TextBoxPV_t")).Text);
            int existencia = Convert.ToInt32(((TextBox)GridViewProductos.Rows[indice].FindControl("TextBoxExist_t")).Text);
            cargarProductos();

            //para actualizar los valores en la tablaProducto
            //if (pc < pv) { }

            foreach (DataRow fila in tablaProducto.Rows)
            {
                if (Convert.ToInt32(fila[0]) == codigoProd)
                {
                    fila["PRECIOcompra"] = pc;
                    fila["PRECIOventa"] = pv;
                    fila["EXISTENCIA"] = existencia;
                }
            }

            //actualizando el archivo de texto
            StreamWriter escribir = new StreamWriter(Server.MapPath(dirProducto));
            foreach (DataRow fila in tablaProducto.Rows)
            {
                string linea = fila[0].ToString() + "," + fila[1].ToString() + "," + fila[2].ToString() + "," + fila[3].ToString() + "," + fila[4].ToString();
                escribir.WriteLine(linea);
            }
            escribir.Close();
            cargarProductos();  //trabajar directamente con el grid REVISAR
        }
    }
}