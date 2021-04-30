//Validar inicio de sesion
function validar(formulario){

    if(formulario.usuario.value.length > 20 || formulario.contraseña.value.length > 20){
        alert("Caracteres excedidos");
        formulario.Usuario.focus();
        return false;
    }

    return b.test(txt);

}

//Validar Registro de usuario
function validarRegistro(formularioRegistro){

    verificarDatos = true;

    if(formularioRegistro.nombre.value.length > 20){
        verificarDatos = false;
        alert("El campo de nombre tiene un maximo de 20 caracteres")
        return false;
    }

    if(formularioRegistro.appat.value.length > 20){
        verificarDatos = false;
        alert("El campo de apellido paterno tiene un maximo de 20 caracteresbloquear")
        return false;
    }

    if(formularioRegistro.apmat.value.length > 20){
        verificarDatos = false;
        alert("El campo de apellido materno tiene un maximo de 20 caracteres")
        return false;
    }

    if(formularioRegistro.usuario.value.length > 20){
        verificarDatos = false;
        alert("El campo de usuario tiene un maximo de 20 caracteres")
        return false;
    }

    if(formularioRegistro.edad.value.length > 2){
        verificarDatos = false;
        alert("La edad maxima es de 99 años")
        return false;
    }

    //Fecha de nacimiento

    if(formularioRegistro.telefono_Particular.value.length != 10){
        verificarDatos = false;
        alert("El telefono Particular debe de contar con 10 digitos ")
        return false;
    }

    if(formularioRegistro.telefono_Celular.value.length != 10){
        verificarDatos = false;
        alert("El telefono celular debe de contar con 10 digitos ")
        return false;
    }

    if(formularioRegistro.domicilio.value.length > 100){
        verificarDatos = false;
        alert("El domicilio tiene un maximo de 100 caracteres ")
        return false;
    }

    if(formularioRegistro.contraseña.value.length > 20){
        verificarDatos = false
        alert('La contraseña tiene un maximo de 20 caracteres')
        return false;
    }

    if(formularioRegistro.contraseña.value != formularioRegistro.verificarContraseña.value){
        verificarDatos = false
        alert('La contraseñas deben coincidir')
        return false;
    }

    var txt = formularioRegistro.fecha_de_nacimiento.value;

    var b = /^(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}$/;

    alert("Formato de fecha"+(b.test(txt)?"":" no ")+" valido");
    
    return b.test(txt);

}
