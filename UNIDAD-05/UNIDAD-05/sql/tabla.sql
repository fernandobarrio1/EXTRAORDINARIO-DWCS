-- Creamos la base de datos
create database examen05;

-- La seleccionamos
use examen05;

create user admin05@'localhost' identified by "secreto";
grant all on examen05.* to admin05@'localhost';

 -- Creamos las Tablas --
 create table jugadores(
    id int auto_increment primary key,
    nombre varchar(40) not null,
    apellidos varchar(60) not null,
    dorsal int unique,
    posicion enum('Portero', 'Defensa', 'Lateral Izquierdo', 'Lateral Derecho', 'Central', 'Delantero'),
    barcode varchar(13) unique not null
 );

 create table entrenadores(
    id int auto_increment primary key,
    nombre varchar(40) not null,
    apellidos varchar(60) not null,
    especialidad varchar(60)
 );

 create table entrenador_jugador(
    id int auto_increment primary key,
    id_entrenador int not null,
    id_jugador int not null,
    fecha_inicio date not null,
    fecha_fin date,
    foreign key (id_entrenador) references entrenadores(id),
    foreign key (id_jugador) references jugadores(id)
 );

-- para implementar el login, necesitamos una tabla de usuarios
create table usuarios (
usuario varchar(20) primary key,
pass varchar(64) not null
);

-- 3.- Creamos un par de usuarios de prueba, vamos a utilizar sha256
-- Para guardar las contraseñas, en realidad guardamos el hash.
insert into usuarios select 'admin' , sha2('secreto',256);
insert into usuarios select 'gestor' , sha2('pass',256);