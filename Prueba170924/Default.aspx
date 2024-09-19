<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Prueba170924._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class=" my-5">
        <main>
            <!-- Sección ASP.NET -->
            <section class="content-section mb-5 textoSimple" aria-labelledby="aspnetTitle">
                <div class="row justify-content-center">
                    <div class="col-lg-8 col-md-10 text-center textoSimple">
                        <h1 id="aspnetTitle">ASP.NET</h1>
                        <p>
                            ASP.NET es un marco de desarrollo gratuito para construir sitios web y 
                            aplicaciones web geniales utilizando HTML, CSS y JavaScript.
                        </p>
                        <p><a href="http://www.asp.net" class="btn btn-primary">Conoce más &raquo;</a></p>
                    </div>
                </div>
            </section>

            <!-- Sección Sistema de Inventario -->
            <section class="content-section" aria-labelledby="inventorySystemTitle">
                <div class="row justify-content-center">
                    <div class="col-lg-8 col-md-10">
                        <h2 id="inventorySystemTitle" class="text-center textoSimple">Bootstrap</h2>
                        <p>Bootstrap según 
                            <a href="https://rockcontent.com/es/blog/bootstrap/">
                                  rockcontent.com
                            </a>
                             es un framework CSS desarrollado por Twitter en 2010, para estandarizar las herramientas de la compañía.
                        </p>

                        <ul class="justified-list">
                            <li><strong>Funcionalidad</strong> Esta herramienta ofrece una serie de características que se pueden implementar en un sitio web.</li>

                            <li><strong>Diseño responsive</strong>Para garantizar la responsividad, el framework funciona con: la estilización del elemento < div > y el uso del class containter   </li>

                            <li><strong>Biblioteca de componentes</strong>Otra interesante función de este framework es la cantidad de componentes que pueden ser usados para proporcionar una mejor interacción y perfeccionar la comunicación con el usuario.</li>

                            <li><strong>Principales bibliotecas </strong> Alertas, carrusel, barra de navegación.</li>
                        </ul>
                        <p>
                            El framework combina CSS y JavaScript para estilizar los elementos de una página HTML. Permite mucho más que, simplemente, cambiar el color de los botones y los enlaces.
                        </p>
                    </div>
                </div>
            </section>
        </main>
    </div>

</asp:Content>
