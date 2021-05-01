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

function abrir(){
    document.getElementById("vent").style.display="block";
}
function cerrar(){
    document.getElementById("vent").style.display="none";
}

function inicio(){
    location.href = "index.html"
}
function iniciarsesion(){
    location.href = "IniciarSesion.html"
}
function crearcuenta(){
    location.href = "CrearCuenta.html"
}
function codigo(){
    location.href = "Codigo.html"
}
function cuenta(){
    location.href = "Cuenta.html"
}
function formulario(){
    location.href = "Formulario.html"
}
function olvidar(){
    location.href = "Olvidar.html"
}
function resultado(){
    location.href = "Resultado.html"
}
function chat(){
    location.href = "Chat.html"
}

function velox(){
    window.open("https://giancarlogall.github.io/VeloxPagina/Velox.html");
}
function facebook(){
    window.open("https://www.facebook.com/VeloxSoftware");
}
function instagram(){
    window.open("https://www.instagram.com/veloxsoftware/");
}
function twitter(){
    window.open("https://twitter.com/SoftwareVelox");
}