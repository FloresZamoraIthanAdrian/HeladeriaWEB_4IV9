function validarLetras(e) {
    var teclado = (document.all) ? e.keyCode : e.which;

    if (teclado == 8) return true;

    var patron = /[a-z-A-Z\s]/;

    var prueba = String.fromCharCode(teclado);

    return patron.test(prueba);
}

function validarAlfaNumericos2(e) {
    var teclado = (document.all) ? e.keyCode : e.which;

    if (teclado == 8) return true;

    var patron = /[a-z-A-Z\d\s]/;

    var prueba = String.fromCharCode(teclado);

    return patron.test(prueba);
}

function validarAlfaNumericos(e) {
    var teclado = (document.all) ? e.keyCode : e.which;

    if (teclado == 8) return true;

    var patron = /[a-z-A-Z\d]/;

    var prueba = String.fromCharCode(teclado);

    return patron.test(prueba);
}

function validarInicioSesion(formularioInicio){
    if(formularioInicio.Contraseña.value.length > 20){
        alert('Caracteres excedidos')
    }
    var txt = formularioInicio.CorreoElectrónico.value;

    var b = /^[^@\s]+@[^@\.\s]+(\.[^@\.\s]+)+$/;

    alert("Email "+(b.test(txt)?"":" no ")+" valido");
    
    return b.test(txt);
}

function validarRegistro(formularioRegistro){

    verificarDatos = true;

    if(formularioRegistro.Nombre.value.length > 30 && formularioRegistro.Nombre.value.length < 6){
        verificarDatos = false;
        alert("El campo de nombre tiene un maximo de 30 caracteres y minimo de 6")
        return false;
    }

    if(formularioRegistro.Usuario.value.length > 20 && formularioRegistro.Usuario.value.length < 6){
        verificarDatos = false;
        alert("El campo de usuario tiene un maximo de 20 caracteres y minimo de 6")
        return false;
    }

    if(formularioRegistro.Contraseña.value.length > 20 && formularioRegistro.Contraseña.value.length < 6){
        alert('La contraseña tiene un maximo de 20 caracteres y minimo de 6')
        return false;
    }

    if(formularioRegistro.Contraseña.value != formularioRegistro.VerificarContraseña.value){
        verificarDatos = false
        alert('La contraseñas deben coincidir')
        return false;
    }

    var txt = formularioRegistro.CorreoElectrónico.value;

    var b = /^[^@\s]+@[^@\.\s]+(\.[^@\.\s]+)+$/;

    alert("Email "+(b.test(txt)?"":" no ")+" valido");
    
    return b.test(txt);

}
