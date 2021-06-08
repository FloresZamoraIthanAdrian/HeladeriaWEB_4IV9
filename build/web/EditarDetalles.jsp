<%@page import="java.util.*"%>
<%@page import="Control.*"%>
<%@page import="Modelo.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>Editar detalles del pedido</title>
        <link rel="icon" href= "images/icon.png">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Mukta+Vaani:wght@300&display=swap" rel="stylesheet">
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="scripts/js/scripts.js"></script>
        <link rel = "stylesheet" type = 'text/css' href = 'Styles/Styles.css'>
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Bangers&display=swap" rel="stylesheet">
        <script src="https://kit.fontawesome.com/9fb0a1aa63.js" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    </head>
    <body>
        <header>
            <div class = "container logo-nav-container">
                <image class = "logoimagen" src = "images/logo.png" alt = "No se porque no carga :c" title = "Heladería Internacional"><a href="#" class = "logo">Compra</a></image>
                <span class="menu-icon">Ver Menú  <i class="fas fa-chevron-down"></i></span>
                <nav>
                    <ul>
                        <li onclick = "javascript:Carrito()"><i class="fas fa-shopping-cart"></i> Ver Carrito</li>
                        <li onclick = "javascript:Catalogo()"><i class="fas fa-ice-cream"></i> Seguir Comprando</li>
                            <%
                                HttpSession sesion = request.getSession();
                                String usuer, id;

                                if (sesion.getAttribute("user") != null) {
                                    usuer = sesion.getAttribute("user").toString();
                                    id = sesion.getAttribute("id_usuS").toString();
                                    int id_usu = Integer.parseInt(id);

                                    Usuario u = AccionesUsuario.buscarUsuarioId(id_usu);

                                    out.print("<a style='text-decoration: none; color: white;' href='iniciarSesion.jsp?cerrar=true'><li>Cerrar Sesion de " + u.getUser() + "</li></a>");

                            %>
                    </ul>
                </nav>
            </div>
        </header>

        <section>
            <%                int id_Pedido = Integer.parseInt(request.getParameter("idEditar"));
                int id_Usuario = Integer.parseInt(request.getParameter("id_usuario"));
                Pedido p = AccionesUsuario.buscarDetallesPedido(id_Pedido, id_Usuario);
                int id_h = Integer.parseInt(request.getParameter("idH"));
                Helado h = AccionesHelado.buscarHeladoId(id_h);
            %>
            <main>
                <form class="formulario" action="editarDetallesCompra">
                    <h4 style="font-size:20px;" class="formulario__titulo">Editar detalles de la compra</h4>
                    <input value="<%= p.getId_pedido()%>" name="id_pedido" type="hidden">
                    <input value="<%= p.getId_usuario()%>" name="id_usuario" type="hidden">
                    <input value="<%= p.getId_producto() %>" name="id_producto" type="hidden">
                    <h4 style="font-size:20px;" class="formulario__titulo"><%= h.getNombre()%> . . . ¡Que buena Elección!</h4>
                    <br>
                    <h4 style="font-size:20px;" class="izquierda">Precio por 100 gramos: $<%= h.getIdprecio()%></h4>
                    <br>
                    <h4 style="font-size:20px;" class="izquierda">Presentaciones disponibles</h4>

                    <select  multiple required class="form-control" name="presentaciones">

                        <%
                            List<Presentaciones> lista2 = AccionesPresentaciones.listarPresentaciones();
                            for (Presentaciones pp : lista2) {
                        %>
                        <option value="<%= pp.getId()%>" > <%= pp.getPresentacion()%> - <%= pp.getCantidad_presentacion()%>(Gr) </option>
                        <%
                            }
                        %>

                    </select>
                    <input value="<%= p.getCantidad()%>" type="number" min="1" max="" name = "Cantidad" class="formulario__input" placeholder="Inserte Cantidad que desea comprar">
                    <br>
                    <h4 style="font-size:20px;" class="izquierda">Promociones disponibles</h4>

                    <select multiple required name="promociones" class="form-control" >

                        <%
                            List<Promociones> lista = AccionesPromociones.listarPromociones();
                            for (Promociones pp : lista) {
                        %>

                        <option value="<%= pp.getId()%>" > <%= pp.getPromocion()%> </option>

                        <%
                            }
                        %>

                    </select>
                    <br><br>
                    <input type="submit" class="boton" name = "AceptarCompra" value="Editar detalles de la compra">
                </form>
            </main>
        </section>
        <%
            } else {
                out.print("<script>location.replace('iniciarSesion.jsp');alert('Debes iniciar sesion para acceder a esta pagina');</script>");
            }
        %>            

        <footer>
            <h4>Integrantes</h4>
            <div class="boton2"><i class="fas fa-ice-cream"></i> Castañeda Rodríguez <div class="espacio"></div>Rafael Gil</div>
            <div class="boton2"><i class="fas fa-ice-cream"></i> Flores Zamora <div class="espacio"></div>Ithan Adrian</div>
            <div class="boton2"><i class="fas fa-ice-cream"></i> Gallegos González <div class="espacio"></div>Gian Carlo</div>
        </footer>

        <script src="./scripts/script.js"></script>           
        <script src="./scripts/CompraHelado.js"></script>

    </body>
</html>
