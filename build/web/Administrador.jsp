<%@page import="Control.AccionesPromociones"%>
<%@page import="Modelo.Promociones"%>
<%@page import="Modelo.Promociones"%>
<%@page import="Control.AccionesPresentaciones"%>
<%@page import="Modelo.Presentaciones"%>
<%@page import="Modelo.Helado"%>
<%@page import="java.util.List"%>
<%@page import="Control.AccionesHelado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>Menu Administrador</title>
        <link rel="icon" href= "./images/icon.png">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Mukta+Vaani:wght@300&display=swap" rel="stylesheet">
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <link rel = "stylesheet" type = 'text/css' href = 'Styles/Estilos.css'>
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
                        <li onclick="javascript:CrearCuenta()"><i class="fas fa-user"></i> Crear Cuenta</li>
                        <li onclick="javascript:Inicio();"><i class="fas fa-door-open"></i> Regresar</li>
                    </ul>
                </nav>
            </div>
        </header>
        <section>
            <main>

                <div class="texto">
                    <div>
                        <button onclick="agregarHelado()" style="font-size: 25px;" class="boton2">Agregar Helado</button>
                    </div>
                </div>

                <%
                    List<Helado> lista = AccionesHelado.listarHelados();
                    for (Helado h : lista) {
                %>

                <div class="producto">
                    <div style="margin: 22px; background: rgba(219,70,155,0.8); border: 2px solid black; border-radius: 25px; padding: 5px;">

                        <p class="centro">Helado de <%= h.getNombre()%></p>
                        <p style="padding-left: 16px;">Precio: $<%= h.getIdprecio()%> por 100 gramos</p>

                        <p style="padding-left: 16px; padding-bottom: 0; margin-bottom: 0;">Stock (Gramos): <%= h.getStock_gramos() %> </p>

                        <select name="" class="formulario__input">

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
                                int[] presPres = new int[5];
                                
                                int i = 0;
                                for (Presentaciones pre : lista2) {
                                    presNames[i] = pre.getPresentacion();
                                    presPres[i] = pre.getCantidad_presentacion();
                                    if (presDisp[i] == null) {
                                        presDisp[i] = "No Disponible";
                                    } else {
                                        presDisp[i] = "Disponible";
                                    }
                                    i++;
                                }
                            %>

                            <option value=""> <%= presNames[0]%> - (<%= presDisp[0]%>) - <%= presPres[0] %>(gr) </option>
                            <option value=""> <%= presNames[1]%> - (<%= presDisp[1]%>) - <%= presPres[1] %>(gr) </option>
                            <option value=""> <%= presNames[2]%> - (<%= presDisp[2]%>) - <%= presPres[2] %>(gr)</option>
                            <option value=""> <%= presNames[3]%> - (<%= presDisp[3]%>) - <%= presPres[3] %>(gr)</option>
                            <option value=""> <%= presNames[4]%> - (<%= presDisp[4]%>) - <%= presPres[4] %>(gr)</option>

                        </select>

                        <select name="" class="formulario__input">

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

                            %>

                            <option value=""> <%= promNames[0]%> - (<%= promDisp[0]%>) </option>
                            <option value=""> <%= promNames[1]%> - (<%= promDisp[1]%>) </option>
                            <option value=""> <%= promNames[2]%> - (<%= promDisp[2]%>) </option>
                            <option value=""> <%= promNames[3]%> - (<%= promDisp[3]%>) </option>
                            <option value=""> <%= promNames[4]%> - (<%= promDisp[4]%>) </option>
                            <option value=""> <%= promNames[5]%> - (<%= promDisp[5]%>) </option>

                        </select>

                        <table>
                            <thead>
                            <th>
                            <td>
                                <a href="EditarHelado.jsp?id=<%= h.getId()  %>" name="" class="boton">Editar</a>
                            </td>
                            </th>
                            <th>
                            <td>
                                <a href="BorrarHelado?id=<%= h.getId() %>" name="" class="boton">Borrar</a>
                            </td>
                            </th>
                            </thead>
                        </table>
                    </div>
                </div>

                <%
                    }
                %>

            </main>
        </section>

        <footer>
            <h4>Integrantes</h4>
            <div class="boton2" onclick="IniciarAdmin()"><div class="espacio"></div>Iniciar Sesion Admin</div>
            <div class="boton2"><i class="fas fa-ice-cream"></i> Castañeda Rodríguez <div class="espacio"></div>Rafael Gil</div>
            <div class="boton2"><i class="fas fa-ice-cream"></i> Flores Zamora <div class="espacio"></div>Ithan Adrian</div>
            <div class="boton2"><i class="fas fa-ice-cream"></i> Gallegos González <div class="espacio"></div>Gian Carlo</div>
        </footer>

        <script src="./scripts/script.js"></script>

    </body>
</html>
