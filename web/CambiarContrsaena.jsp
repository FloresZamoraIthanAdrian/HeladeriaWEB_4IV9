<%@page import="Control.AccionesUsuario"%>
<%@page import="Modelo.Usuario"%>
<!DOCTYPE html>
<html>
    <head>

        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>Cambiar contraseña</title>
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
                        <a style='text-decoration: none; color: white;' href='Cuenta.jsp'><li>Mi cuenta</li></a>
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
            <main>

                <form action="CambiarPass" onsubmit="return cambiarPass(this)" id="formChangePass" class="formulario">

                    <input type="hidden" name="id_usuario" value="<%= u.getId()%>">
                    <h4 class="formulario__titulo">Digite la antigua contraseña</h4>

                    <input type="password" name = "oldPass" class="formulario__input" placeholder="Antigua contraseña">
                    <h4 class="formulario__titulo">Digite la nueva contraseña</h4>
                    <input type="password" name = "newPass" class="formulario__input" 
                           placeholder="Digite la nueva contraseña">
                    <input type="password" name = "vcontrsena" class="formulario__input" 
                           placeholder="Verifique la contraseña">

                    <div class="botones">
                        <input type="submit" class="boton" value="Cambiar contrsaena">
                    </div>
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

        <script>
            function cambioPass(formChangePass) {

                if (formChangePass.oldPass.value.length > 20) {
                    verificarDatos = false;
                    alert("Caracteres excedidos")
                    return false;
                }

                if (formChangePass.newPass.value.length > 20) {
                    verificarDatos = false
                    alert('La contraseña tiene un maximo de 20 caracteres')
                    return false;
                }

                if (formChangePass.vcontrsena.value != formChangePass.newPass.value) {
                    verificarDatos = false
                    alert('La contraseñas deben coincidir')
                    return false;
                }

            }
        </script>

        <script src="./scripts/script.js"></script>
        <script src="./scripts/validarFormularios.js"></script>

    </body>
</html>
