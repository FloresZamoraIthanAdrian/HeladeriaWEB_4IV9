
<%@page import="Modelo.Helados"%>
<%@page import="Control.AccionesHelado"%>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*" %>
<!DOCTYPE html>
<html>
    <head>

        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>CRUD Helados</title>
        <link rel="icon" href= "./images/icon.png">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Mukta+Vaani:wght@300&display=swap" rel="stylesheet">
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <link rel = "stylesheet" type = 'text/css' href = './Styles/Estilos.css'>
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Bangers&display=swap" rel="stylesheet">
        <script src="https://kit.fontawesome.com/9fb0a1aa63.js" crossorigin="anonymous"></script>

    </head>
    <body>

        <header>
            <div class = "container logo-nav-container">
                <image class = "logoimagen" src = "./images/logo.png" alt = "No se porque no carga :c" title = "Heladería Internacional"><a href="#" class = "logo">Sesion <div class="espacio"></div> Administrador</a></image>
                <span class="menu-icon">Ver Menú  <i class="fas fa-chevron-down"></i></span>
                <nav class = "navigation">
                    <ul>
                        <li onclick="javascript:Inicio()"><i class="fas fa-user"></i>Cerrar sesion Admin</a></li>
                    </ul>
                </nav>
            </div>
        </header>

        <section>
            <main>

                <div class="texto">
                    <div class="botones">
                        <div class="boton2" onclick="agregarHelado()"><i class="fas fa-ice-cream"></i> <div class="espacio"></div>Agregar Helado</div>
                    </div>

                    <table border="2" style="background: rgba(28,146,128,0.3); border: 2px solid black; border-radius: 10px; padding: 16px; font-size: 22px; box-shadow: 0 0 20px 1px rgba(0,0,0,0.7);">

                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Helado</th>
                                <th>Precio</th>
                                <th>Precio Mayoreo</th>
                                <th>Cantidad Disponible (Litros)</th>
                                <th>Actualizar Datos</th>
                                <th>Borrar</th>
                            </tr>
                        </thead>

                        <tbody>

                            <%
                                List<Helados> lista = AccionesHelado.listarHelados();
                                for(Helados h : lista){
                            %>

                            <tr>
                                <td><%= h.getId() %></td>
                                <td><%= h.getHelado() %></td>
                                <td><%= h.getPrecio() %></td>
                                <td><%= h.getPrecioMayoreo() %></td>
                                <td><%= h.getCantidadGeneral() %></td>

                                <td style="padding: 32px;"> 
                                    <a class="boton" href="EditarHelado.jsp?id=<%= h.getId() %>">Editar</a>
                                </td>
                                <td style="padding: 32px;">
                                    <a class="boton" href="BorrarHelado?id=<%= h.getId() %>"> Borrar </a>
                                </td>
                            </tr>

                            <%
                                        
                                }
                            %>

                        </tbody>

                    </table>

                </div>

            </main>
        </section>

        <footer>
            <h4>Integrantes</h4>
            <div class="boton2"><i class="fas fa-ice-cream"></i> Castañeda Rodríguez <div class="espacio"></div>Rafael Gil</div>
            <div class="boton2"><i class="fas fa-ice-cream"></i> Flores Zamora <div class="espacio"></div>Ithan Adrian</div>
            <div class="boton2"><i class="fas fa-ice-cream"></i> Gallegos González <div class="espacio"></div>Gian Carlo</div>
        </footer>

        <script src="./scripts/script.js"></script>
        <script src="./scripts/validarFormularios.js"></script>                    

    </body>
</html>