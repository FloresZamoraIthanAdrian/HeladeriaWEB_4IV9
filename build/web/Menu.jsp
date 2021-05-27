<%@page import="java.util.*"%>
<%@page import="Control.*"%>
<%@page import="Modelo.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>Helados</title>
        <link rel="icon" href= "images/icon.png">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Mukta+Vaani:wght@300&display=swap" rel="stylesheet">
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <link rel = "stylesheet" type = 'text/css' href = './Styles/Styles.css'>
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Bangers&display=swap" rel="stylesheet">
        <script src="https://kit.fontawesome.com/9fb0a1aa63.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <header>
            <div class = "container logo-nav-container">
                <image class = "logoimagen" src = "images/logo.png" alt = "No se porque no carga :c" title = "Heladería Internacional"><a href="#" class = "logo"> Helados</a></image>
                <span class="menu-icon">Ver Menú  <i class="fas fa-chevron-down"></i></span>
                <nav>
                    <ul>
                        <li onclick = "javascript:Carrito()"><i class="fas fa-shopping-cart"></i> Ver Carrito</li>
                            <%
                                HttpSession sesion = request.getSession();
                                String usuer, id;

                                if (sesion.getAttribute("user") != null) {
                                    usuer = sesion.getAttribute("user").toString();
                                    id = sesion.getAttribute("id_usuS").toString();
                                    int id_usu = Integer.parseInt(id);

                                    Usuario u = AccionesUsuario.buscarUsuarioId(id_usu);

                                    out.print("<a style='text-decoration: none; color: white;' href='iniciarSesion.jsp?cerrar=true'><li>Cerrar Sesion de " + u.getUser() + "</li></a>");

                                } else {
                                    out.print("<script>location.replace('iniciarSesion.jsp');alert('Debes iniciar sesion para acceder a esta pagina');</script>");
                                }
                            %>
                    </ul>
                </nav>
            </div>
        </header>

        <section>
            <main>

                <%
                    List<Helado> lista = AccionesHelado.listarHelados();
                    for (Helado h : lista) {
                %>

                <div class="cuadro_producto">
                    <image class="helados" src = "images/unicornio.png" title="Helado" alt = "No se porque no carga"></image>
                    <div class="precios">
                        <p class="centro"><i><%= h.getNombre()%></i></p>
                        <p class="centro">Promociones Disponibles</p>
                        <ul>
                            <%
                                int idPre = h.getId();
                                List<Presentaciones> lista2 = AccionesPresentaciones.listarPresentaciones();
                                Presentaciones listpre = AccionesPresentaciones.buscarPresentacionesDisponibles(idPre);

                                String val1 = listpre.getPre1();
                                String val2 = listpre.getPre2();
                                String val3 = listpre.getPre3();
                                String val4 = listpre.getPre4();
                                String val5 = listpre.getPre5();

                                String[] presDisp = {val1, val2, val3, val4, val5};
                                String[] presNames = new String[5];
                                int[] presPrecios = new int[5];
                                int[] cantidadPres = new int[5];

                                int i = 0;
                                for (Presentaciones pre : lista2) {
                                    presNames[i] = pre.getPresentacion();
                                    presPrecios[i] = pre.getPrecioPresentacion();
                                    cantidadPres[i] = pre.getCantidad_presentacion();
                                    if (presDisp[i] == null) {
                                        presDisp[i] = "No Disponible";
                                    } else {
                                        presDisp[i] = "Disponible";
                                    }
                                    i++;
                                }
                                //No Disponible
                                for (int x = 0; x <= 4; x++) {
                                    if (presDisp[x] != "No Disponible") {
                            %>

                            <li value=""> <%= presNames[x]%> - <%= cantidadPres[x]%> (Gramos)</li>
                                <%
                                        }
                                    }
                                %>
                        </ul>

                        <p class="centro">Presentaciones Disponibles</p>
                        <ul>

                            <%
                                int idProm = h.getId();
                                List<Promociones> lista3 = AccionesPromociones.listarPromociones();
                                Promociones promDis = AccionesPromociones.buscarPromocionesDisponibles(idProm);

                                String prom1 = promDis.getP1();
                                String prom2 = promDis.getP2();
                                String prom3 = promDis.getP3();
                                String prom4 = promDis.getP4();
                                String prom5 = promDis.getP5();
                                String prom6 = promDis.getP6();

                                String[] promDisp = {prom1, prom2, prom3, prom4, prom4, prom5, prom6};
                                String[] promNames = new String[6];

                                int j = 0;
                                for (Promociones promA : lista3) {
                                    promNames[j] = promA.getPromocion();
                                    if (promDisp[j] == null) {
                                        promDisp[j] = "No Disponible";
                                    } else {
                                        promDisp[j] = "Disponible";
                                    }
                                    j++;
                                }
                                for (int k = 0; k <= 5; k++) {
                                    if (promDisp[k] != "No Disponible") {
                            %>

                            <li value=""> <%= promNames[k]%></li>

                            <%
                                    }
                                }
                            %>

                        </ul>
                        <p class="centro2">
                            Precio (100gr): $<%= h.getIdprecio()%>
                        </p>
                        <a style="text-decoration: none;" href="ComprarHelado?id=<%= h.getId()%>" name="" class="boton2">Comprar</a>
                    </div>
                </div>

                <%
                    }
                %>

            </main>
        </section>

        <footer>
            <h4>Integrantes</h4>
            <div class="boton2"><i class="fas fa-ice-cream"></i> Castañeda Rodríguez <div class="espacio"></div>Rafael Gil</div>
            <div class="boton2"><i class="fas fa-ice-cream"></i> Flores Zamora <div class="espacio"></div>Ithan Adrian</div>
            <div class="boton2"><i class="fas fa-ice-cream"></i> Gallegos González <div class="espacio"></div>Gian Carlo</div>
        </footer>

        <script src="./scripts/script.js"></script>

    </body>
</html>