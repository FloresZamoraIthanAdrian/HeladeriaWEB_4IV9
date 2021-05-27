<%@page import="Control.Conexion"%>
<%@page import="Control.Conexion"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>Ben & Jerry´s</title>
        <link rel="icon" href= ".images/icon.png"><link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Mukta+Vaani:wght@300&display=swap" rel="stylesheet">
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <link rel = "stylesheet" type = 'text/css' href = 'Styles/Estilos.css'>
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Bangers&display=swap" rel="stylesheet">
        <script src="https://kit.fontawesome.com/9fb0a1aa63.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <header>
            <div class = "container logo-nav-container">
                <image class = "logoimagen" src = "./images/logo.png" alt = "No se porque no carga :c" title = "Heladería Internacional"><a href="#" class = "logo">Ben & <div class="espacio"></div> Jerry´s</a></image>
                <span class="menu-icon">Ver Menú  <i class="fas fa-chevron-down"></i></span>
                <nav class = "navigation">
                    <ul>
                        <li><a href="./index.html"><i class="fas fa-home"></i> Inicio </a></li>
                        <li><a href="./CrearCuenta.jsp"><i class="fas fa-user"></i> Registrarse </a></li>
                    </ul>
                </nav>
            </div>
        </header>
        <section>
            <main>

                <form action="InicioAdmin.jsp" name="formularioAdmin" method="" onsubmit="return validarAdmin(this)" class="formulario">

                    <h4 class="formulario__titulo">
                        Inicio de Sesion como Administrador
                    </h4>
                    <input onkeypress="return validarAlfaNumericos(event)" type="text" name = "usuario" class="formulario__input" placeholder="Usuario">
                    <input onkeypress="return validarAlfaNumericos(event)" type="text" name = "contrasena" id="password" class="formulario__input" placeholder="Contraseña">
                    <div class="botones">
                        <button id="btnShow" class="boton" onclick="mostrarContrasena()">Ocultar/Mostrar contrasena</button>
                        <input type="submit" class="boton" name="btnIngresar" value="Iniciar Sesion">
                    </div>

                </form>
                
                <%

                    HttpSession sesion = request.getSession();
                    String usuer;
                    if (request.getParameter("btnIngresar") != null) {

                        Connection con = Conexion.getConnection();
                        Statement set = null;
                        ResultSet rs = null;
                        String usu = request.getParameter("usuario");
                        String contra = request.getParameter("contrasena");

                        try {
                            String q = "select id_usuario, usu from mUsuario where usu = 'AdminIceMaster2592' and cont_usu= 'rootadminmaster' ";
                            set = con.createStatement();
                            rs = set.executeQuery(q);
                            while (rs.next()) {
                                session.setAttribute("id_usuS", rs.getInt(1));
                                session.setAttribute("user", rs.getString(2));
                            }
                            rs.close();
                            set.close();
                            response.sendRedirect("Administrador.jsp");
                        } catch (SQLException ed) {
                            System.out.println("No se encontro");
                            System.out.println(ed.getMessage());
                            
                %>  
                <div style="display: grid; align-content: center; justify-content: center;">
                    <h3>Usuario o contraseña incorrecto</h3>
                </div>
                <%
                        }
                        con.close();

                    }
                    if (request.getParameter("cerrar") != null) {
                        session.invalidate();
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
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="./scripts/ValidacionAdmin.js"></script>
        <script src="./scripts/script.js"></script>
    </body>
</html>
