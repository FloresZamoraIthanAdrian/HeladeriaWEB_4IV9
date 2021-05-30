<%@page import="Modelo.Presentaciones"%>
<%@page import="Control.AccionesPresentaciones"%>
<%@page import="Modelo.Promociones"%>
<%@page import="Control.AccionesPromociones"%>
<%@page import="Modelo.Helado"%>
<%@page import="Control.AccionesHelado"%>
<%@page import="Modelo.Pedido"%>
<%@page import="java.util.List"%>
<%@page import="Control.AccionesUsuario"%>
<%@page import="Modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>Mi Carrito</title>
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
                        <li onclick = "javascript:Catalogo()"><i class="fas fa-ice-cream"></i> Seguir Comprando</li>
                            <%
                                HttpSession sesion = request.getSession();
                                String usuer, id;

                                if (sesion.getAttribute("user") != null) {
                                    usuer = sesion.getAttribute("user").toString();
                                    id = sesion.getAttribute("id_usuS").toString();
                                    int id_usu = Integer.parseInt(id);

                                    Usuario u = AccionesUsuario.buscarUsuarioId(id_usu);

                                    out.print("<a style='text-decoration: none; color: white;' href='iniciarSesion.jsp?cerrar=true'><li>Cerrar Sesion de " + u.getUser()+ "</li></a>");

                            %>
                    </ul>
                </nav>
            </div>
        </header>

        <section>
            <main>

                <%                    List<Pedido> listaPedido = AccionesUsuario.listarCarritoUsuario(id_usu);
                    for (Pedido p : listaPedido) {
                %>

                <div class="cuadro_producto">
                    <image class="helados" src = "images/unicornio.png" title="Helado" alt = "No se porque no carga"></image>
                    <div tyle="font-family: 'Comic Neue', cursive;
                         line-height: 1.6em;" class="precios">

                        <%
                            int id_h = p.getId_producto();
                            Helado h = AccionesHelado.buscarHeladoId(id_h);
                        %>

                        <p class="centro"><i><%= h.getNombre()%></i></p>

                        <%
                            int id_Promocion = p.getId_promocion();
                            Promociones pro = AccionesPromociones.buscarPromocionId(id_Promocion);
                            int id_Presentacion = p.getId_presentacion();
                            Presentaciones pre = AccionesPresentaciones.buscarPresentacionId(id_Presentacion);
                        %>

                        <ul>
                            <li><%= pro.getPromocion()%></li>

                        </ul>
                        <ul>
                            <li><%= pre.getPresentacion()%> (<%= p.getCantidad()%> Unidades)</li>
                        </ul>

                        <p class="centro2">
                            Subtotal: $<%= p.getSubtotal()%>
                        </p>
                        <a style="color: white; text-decoration: none;" href="GenerarTicket.jsp?id=<%= h.getId()%>" name="" class="boton2">Comprar</a>
                        <a style="color: white; text-decoration: none;" 
                           href="BorrarDelCarrito?id=<%= p.getId_pedido() %>&id_usuario=<%= u.getId() %>" 
                           name="" class="boton2">Borrar</a>
                    </div>
                </div>

                <%}
                %>

            </main>
        </section>            

        <footer>
            <h4>Integrantes</h4>
            <div class="boton2"><i class="fas fa-ice-cream"></i> Castañeda Rodríguez <div class="espacio"></div>Rafael Gil</div>
            <div class="boton2"><i class="fas fa-ice-cream"></i> Flores Zamora <div class="espacio"></div>Ithan Adrian</div>
            <div class="boton2"><i class="fas fa-ice-cream"></i> Gallegos González <div class="espacio"></div>Gian Carlo</div>
        </footer>

        <%                        } else {
                out.print("<script>location.replace('iniciarSesion.jsp');alert('Debes iniciar sesion para acceder a esta pagina');</script>");
            }
        %>



    </body>
</html>
