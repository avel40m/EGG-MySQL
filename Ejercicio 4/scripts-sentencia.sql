select nombre from jugadores order by nombre;

select nombre from jugadores where posicion ="C" and peso > 200 ;

select nombre from equipos order by nombre;

select nombre from equipos where Conferencia = "east";

select nombre,ciudad from equipos where ciudad like "c%" ;

select j.nombre,e.nombre from jugadores j inner join equipos e where e.Nombre = j.Nombre_equipo order by e.Nombre;

select j.nombre,e.nombre from jugadores j inner join equipos e where e.Nombre = j.Nombre_equipo and e.Nombre = "raptors";

select e.Puntos_por_partido from jugadores j inner join estadisticas e where j.codigo=e.jugador and j.Nombre = "pau gasol";

select e.Puntos_por_partido from jugadores j inner join estadisticas e where j.codigo = e.jugador and j.Nombre = "pau gasol" and e.temporada = "04/05";

select j.Nombre,round(sum(e.Puntos_por_partido), 2) as "Puntos Carrera" 
from jugadores j inner join estadisticas e where j.codigo = e.jugador group by j.Nombre;

select e.Nombre,count(j.Nombre) as "Número de jugadores" from jugadores j 
inner join equipos e where j.Nombre_equipo = e.Nombre group by e.Nombre;

select j.Nombre,e.Puntos_por_partido from jugadores j inner join estadisticas e 
where j.codigo = e.jugador order by e.Puntos_por_partido desc limit 1;

select e.Nombre,e.Conferencia,e.Division from equipos e inner join jugadores j on e.Nombre = j.Nombre_equipo
where j.Altura = (select max(Altura) from jugadores);

select round(avg(e.Puntos_por_partido),2)  from estadisticas e inner join jugadores j on e.jugador = j.codigo 
inner join equipos eq on j.Nombre_equipo = eq.Nombre where eq.Division = "pacific" group by eq.Division;

select *,(puntos_local - puntos_visitante) as "Diferencia" 
from partidos order by (puntos_local - puntos_visitante) desc limit 1;

select round((p.puntos_local + p.puntos_visitante) / 2,2) from partidos p inner join equipos e on p.equipo_local = e.Nombre 
where e.Division = "pacific" group by e.Division;

select e.Nombre,sum(p.puntos_local) as "Puntos Locales",sum(p.puntos_visitante) as "Puntos Visitantes" 
from equipos e inner join partidos p on e.Nombre = p.equipo_local group by e.Nombre;

select * from partidos;

select codigo,puntos_local,puntos_visitante,
 if(puntos_local> puntos_visitante,"Gano local",if(puntos_local < puntos_visitante,"Gabo Visitante", "null"))
 as "Resultado del partido" from partidos;
