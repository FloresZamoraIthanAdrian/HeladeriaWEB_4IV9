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

/*Catlogo IN*/
create table Cpromocion(
id_promocion int not null auto_increment,
tipo_promocion varchar(100),
primary key(id_promocion),
key(tipo_promocion)
);

/*Catalogo IN*/
create table Cpresentacion(
id_presentacion int not null auto_increment,
tipo_presentacion varchar(100),
precio_presentacion int,
primary key(id_presentacion),
key(tipo_presentacion)
);

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

select * from mProducto;
select * from cpromociones_a;
SELECT * FROM cpresentaciones_a;

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
CREATE PROCEDURE AgregarHeladoD(
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
in boolns0 tinyint
)
BEGIN
insert into mproducto(tipohelado, precio_producto)
values (helado, precio);
insert into cpromociones_a(dosuno, tresuno, maymil, may10k, maydos, mayquin) 
values(boolns, boolns1, boolns2, boolns3, boolns4, boolns5);
insert into cpresentaciones_a(cubeta, cono, barquillo, bote, vaso) 
values(boolns6, boolns7, boolns8, boolns9, boolns0);
set @var := (select id_producto from mproducto where tipohelado = helado);
update mproducto set id_promocion = @var, id_presentacion = @var where tipohelado = helado;
END $$
DELIMITER 

select dosuno, tresuno, maymil, may10k, maydos, maayquin from cpromociones_a where id_promociones_a = 2; 





