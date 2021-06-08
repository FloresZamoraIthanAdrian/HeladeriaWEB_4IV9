create database heladeria;
use heladeria;

show tables;

create table mProducto(
id_producto int not null auto_increment,
tipohelado varchar(100),
id_promocion int ,
id_presentacion int,
precio_producto int,
primary key(id_producto),
key(tipohelado),
key(id_promocion),
key(id_presentacion),
key(precio_producto)
);

update mproducto set stock_producto = 350000 where id_producto = 4;

create table Cpromocion(
id_promocion int not null auto_increment,
tipo_promocion varchar(100),
primary key(id_promocion),
key(tipo_promocion)
);

create table Cpresentacion(
id_presentacion int not null auto_increment,
tipo_presentacion varchar(100),
precio_presentacion int,
cantidad_presentacion int,
primary key(id_presentacion),
key(tipo_presentacion)
);

update cpresentacion set cantidad_presentacion = 80 where id_presentacion = 5;
select * from Cpresentacion;

insert into cpromocion(tipo_promocion) values
('3 X 1 (Todas las presentaciones)');
insert into cpromocion(tipo_promocion) values
('2 X 1 (Todas las presentaciones)');
insert into cpromocion(tipo_promocion) values
('A partir de $200 se obtiene un descuento de 10%');
insert into cpromocion(tipo_promocion) values
('A partir de $1000 se obtiene un descuento de 30%');
insert into cpromocion(tipo_promocion) values
('A partir de $600 se obtiene un descuento de 20%');
insert into cpromocion(tipo_promocion) values
('A partir de $10000 se obtiene un descuento de 50%');
insert into cpresentacion(tipo_presentacion, precio_presentacion) values ('Vaso', 25);
insert into cpresentacion(tipo_presentacion, precio_presentacion) values ('Cubeta', 300);
insert into cpresentacion(tipo_presentacion, precio_presentacion) values ('Bote de helado', 350);
insert into cpresentacion(tipo_presentacion, precio_presentacion) values ('Barquillo', 60);
insert into cpresentacion(tipo_presentacion, precio_presentacion) values ('Cono', 40);
insert into cpresentacion(tipo_presentacion, precio_presentacion) values ('Cono', 40);

describe mProducto;
describe cpromociones_a;
describe cpresentaciones_a;
describe dCompra;

select * from Cpresentacion;
select * from cpromocion;
select * from mProducto;
select * from cpromociones_a;
SELECT * FROM cpresentaciones_a;
select * from musuario;
select * from dcompra;

create table cpromociones_a(
id_promociones_a int not null auto_increment,
dosuno tinyint,
tresuno tinyint,
maymil tinyint,
may10k tinyint,
maydos tinyint,
mayquin tinyint,
primary key(id_promociones_a),
foreign key(id_promociones_a) references mProducto(id_producto) on delete cascade on update cascade
);

create table cpresentaciones_a(
id_presentacion_a int not null auto_increment,
cubeta tinyint,
cono tinyint,
barquillo tinyint,
bote tinyint,
vaso tinyint,
primary key(id_presentacion_a),
foreign key(id_presentacion_a) references mProducto(id_producto) on delete cascade on update cascade
);

DELIMITER $$
CREATE PROCEDURE AgregarHeladonwn(
in helado varchar(100),
in precio int,
in boolns tinyint,
in boolns1 tinyint,
in boolns2 tinyint,
in boolns3 tinyint,
in boolns4 tinyint,
in boolns5 tinyint,
in boolns6 tinyint,
in boolns7 tinyint,
in boolns8 tinyint,
in boolns9 tinyint,
in boolns0 tinyint,
in stock int
)
BEGIN
insert into mproducto(tipohelado, precio_producto, stock_producto)
values (helado, precio, stock);
insert into cpromociones_a(dosuno, tresuno, maymil, may10k, maydos, mayquin) 
values(boolns, boolns1, boolns2, boolns3, boolns4, boolns5);
insert into cpresentaciones_a(cubeta, cono, barquillo, bote, vaso) 
values(boolns6, boolns7, boolns8, boolns9, boolns0);
set @var := (select id_producto from mproducto where tipohelado = helado);
update mproducto set id_promocion = @var, id_presentacion = @var where tipohelado = helado;
END $$
DELIMITER 

DELIMITER $$
CREATE PROCEDURE borrarHelado(
in id_borrar int
)
BEGIN
delete from mproducto where id_producto = id_borrar;
delete from cpromociones_a where id_promociones_a = id_borrar;
delete from cpresentaciones_a where id_presentacion_a = id_borrar;
END $$
DELIMITER 

DELIMITER $$
CREATE PROCEDURE editarHeladonwn(
in id int,
in precio int,
in boolns tinyint,
in boolns1 tinyint,
in boolns2 tinyint,
in boolns3 tinyint,
in boolns4 tinyint,
in boolns5 tinyint,
in boolns6 tinyint,
in boolns7 tinyint,
in boolns8 tinyint,
in boolns9 tinyint,
in boolns0 tinyint,
in editarStock int
)
BEGIN
set @var := (select id_promocion from mproducto where id_producto = id);
update mproducto set precio_producto = precio, stock_producto = editarStock where id_producto = id;
update cpresentaciones_a set 
cubeta = boolns,
cono = boolns1,
barquillo = boolns2,
bote = boolns3,
vaso  = boolns4 where id_presentacion_a = id;
update cpromociones_a set 
dosuno = boolns5,
tresuno = boolns6,
maymil = boolns7,
may10k = boolns8,
maydos = boolns9,
mayquin = boolns0 where id_promociones_a = id;
END $$
DELIMITER 

create table mUsuario(
id_usuario	int not null auto_increment,	
nom_usu varchar(50), 
appat_usu varchar(50),
appmat_usu varchar(50),
usu varchar(50),
edad_usu int,
fecha varchar(12),
telp_usu varchar(10),
telc_usu varchar(10),
domicilio varchar(100),
cont_usu varchar(50),
primary key(id_usuario)
);

DELIMITER $$
create table ecompra(
id_compra int not null auto_increment,
id_usuario int,
primary key(id_compra)
);

create table DCompra(
id_compra int not null auto_increment,
id_producto int not null,
id_promocion int,
id_presentacion int,
cantidad_p int,
subtotal float,
id_ecompra int,
primary key(id_compra)
);
DELIMITER $$

DELIMITER $$
create table cformaPago(
id_formaPago int not null,
tipo_Pago varchar(15) not null,
primary key(id_formaPago),
key(tipo_Pago)
);

DELIMITER $$
create procedure agregarHeladoCC__nwn__3(
in id_product int,
in id_presentacionIn int,
in cantidad int,
in id_promo int,
in usuarioCompra int
)
BEGIN
set @var:= (select stock_producto from mproducto where id_producto = id_product);
set @cantidad := (select cantidad_presentacion from cpresentacion where id_presentacion = id_presentacionIn);
set @disponibilidad = @var/@cantidad;
set @boolDisp := (select IF(@disponibilidad > cantidad, 1, 0));
set @precio := (select cantidad_presentacion from cpresentacion where id_presentacion = id_presentacionIn);
set @gramostotales = cantidad * @precio;
set @reducir = @var - @gramostotales;
update mproducto set stock_producto = @reducir where id_producto = id_product;
set @precio100gr := (select precio_producto from mproducto where id_producto = id_product);
set @numVeces = @gramostotales / 100;
set @subtotal = @numVeces * @precio100gr;
insert into Dcompra(id_producto, id_promocion, id_presentacion, cantidad_p, subtotal, id_ecompra)
select id_product, id_promo, id_presentacionIn, cantidad, @subtotal, usuarioCompra where @boolDisp > 0;
insert into ecompra (id_usuario) values (usuarioCompra);
END $$
DELIMITER 

DELIMITER $$
create procedure editarPedido(
in id_com int,
in id_product int,
in id_promo int, 
in id_pre int, 
in cant int,
in id_ped int,
in sub int,
in id_userP int
)
BEGIN
set @var:= (select stock_producto from mproducto where id_producto = id_product);
set @cantidad := (select cantidad_presentacion from cpresentacion where id_presentacion = id_pre);
set @disponibilidad = @var/@cantidad;
set @boolDisp := (select IF(@disponibilidad > cantidad, 1, 0));
set @precio := (select precio_producto from mproducto where id_producto = id_product);
set @gramostotales = cantidad * @precio;
set @reducir = @var - @gramostotales;
update mproducto set stock_producto = @reducir where id_producto = id_product;
set @precio100gr := (select precio_producto from mproducto where id_producto = id_product);
set @numVeces = @gramostotales / 100;
set @subtotal = @numVeces * @precio100gr;
update Dcompra set id_promocion = id_promo, id_presentacion = id_pre, cantidad_p = cant, subtotal = @subtotal 
where id_compra = id_com and 
id_ecompra = id_userP;
END $$
DELIMITER 

DELIMITER $$
create procedure borrarHeladoCarritounu(
in id_pedidoB int,
in id_usuarioB int
)
BEGIN
delete from dcompra where id_compra = id_pedidoB and id_ecompra = id_usuarioB;
END $$
DELIMITER 

DELIMITER $$
create procedure editarDatosUsuariouwu(
in id_editar int,
in nombre varchar(30),
in appat varchar(30),
in apmat varchar(30),
in usuario varchar(30),
in age int,
in naci varchar(15),
in tlfp varchar(12),
in tlfc varchar(12),
in dondeVive varchar(100), 
in passwd varchar(30)
)
BEGIN
update musuario set 
nom_usu = nombre,
appat_usu = appat, 
appmat_usu = apmat,
usu = usuario,
edad_usu = age,
fecha = naci,
telp_usu = tlfp,
telc_usu = tlfc,
domicilio = dondeVive
where id_usuario = id_editar and cont_usu = passwd;
END $$
DELIMITER 

DELIMITER $$
create procedure cambiarPass(
in id_cambiar int, 
in oldPass varchar(20),
in newPass varchar(20)
)
BEGIN
set @var := (select cont_usu from musuario where id_usuario = id_cambiar);
set @ifq := (select if(@var = oldPass, 1, 0));
update musuario set cont_usu = newPass where id_usuario = id_cambiar and @ifq > 0;
END $$
DELIMITER 

DELIMITER $$
create table mtarjeta(
id_generalt int not null auto_increment,
id_tarjeta int not null,
titular_tarjeta varchar(30) not null,
numero_tarjeta varchar(16) not null,
mes_vencimiento varchar(3) not null,
year_vencimiento varchar(4) not null,
cvv_tarjeta varchar(4) not null,
id_tipoTarjeta int not null,
primary key(id_generalt)
);

create table ctipoTarjeta(
id_tipoTarjeta int not null auto_increment,
tipo_tarejeta varchar(45),
primary key(id_tipoTarjeta)
);

DELIMITER $$
create procedure editarHeladoCC10(
in idProm int, 
in idPres int, 
in id_User int,
in idPed int, 
in cant int
)
BEGIN
set @idPro := (select id_producto from dcompra where id_compra = idPed and id_ecompra = id_User);
set @stock := (select stock_producto from mproducto where id_producto = @idPro);
set @preciogr := (select precio_producto from mproducto where id_producto = idProm);
set @cantidadPres := (select cantidad_presentacion from cpresentacion where id_presentacion = idPres);
set @disponibilidad = @stock/ @cantidadPres;
set @boolDisp := (select IF(@disponibilidad > @cantidadPres, 1, 0));
set @precioUnidad = @preciogr * @cantidadPres;
set @vecesCobrar = cant/@cantidadPres;
set @subtotal = cant * @precioUnidad;
update dcompra set id_promocion = idProm, id_presentacion = idPres, cantidad_p = cant, subtotal = @subtotal 
where id_compra = idPed and id_ecompra = id_User and @boolDisp > 0;
END $$
DELIMITER 

DELIMITER $$
create table mcompra(
id_compra int not null auto_increment,
fecha_compra date not null,
id_dcompra int not null,
primary key(id_compra)
);















