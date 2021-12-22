use personal;

SELECT * FROM departamentos;
SELECT * FROM empleados;
SELECT nombre_depto FROM departamentos;
SELECT nombre,sal_emp FROM empleados;
SELECT distinct comision_emp from empleados;
SELECT * FROM empleados WHERE cargo_emp = "Secretaria";
SELECT nombre FROM empleados order by nombre;
SELECT nombre,cargo_emp FROM empleados order by sal_emp;

SELECT sal_emp,comision_emp from empleados left join departamentos
on empleados.id_depto = departamentos.id_depto WHERE departamentos.id_depto = 2000 order by comision_emp;

SELECT empleados.nombre,SUM(sal_emp + comision_emp +  500) from empleados right join departamentos on empleados.id_depto = departamentos.id_depto
WHERE departamentos.id_depto = 3000 group by empleados.nombre order by empleados.nombre;

select * from empleados where nombre Like "j%";

select sal_emp AS SALARIO,comision_emp AS COMISION,SUM(sal_emp + comision_emp) AS TOTAL,
 nombre from empleados where comision_emp > 1000 group by nombre;

select sal_emp AS SALARIO, comision_emp AS COMISION, SUM(sal_emp + comision_emp) AS TOTAL,
nombre from empleados where comision_emp = 0 group by nombre;

select * from empleados where comision_emp > sal_emp;

select * from empleados where comision_emp <= (sal_emp - (sal_emp * 0.30));

select * from empleados where nombre not LIKE"%MA%";

SELECT * FROM departamentos where nombre_depto NOT IN ('VENTAS','INVESTIGACIÓN','MANTENIMIENTO');

SELECT nombre, MAX(sal_emp) FROM empleados;

SELECT * FROM empleados ORDER BY nombre DESC LIMIT 1; 

SELECT MAX(sal_emp) AS "Maximo",MIN(sal_emp) AS "Minimo", (MAX(sal_emp) - MIN(sal_emp)) AS "Diferencia" FROM empleados;

SELECT departamentos.nombre_depto, AVG(sal_emp) from empleados left join departamentos on empleados.id_depto = departamentos.id_depto
 group by departamentos.nombre_depto;

select nombre_depto,count(nombre) from departamentos d, empleados e group by d.nombre_depto having count(e.nombre) > 3; 

select  e.cargo_emp,e.cod_jefe,e.nombre, count(*) from departamentos d, empleados e where d.cod_director = e.cod_jefe
group by e.cod_jefe having count(*) >= 2;

select cod_jefe from empleados group by cod_jefe;

select d.id_depto,d.nombre_depto from empleados e, departamentos d where e.id_depto = d.id_depto group by d.id_depto having count(*) = 0;

select nombre,sal_emp from empleados e, departamentos d where e.id_depto = d.id_depto
 and e.sal_emp >= (select round((SUM(sal_emp) / count(id_emp))) from empleados) order by d.nombre_depto; 