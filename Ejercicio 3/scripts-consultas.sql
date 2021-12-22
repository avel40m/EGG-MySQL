select nombre from producto;
select nombre, precio from producto;
select * from producto;
select nombre, round(precio) from producto;
select * from fabricante;
select f.codigo from fabricante f right join producto p on f.codigo = p.codigo_fabricante;
select f.codigo from fabricante f right join producto p on f.codigo = p.codigo_fabricante group by f.codigo;
select nombre from fabricante order by nombre;
select nombre, precio from producto order by nombre, precio desc;
select * from fabricante limit 5;
select nombre, precio from producto order by precio limit 1;
select nombre, precio from producto order by precio desc limit 1;
select nombre from producto where precio <= 120;
select * from producto where precio between 60 and 200;
select * from producto p, fabricante f where p.codigo = f.codigo and f.codigo in (1,3,5);
select * from producto where nombre like "%Portatíl%";
select p.codigo,p.nombre,f.codigo,f.nombre from fabricante f, producto p where f.codigo = p.codigo;
select p.nombre,p.precio,f.nombre from fabricante f, producto p where f.codigo = p.codigo order by f.nombre;
select p.nombre,p.precio,f.nombre from fabricante f, producto p order by p.precio limit 1;
select p.codigo,p.precio,p.nombre from producto p, fabricante f where f.nombre = "Lenovo";
select p.* from producto p inner join fabricante f on p.codigo_fabricante = f.codigo where f.nombre = "crucial" and p.precio > 200;
select p.* from producto p inner join fabricante f on p.codigo_fabricante = f.codigo where f.nombre in ("asus","hewlett-packard");
select p.nombre,p.precio,f.nombre from producto p inner join fabricante f on p.codigo_fabricante=f.codigo order by p.precio desc, p.nombre asc;
select f.*,p.nombre from producto p right join fabricante f on p.codigo_fabricante = f.codigo;
select f.*,p.nombre from producto p right join fabricante f on p.codigo_fabricante = f.codigo where p.nombre is null;
select * from producto where codigo_fabricante = (select codigo from fabricante where nombre = "lenovo");

select * from producto where codigo_fabricante = (select codigo from fabricante where nombre = "lenovo")
and precio = (select precio from producto where codigo_fabricante = (select codigo from fabricante where nombre = "lenovo") limit 1);

select nombre from producto where codigo_fabricante = (select codigo from fabricante where nombre = "lenovo" order by precio limit 1);

select * from producto where codigo_fabricante = (select codigo from fabricante where nombre = "asus") and
precio > (select avg(precio) from producto);

select nombre from fabricante where codigo in (select codigo_fabricante from producto );
select nombre from fabricante where codigo not in (select codigo_fabricante from producto);

select * from producto where codigo_fabricante = (
select f.codigo from producto p,fabricante f group by f.nombre having f.nombre = "lenovo");
