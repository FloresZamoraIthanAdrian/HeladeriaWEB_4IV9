<%@page import="Modelo.Helados"%>
<%@page import="Control.AccionesHelado"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>Iniciar Sesión</title>
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
                <image class = "logoimagen" src = "./images/logo.png" alt = "No se porque no carga :c" title = "Heladería Internacional"><a href="#" class = "logo">Iniciar <div class="espacio"></div> Sesión</a></image>
                <span class="menu-icon">Ver Menú  <i class="fas fa-chevron-down"></i></span>
                <nav class = "navigation">
                    <ul>
                        <li onclick="javascript:InicioAdmin()"><i class="fas fa-user"></i>Regresar</li>
                        <li onclick="javascript:Inicio()"><i class="fas fa-user"></i>Cerrar sesion Admin</a></li>
                    </ul>
                </nav>
            </div>
        </header>

        <section>
            <main>

                <div class="texto">

                    <form action="ActualizarHelado">
                        <table border="2" style="background: rgba(28,146,128,0.3); border: 2px solid black; border-radius: 10px; padding: 16px; font-size: 30px; box-shadow: 0 0 20px 1px rgba(0,0,0,0.7);">

                            <tbody>

                                <%

                                    int id = Integer.parseInt(request.getParameter("id"));
                                    Helados h = AccionesHelado.buscarHeladoById(id);

                                %>

                                <tr>
                                    <td>ID: </td>
                                    <td><input type="hidden" readonly name="id2" value="<%= h.getId() %>" ></td>
                                </tr>
                                <tr>
                                    <td>Helado: </td>
                                    <td><input type="text" name="heladoE" value="<%= h.getHelado() %>" onkeypress="return validarLetras(event)" > </td>
                                </tr>
                                <tr>
                                    <td>Precio: </td>
                                    <td><input type="text" name="precioE" value="<%= h.getPrecio() %>" onkeypress="return validarNumeros(event)"> </td>
                                </tr>
                                <tr>
                                    <td>Precio Mayoreo: </td>
                                    <td><input type="text" name="precioME" value="<%=h.getPrecioMayoreo()%>" onkeypress="return validarNumeros(event)"> </td>
                                </tr>
                                <tr>
                                    <td>Cantidad disponible: </td>
                                    <td><input type="text" name="cantidadE" value="<%= h.getCantidadGeneral() %>" onkeypress="return validarNumeros(event)"> </td>
                                </tr>
                                <tr>
                            <input type="submit" class="boton" value="Actualizar datos">
                            </tr>
                            </tbody>

                        </table>
                    </form>            
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
