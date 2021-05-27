function validarAdmin(formularioAdmin) {

    if (formularioAdmin.usuario.value == 'AdminIceMaster2592' && formularioAdmin.contrasena.value == 'LesSaco10AsiDije') {
        location.href = './Administrador.jsp'
    }

    if (formularioAdmin.usuario.value.length > 20 || formularioAdmin.contrasena.value.length > 20) {
        alert("Caracteres excedidos");
        return false;
    }
}
function mostrarContrasena() {
    var tipo = document.getElementById("password");
    if (tipo.type == "password") {
        tipo.type = "text";
    } else {
        tipo.type = "password";
    }
}


