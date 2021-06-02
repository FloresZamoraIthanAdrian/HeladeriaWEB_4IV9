<!DOCTYPE html>
<html>
    <head>

        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>Crear Cuenta</title>
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
                        <li onclick="javascript:IniciarSesion()"><i class="fas fa-home"></i> Iniciar Sesión</li>
                        <li onclick="javascript:Inicio()"><i class="fas fa-door-open"></i> Regresar</li>
                    </ul>
                </nav>
            </div>
        </header>



        <section>
            <main>

                <form action="registrarUsuario" name="" onsubmit="return validarRegistro(this)" id="formularioRegistro" class="formulario">

                    <h4 class="formulario__titulo">Porfavor ingrese sus datos para poder disfrutar de los mejores helados</h4>
                    <input type="text" onkeypress="return validarLetras(event)" name = "nombre" class="formulario__input" placeholder="Nombre">
                    <input onkeypress="return validarLetras(event)" name = "appat" class="formulario__input" placeholder="Apellido paterno">
                    <input type="text" onkeypress="return validarLetras(event)" name = "apmat" class="formulario__input" placeholder="Apellido materno">
                    <input type="text" onkeypress="return validarLetras(event)" name = "usuario" class="formulario__input" placeholder="Usuario">
                    <input type="text" onkeypress="return validarNumeros(event)" name = "edad" class="formulario__input" placeholder="Edad">
                    <input type="date" onkeypress="return validarNumeros(event)" name = "fecha_de_nacimiento" class="formulario__input" placeholder="Fecha de nacimiento(dd / mm / aaaa)">
                    <input type="text" onkeypress="return validarNumeros(event)" name = "telefono_Particular" class="formulario__input" placeholder="Telefono particular">
                    <input type="text" onkeypress="return validarNumeros(event)" name = "telefono_Celular" class="formulario__input" placeholder="Telefono celular">
                    <input type="text" onkeypress="return validarAlfaNumericos(event)" name = "domicilio" class="formulario__input" placeholder="Domicilio">
                    <input type="password" onkeypress="return validarAlfaNumericos(event)" name = "contrasena" class="formulario__input" placeholder="Contraseña (6 caracteres mínimo)">
                    <input type="password" onkeypress="return validarAlfaNumericos(event)" name = "verificarContrasena" class="formulario__input" placeholder="Verificar Contraseña">

                    <p class = "centro">Estoy deacuerdo con <a href="javascript:abrir()">Términos y Condiciones <i class="far fa-check-square"></i></a></p>

                    <div class="botones">
                        <button id="btnShow" class="boton" onclick="mostrarContrasena()">Ocultar/Mostrar contrasena</button>
                    </div>

                    <div class="ventana" id = "vent">
                        <p class="centro">Aqui van los terminos y condiciones de nuestra pagina web :3</p>
                        <div class = "botones">
                            <div class="boton2" onclick="cerrar()"><i class="fas fa-ice-cream"></i> <div class="espacio"></div>Aceptar</div>
                        </div>
                    </div>
                    <div class="botones">
                        <input type="submit" class="boton" value="Registrarse">
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
