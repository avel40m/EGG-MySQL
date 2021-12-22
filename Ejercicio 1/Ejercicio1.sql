CREATE database superheroe;
USE superheroe;

create table personajes(
	id_personajes int primary key not null auto_increment,
    nombre_real varchar (20),
    personaje varchar (20),
    inteligencia int,
    fuerza varchar (10),
    velocidad int,
    poder int,
    aparicion int,
    ocupacion varchar(30),
    id_creador int,
    foreign key (id_creador) references creador(id_creador)
);

INSERT INTO creador VALUES (2,'DC Comics');

select * from personajes;

DROP SCHEMA superheroe;

UPDATE personajes SET aparicion=1938 WHERE id_personajes=12;

DELETE FROM personajes  WHERE id_personajes = 10;

