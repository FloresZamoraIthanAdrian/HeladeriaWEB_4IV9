<%@page import="Control.AccionesPresentaciones"%>
<%@page import="Modelo.Presentaciones"%>
<%@page import="Control.AccionesPromociones"%>
<%@page import="Modelo.Promociones"%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*" %>
<html>
    <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>Agregar Helado</title>
        <link rel="icon" href= "./images/icon.png">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Mukta+Vaani:wght@300&display=swap" rel="stylesheet">
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <link rel = "stylesheet" type = 'text/css' href = 'Styles/Estilos.css'>
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Bangers&display=swap" rel="stylesheet">
        <script src="https://kit.fontawesome.com/9fb0a1aa63.js" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    </head>
    <body>
    <body>
        <header>
            <div class = "container logo-nav-container">
                <image class = "logoimagen" src = "./images/logo.png" alt = "No se porque no carga :c" title = "Heladería Internacional"><a href="#" class = "logo">Agregar <div class="espacio"></div>Helado</a></image>
                <span class="menu-icon">Ver Menú  <i class="fas fa-chevron-down"></i></span>
                <nav class = "navigation">
                    <ul>
                        <li onclick="javascript:IniciarSesion()"><i class="fas fa-home"></i> Iniciar Sesión</li>
                        <li onclick="javascript:Inicio()"><i class="fas fa-door-open"></i> Regresar</li>
                    </ul>
                </nav>
            </div>
        </header>

        <section>
            <main>

                <form action="agregarHelado" name="" class="formulario">

                    <h4 class="formulario__titulo">Agregar Helado</h4>
                    <input type="text" name="nombreHelado" placeholder="Nombre del helado" onkeypress="return validarLetras(event)" class="formulario__input" > 
                    <input id="inputXD" type="number" min="1" onkeypress="return validarNumeros(event)" name = "precio100gr" class="formulario__input" placeholder="Precio por 100gr">
                    <input id="inputXD" type="number" min="1" onkeypress="return validarNumeros(event)" name = "stock" class="formulario__input" placeholder="Stock a agregar en gramos">
                    <h4 style="font-size:20px;" class="formulario__titulo">Presentaciones disponibles</h4>
                    
                    <%
                        List<Presentaciones> lista2 = AccionesPresentaciones.listarPresentaciones();
                        for (Presentaciones pp : lista2){
                    %>
                    
                    <input style="margin-left: 25px; font-size: 20px" class="form-check-input" type="checkbox" id="<%= pp.getId() %>" name="<%= pp.getPresentacion() %>" value="1">
                    <label style="margin-left: 25px; font-size: 20px" class="form-check-label" style="font-size: 20px;" for="<%= pp.getPresentacion() %>"> <%= pp.getPresentacion() %> $<%= pp.getPrecioPresentacion() %>C/U </label><br>
                    
                    <%
                        }
                    %>
                    <h4 style="font-size:20px;" class="formulario__titulo">Promociones disponibles</h4>
                    <%
                        List<Promociones> lista = AccionesPromociones.listarPromociones();
                        for (Promociones p : lista) {
                    %>

                    <input style="margin-left: 25px; font-size: 20px" class="form-check-input" type="checkbox" id="<%= p.getId() %>" name="<%= p.getPromocion() %>" value="1">
                    <label style="margin-left: 25px; font-size: 20px" class="form-check-label" style="font-size: 20px;" for="<%= p.getPromocion() %>"> <%= p.getPromocion() %></label><br>
                    
                    <%
                        }
                    %>
                    
                    <div style="margin-top: 20px;" class="botones">
                        <input type="submit" class="boton" value="Agregar Helado">
                    </div>
                </form>

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
