<%@ Page Title="Tabla" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InventarioTabla.aspx.cs" Inherits="Prueba170924.pags.Datos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <div class="container mt-4 ">
        <main>
            <section class="content-section" aria-labelledby="inventTitle">
                <h1 id="inventTitle">Ingreso de productos</h1>

                <div class="row justify-content-center align-items-center mb-3">
                    <div class="col-md-6 mb-3">
                        <label for="TextBoxCodigo" class="alinCentro">CODIGO:</label>
                        <asp:TextBox ID="TextBoxCodigo" runat="server" CssClass="form-control estilotxtBoxS" type="number" placeholder="Ej: 12AA"></asp:TextBox>
                    </div>

                    <div class="col-md-6 mb-3">
                        <label for="TextBoxProducto">PRODUCTO:</label>
                        <asp:TextBox ID="TextBoxProducto" runat="server" CssClass="form-control estilotxtBoxS" placeholder="Ej: Radio"></asp:TextBox>
                    </div>
                </div>


                <div class="row mb-3">
                    <div class="col-md-6 mb-3">
                        <label for="TextBoxPcompra">PRECIO DE COMPRA:</label>
                        <asp:TextBox ID="TextBoxPcompra" runat="server" CssClass="form-control estilotxtBoxS" type="number" placeholder="Ej: 555.22"></asp:TextBox>
                    </div>

                    <div class="col-md-6 mb-3">
                        <label for="TextBoxPventa">PRECIO DE VENTA:</label>
                        <asp:TextBox ID="TextBoxPventa" runat="server" CssClass="form-control estilotxtBoxS" type="number" placeholder="Ej: 600.55"></asp:TextBox>
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-6 mb-3">
                        <label for="TextBoxExistencia">EXISTENCIA:</label>
                        <asp:TextBox ID="TextBoxExistencia" runat="server" CssClass="form-control estilotxtBoxS" type="number" placeholder="Ej: 12"></asp:TextBox>
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col text-center">
                        <asp:Button ID="ButtonLimpiar" runat="server" CssClass="btn btn-primary" Text="LIMPIAR" />
                        <asp:Button ID="btnGUARDAR" CssClass="btn btn-primary" runat="server" Text="GUARDAR" />
                        <asp:Button ID="btnEDITAR" CssClass="btn btn-primary ms-2" runat="server" Text="EDITAR" Enabled="False" />
                        <asp:Button ID="btnELIMINAR" CssClass="btn btn-primary ms-2" runat="server" Text="ELIMINAR" Enabled="False" />
                    </div>
                </div>

                <%--<div class="row mb-3 justify-content-center align-items-center">
                    <div class="col text-center">
                        <asp:Button ID="ButtonBuscar" runat="server" CssClass="btn btn-primary" Text="BUSCAR" OnClick="ButtonBuscar_Click" />
                        <asp:TextBox ID="TextBoxBuscar" runat="server" CssClass="form-control d-inline-block w-auto ms-2" type="number" placeholder="Ingresar CODIGO"></asp:TextBox>
                    </div>x
                </div>--%>

                <%--tabla editable rp--%>
                <div class="row mb-3">
                    <div class="col text-center ">
                        <div class="table-responsive">
                            <asp:GridView ID="GridViewProductos" CssClass="table table-striped table-hover" runat="server" AutoGenerateColumns="False" OnRowCommand="GridViewProductos_RowCommand1">
                                <Columns>
                                    <asp:BoundField DataField="CODIGO" HeaderText="CODIGO" />
                                    <asp:BoundField DataField="PRODUCTO" HeaderText="PRODUCTO" />
                                    <asp:TemplateField HeaderText="PRECIO DE COMPRA">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("PRECIOcompra") %>'></asp:TextBox>
                                        </EditItemTemplate>

                                        <%-- Los CssClass funcionan en ItenmTemplate --%>
                                        <ItemTemplate>
                                            <asp:TextBox ID="TextBoxPC_t" runat="server" CssClass="form-control" Text='<%# Bind("PRECIOcompra") %>'></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="PRECIO DE VENTA">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("PRECIOventa") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:TextBox ID="TextBoxPV_t" runat="server" Text='<%# Bind("PRECIOventa") %>'></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="EXISTENCIA">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("EXISTENCIA") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:TextBox ID="TextBoxExist_t" runat="server" Text='<%# Bind("EXISTENCIA") %>'></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>        
                                    <asp:ButtonField ButtonType="Button" ControlStyle-CssClass="btn-primary" Text="Seleccionar">
                                    </asp:ButtonField>
                                    <asp:ButtonField ButtonType="Button" Text="Editar" ControlStyle-CssClass="btn-warning"/>
                                </Columns>   
                            </asp:GridView>
                        </div>
                    </div>
                </div>



                <!-- Modal -->
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="myModalLabel">Información Importante</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <!-- Label para mostrar mensajes dinámicos -->
                                <asp:Label ID="lblModalMessage" runat="server" CssClass="modal-|label textoResaltado"></asp:Label>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                            </div>
                        </div>
                    </div>
                </div>

                <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
            </section>
        </main>
    </div>
</asp:Content>
