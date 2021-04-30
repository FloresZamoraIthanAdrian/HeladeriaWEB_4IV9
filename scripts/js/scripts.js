jQuery('document').ready(function ($) {
    var menuBtn = $('.menu-icon'),
        menu = $('.navigation ul');

    menuBtn.click(function () {
        if (menu.hasClass('show')) {

            menu.removeClass('show');

        } else {

            menu.addClass('show')
        }
    });
});

$(document).ready(function () {
    $("#inputXD").on('paste', function (e) {
        e.preventDefault();
        alert('Esta acción está prohibida');
    })

    $("#inputXD").on('copy', function (e) {
        e.preventDefault();
        alert('Esta acción está prohibida');
    })
})

//Funciones para nevegar 
function Inicio() {
    location.href = "../index.html"
}

function IniciarSesion(){
    location.href = "IniciarSesion.html";
}

function CrearCuenta(){
    location.href = "CrearCuenta.html";
}

function Olvidar(){
    location.href = "Olvidar.html";
}

function abrir() {
    document.getElementById("vent").style.display = "block";
}
function cerrar() {
    document.getElementById("vent").style.display = "none";
}

function validarFecha(e){
    var teclado = (document.all) ? e.keyCode : e.which;

    if (teclado == 8) return true;

    var patron = /^(?:3[01]|[12][0-9]|0?[1-9])([\-/.])(0?[1-9]|1[1-2])\1\d{4}$/;

    var prueba = String.fromCharCode(teclado);

    return patron.test(prueba);
}

function validarLetras(e) {
    var teclado = (document.all) ? e.keyCode : e.which;

    if (teclado == 8) return true;

    var patron = /[a-z-A-Z]/;

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

function validarNumeros(e) {
    var teclado = (document.all) ? e.keyCode : e.which;

    if (teclado == 8) return true;

    var patron = /\d/;

    var prueba = String.fromCharCode(teclado);

    return patron.test(prueba);
}