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
        <title>Agregar Tarjeta</title>
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

                <form action="agregarTarjeta" id="" class="formulario">

                    <input type="hidden" name="id_usuario" value="<%= u.getId() %>">
                    <h4 class="formulario__titulo">Ingrese los datos para agregar una tarjeta</h4>

                    <input name="titular" placeholder="Nombre del titular de la tarjeta" class="formulario__input" required>
                    <input name="numTarjeta" placeholder="Numero de la tarjeta" class="formulario__input" type="number" required>
                    <input name="mesVencimiento" placeholder="Mes de vencimiento" type="number" min="1" max="12" class="formulario__input">
                    <input name="yearVencimiento" placeholder="Año de vencimiento" type="number" min="2000" class="formulario__input">
                    <input name="cvv" placeholder="Codigo de seguridad" type="number" min="100" max="999" class="formulario__input">
                    
                    <select name="tipoTarheta" class="formulario__input">
                        <%
                        List<Tarjeta> lista = AccionesTarjeta.listarTiposTarjetas();
                        for(Tarjeta t : lista){
                            
                    %>
                    <option value="<%= t.getId_tarjeta() %>" ><%= t.getTipo_tarjeta() %></option>
                    <%}%>
                    </select>
                    
                    <div class="botones">
                        <input type="submit" class="boton" value="Agregar Tarjeta">
                    </div>
                    
                    <br>
                    <br>
                    <a class="boton2" style="text-decoration: none;" href="CambiarContrsaena.jsp">Cambiar contraseña</a>
                </form>
                    

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
