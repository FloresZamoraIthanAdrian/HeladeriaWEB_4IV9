//Validar inicio de sesion
function validar(formulario) {

    if (formulario.usuario.value.length > 20 || formulario.contrasena.value.length > 20) {
        alert("Caracteres excedidos");
        formulario.Usuario.focus();
        return false;
    }

    return b.test(txt);

}

function validarRegistro(formularioRegistro) {

    verificarDatos = true;

    if (formularioRegistro.nombre.value.length > 20) {
        verificarDatos = false;
        alert("El campo de nombre tiene un maximo de 20 caracteres")
        return false;
    }

    if (formularioRegistro.appat.value.length > 20) {
        verificarDatos = false;
        alert("El campo de apellido paterno tiene un maximo de 20 caracteresbloquear")
        return false;
    }

    if (formularioRegistro.apmat.value.length > 20) {
        verificarDatos = false;
        alert("El campo de apellido materno tiene un maximo de 20 caracteres")
        return false;
    }

    if (formularioRegistro.usuario.value.length > 20) {
        verificarDatos = false;
        alert("El campo de usuario tiene un maximo de 20 caracteres")
        return false;
    }

    if (formularioRegistro.edad.value.length > 2) {
        verificarDatos = false;
        alert("La edad maxima es de 99 años")
        return false;
    }

    //Fecha de nacimiento

    if (formularioRegistro.telefono_Particular.value.length != 10) {
        verificarDatos = false;
        alert("El telefono Particular debe de contar con 10 digitos ")
        return false;
    }

    if (formularioRegistro.telefono_Celular.value.length != 10) {
        verificarDatos = false;
        alert("El telefono celular debe de contar con 10 digitos ")
        return false;
    }

    if (formularioRegistro.domicilio.value.length > 100) {
        verificarDatos = false;
        alert("El domicilio tiene un maximo de 100 caracteres ")
        return false;
    }

    if (formularioRegistro.contrasena.value.length > 20) {
        verificarDatos = false
        alert('La contraseña tiene un maximo de 20 caracteres')
        return false;
    }

    if (formularioRegistro.contrasena.value != formularioRegistro.verificarContrasena.value) {
        verificarDatos = false
        alert('La contraseñas deben coincidir')
        return false;
    }

}

function validarCompra(formularioCompra) {
    if (formularioCompra.Cantidad.value < 1) {
        alert('Tiene que comprar al menos un litro de helado');
        return false;
    }
}

function validarAgregar(agregarHelado) {

    if (agregarHelado.helado.value.length > 15) {
        alert('Eliga un nombre mas corto para el helado');
        return false;
    }

    if (agregarHelado.precio.value < 0) {
        alert('El precio debe ser mayor a 0');
        return false;
    }

    if (agregarHelado.cantidad.value < 0) {
        alert('La cantidad debe ser mayor a 0');
        return false;
    }

    if (agregarHelado.precio.value < agregarHelado.precioMayoreo.value) {
        alert('El precio de Mayoreo debe ser menor al normal');
        return false;
    }

}

