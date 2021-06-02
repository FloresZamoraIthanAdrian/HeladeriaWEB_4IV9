<%@page import="Modelo.Tarjeta"%>
<%@page import="java.util.List"%>
<%@page import="Control.AccionesTarjeta"%>
<%@page import="Control.AccionesUsuario"%>
<%@page import="Modelo.Usuario"%>
<!DOCTYPE html>
<html>
    <head>

        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>Administrar mis tarjetas</title>
        <link rel="icon" href= "./images/icon.png">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Mukta+Vaani:wght@300&display=swap" rel="stylesheet">
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <link rel = "stylesheet" type = 'text/css' href = './Styles/Estilos.css'>
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Bangers&display=swap" rel="stylesheet">
        <script src="https://kit.fontawesome.com/9fb0a1aa63.js" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    </head>

    <body>
        <header>
            <div class = "container logo-nav-container">
                <image class = "logoimagen" src = "./images/logo.png" alt = "No se porque no carga :c" title = "Heladería Internacional"><a href="#" class = "logo">Crear <div class="espacio"></div>Cuenta</a></image>
                <span class="menu-icon">Ver Menú  <i class="fas fa-chevron-down"></i></span>
                <nav class = "navigation">
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

                <div class="texto">
                    <div>
                        <a class="boton2" style="text-decoration: none; color: white;" href="AgregarTarjeta.jsp">Agregar Tarjeta</a>
                    </div>
                </div>
                <br><br>
                <div class="texto">
                <table class="table table-dark">
                    
                    <thead>
                        <tr>
                            <th scope="col">Tipo de tarjeta</th>
                            <th scope="col">Titular</th>
                            <th scope="col">Numero de Tarjeta</th>
                            <th scope="col">Vencimiento</th>
                            <th scope="col">CVV</th>
                            <th scope="col">Borrar</th>
                        </tr>
                    </thead>
                    
                    <tbody>
                        
                        <%
                            List<Tarjeta> listaTarjetas = AccionesTarjeta.listarTarjetasUsuario(id_usu);
                            for(Tarjeta t : listaTarjetas){
                                String tarjeta;
                                if(t.getId_tipot() == 1){
                                    tarjeta = "Debito";
                                }else{
                                    tarjeta = "Credito";
                                }
                        %>
                        
                        <tr>
                            <td><%= tarjeta %></td>
                            <td><%= t.getTitular() %></td>
                            <td><%= t.getNum_tarjeta() %></td>
                            <td><%= t.getMes() %>/<%= t.getYear() %></td>
                            <td><%= t.getCvv() %></td>
                            <td>
                                <a style="text-decoration: none; color: white;" 
                                   href="BorrarTarjeta?id=<%= t.getNum_tajetagen()%>">
                                    Borrar
                                </a>
                            </td>
                        </tr>
                        
                        <%}%>
                        
                    </tbody>
                    
                </table>
                </div>
            </main>

        </section>

        <%                        } else {
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
        <script src="./scripts/validarFormularios.js"></script>

    </body>
</html>
