<%@page import="Control.AccionesUsuario"%>
<%@page import="Modelo.Usuario"%>
<!DOCTYPE html>
<html>
    <head>

        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>Editar mis datos</title>
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
                <image class = "logoimagen" src = "./images/logo.png" alt = "No se porque no carga :c" title = "Helader�a Internacional"><a href="#" class = "logo">Crear <div class="espacio"></div>Cuenta</a></image>
                <span class="menu-icon">Ver Men�  <i class="fas fa-chevron-down"></i></span>
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

                <form action="editarDatosUsuario" id="" class="formulario">

                    <input type="hidden" name="id_usuario" value="<%= u.getId() %>">
                    <h4 class="formulario__titulo">Modifique los datos que quiera editar</h4>
                    <input value="<%= u.getNombre() %>" name = "nombre" class="formulario__input" placeholder="Nombre">
                    <input value="<%= u.getAppat() %>" name = "appat" class="formulario__input" placeholder="Apellido paterno">
                    <input value="<%= u.getApmat() %>" name = "apmat" class="formulario__input" placeholder="Apellido materno">
                    <input value="<%= u.getUser() %>" name = "usuario" class="formulario__input" placeholder="Usuario">
                    <input value="<%= u.getEdad() %>" min="18" max="99" type="number" name = "edad" class="formulario__input" placeholder="Edad">
                    <input value="<%= u.getNacimiento() %>" type="date" name = "fecha_de_nacimiento" class="formulario__input" placeholder="Fecha de nacimiento(dd / mm / aaaa)">
                    <input value="<%= u.getTel_par() %>" name = "telefono_Particular" class="formulario__input" placeholder="Telefono particular">
                    <input value="<%= u.getTel_cel() %>" name = "telefono_Celular" class="formulario__input" placeholder="Telefono celular">
                    <input value="<%= u.getDomicilio() %>" name = "domicilio" class="formulario__input" placeholder="Domicilio">
                    <input type="password" name = "verificarContrasena" class="formulario__input" 
                           placeholder="Para editar cualquier dato debe introducir la Contrase�a">

                    <div class="botones">
                        <input type="submit" class="boton" value="Editar datos de la cuenta">
                        
                    </div>
                    <br>
                    <br>
                    <a class="boton2" style="text-decoration: none;" href="CambiarContrsaena.jsp">Cambiar contrase�a</a>
                </form>
                    

            </main>

        </section>
                    
        <%                        } else {
                out.print("<script>location.replace('iniciarSesion.jsp');alert('Debes iniciar sesion para acceder a esta pagina');</script>");
            }
        %>            
                    
        <footer>
            <h4>Integrantes</h4>
            <div class="boton2"><i class="fas fa-ice-cream"></i> Casta�eda Rodr�guez <div class="espacio"></div>Rafael Gil</div>
            <div class="boton2"><i class="fas fa-ice-cream"></i> Flores Zamora <div class="espacio"></div>Ithan Adrian</div>
            <div class="boton2"><i class="fas fa-ice-cream"></i> Gallegos Gonz�lez <div class="espacio"></div>Gian Carlo</div>
        </footer>

        <script src="./scripts/script.js"></script>
        <script src="./scripts/validarFormularios.js"></script>

    </body>
</html>
