<%-- 
    Document   : MenuHeladeria
    Created on : 1/05/2021, 10:55:58 PM
    Author     : 52554
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>Carrito</title>
        <link rel="icon" href= "images/icon.png">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Mukta+Vaani:wght@300&display=swap" rel="stylesheet">
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="scripts/script.js"></script>
        <link rel = "stylesheet" type = 'text/css' href = 'Styles/Estilos.css'>
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Bangers&display=swap" rel="stylesheet">
        <script src="https://kit.fontawesome.com/9fb0a1aa63.js" crossorigin="anonymous"></script>
    </head>
    <body>

        <header>
            <div class = "container logo-nav-container">
                <image class = "logoimagen" src = "images/logo.png" alt = "No se porque no carga :c" title = "Heladería Internacional"><a href="#" class = "logo"> Catálogo</a></image>
                <span class="menu-icon">Ver Menú  <i class="fas fa-chevron-down"></i></span>
                <nav class = "navigation">
                    <ul>
                        <li onclick = "javascript:Carrito()"><i class="fas fa-shopping-cart"></i> Ver Carrito</li>
                        <li onclick="javascript:Inicio()"><i class="fas fa-user"></i>Cerrar sesion</a></li>
                    </ul>
                </nav>
            </div>
        </header>

        <section>
            <main>

                

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