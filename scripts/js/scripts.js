jQuery('document').ready(function($){
    var menuBtn = $('.menu-icon'),
        menu = $('.navigation ul');

    menuBtn.click(function(){
        if(menu.hasClass('show')){

            menu.removeClass('show');

        } else {

            menu.addClass('show')
        }
    });
});
function Inicio(){
    location.href = "index.html"
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
function abrir(){
    document.getElementById("vent").style.display="block";
}
function cerrar(){
    document.getElementById("vent").style.display="none";
}
function validarLetras(e){
    var teclado = (document.all) ? e.keyCode : e.which;

    if(teclado == 8) return true;

    var patron = /[a-z-A-Z]/;

    var prueba = String.fromCharCode(teclado);

    return patron.test(prueba); 
}

function validarAlfaNumericos(e){
    var teclado = (document.all) ? e.keyCode : e.which;

    if(teclado == 8) return true;

    var patron = /[a-z-A-Z\d]/;

    var prueba = String.fromCharCode(teclado);

    return patron.test(prueba);
}

function validarNumeros(e){
    var teclado = (document.all) ? e.keyCode : e.which;

    if(teclado == 8) return true;

    var patron = /\d/;

    var prueba = String.fromCharCode(teclado);

    return patron.test(prueba);
}