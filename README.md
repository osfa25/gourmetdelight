# gourmetdelight




1. Obtener la lista de todos los menús con sus precios

```MySQL

SELECT nombre, precio
FROM menus;

+----------------+--------+
| nombre         | precio |
+----------------+--------+
| Ensalada Cesar |  12.50 |
| Sopa de Tomate |   8.75 |
| Filete de Res  |  25.00 |
| Pasta Alfredo  |  15.00 |
| Tarta de queso |   7.50 |
| Cafe Americano |   3.00 |
+----------------+--------+
6 rows in set (0,00 sec)

´´


2. Encontrar todos los pedidos realizados por el cliente 'Juan Perez'

```MySQL

SELECT p.id, p.fecha, p.total
FROM pedidos p
JOIN clientes c ON p.id_cliente = c.id
WHERE c.nombre = 'Juan Perez';

+----+------------+-------+
| id | fecha      | total |
+----+------------+-------+
|  1 | 2024-05-15 | 40.00 |
|  2 | 2024-06-01 | 25.50 |
+----+------------+-------+
2 rows in set (0,00 sec)

´´

3. Listar los detalles de todos los pedidos, incluyendo el nombre del menú, cantidad y precio unitario

```MySQL
SELECT dp.id_pedido, m.nombre AS menu, dp.cantidad, dp.precio_unitario
FROM detallespedidos dp
JOIN menus m ON dp.id_menu = m.id;

+-----------+----------------+----------+-----------------+
| id_pedido | menu           | cantidad | precio_unitario |
+-----------+----------------+----------+-----------------+
|         1 | Ensalada Cesar |        1 |           12.50 |
|         3 | Ensalada Cesar |        1 |           12.50 |
|         5 | Ensalada Cesar |        2 |           12.50 |
|         7 | Ensalada Cesar |        2 |           12.50 |
|        10 | Ensalada Cesar |        1 |           12.50 |
|        13 | Ensalada Cesar |        2 |           12.50 |
|        16 | Ensalada Cesar |        1 |           12.50 |
|         2 | Sopa de Tomate |        1 |            8.75 |
|         6 | Sopa de Tomate |        1 |            8.75 |
|         8 | Sopa de Tomate |        1 |            8.75 |
|        12 | Sopa de Tomate |        1 |            8.75 |
|        14 | Sopa de Tomate |        1 |            8.75 |
|        18 | Sopa de Tomate |        1 |            8.75 |
|         1 | Filete de Res  |        1 |           25.00 |
|         4 | Filete de Res  |        1 |           25.00 |
|         9 | Filete de Res  |        1 |           25.00 |
|        10 | Filete de Res  |        1 |           25.00 |
|        15 | Filete de Res  |        1 |           25.00 |
|        16 | Filete de Res  |        1 |           25.00 |
|         2 | Pasta Alfredo  |        1 |           15.00 |
|         3 | Pasta Alfredo  |        1 |           15.00 |
|         7 | Pasta Alfredo  |        1 |           15.00 |
|        11 | Pasta Alfredo  |        1 |           15.00 |
|        12 | Pasta Alfredo  |        1 |           15.00 |
|        13 | Pasta Alfredo  |        1 |           15.00 |
|        17 | Pasta Alfredo  |        1 |           15.00 |
|        18 | Pasta Alfredo  |        1 |           15.00 |
|         2 | Tarta de queso |        1 |            7.50 |
|         5 | Tarta de queso |        2 |            7.50 |
|         8 | Tarta de queso |        2 |            7.50 |
|        11 | Tarta de queso |        1 |            7.50 |
|        12 | Tarta de queso |        1 |            7.50 |
|        14 | Tarta de queso |        2 |            7.50 |
|        17 | Tarta de queso |        1 |            7.50 |
|        18 | Tarta de queso |        1 |            7.50 |
|         1 | Cafe Americano |        3 |            3.00 |
|         3 | Cafe Americano |        2 |            3.00 |
|         4 | Cafe Americano |        1 |            3.00 |
|         6 | Cafe Americano |        3 |            3.00 |
|         9 | Cafe Americano |        3 |            3.00 |
|        11 | Cafe Americano |        2 |            3.00 |
|        15 | Cafe Americano |        3 |            3.00 |
|        17 | Cafe Americano |        2 |            3.00 |
+-----------+----------------+----------+-----------------+
43 rows in set (0,00 sec)
´´

4. Calcular el total gastado por cada cliente en todos sus pedidos

```MySQL

SELECT c.nombre, SUM(p.total) AS total_gastado
FROM clientes c
JOIN pedidos p ON c.id = p.id_cliente
GROUP BY c.nombre;

+------------------+---------------+
| nombre           | total_gastado |
+------------------+---------------+
| Juan Perez       |         65.50 |
| Maria Lopez      |         83.75 |
| Carlos Mendoza   |         55.00 |
| Ana Gonzalez     |         61.00 |
| Luis Torres      |         45.00 |
| Laura Rivera     |         56.25 |
| Fernando Garcia  |         97.50 |
| Isabel Fernandez |         84.25 |
| Ricardo Morales  |         41.00 |
| Lucia Martinez   |         55.75 |
| Santiago Gimenez |         52.00 |
| Patricia Romero  |         46.25 |
+------------------+---------------+
12 rows in set (0,00 sec)
´´

5. Encontrar los menús con un precio mayor a $10

```MySQL

SELECT nombre, precio
FROM menus
WHERE precio > 10.00;

+----------------+--------+
| nombre         | precio |
+----------------+--------+
| Ensalada Cesar |  12.50 |
| Filete de Res  |  25.00 |
| Pasta Alfredo  |  15.00 |
+----------------+--------+
3 rows in set (0,00 sec)
´´

6. Obtener el menú más caro pedido al menos una vez

```MySQL

SELECT m.nombre, m.precio
FROM menus m
JOIN detallespedidos dp ON m.id = dp.id_menu
ORDER BY m.precio DESC
LIMIT 1;

+---------------+--------+
| nombre        | precio |
+---------------+--------+
| Filete de Res |  25.00 |
+---------------+--------+
1 row in set (0,00 sec)

´´


7. Listar los clientes que han realizado más de un pedido

```MySQL

SELECT c.nombre, COUNT(p.id) AS numero_de_pedidos
FROM clientes c
JOIN pedidos p ON c.id = p.id_cliente
GROUP BY c.nombre
HAVING COUNT(p.id) > 1;

+------------------+-------------------+
| nombre           | numero_de_pedidos |
+------------------+-------------------+
| Juan Perez       |                 2 |
| Maria Lopez      |                 2 |
| Ana Gonzalez     |                 2 |
| Laura Rivera     |                 2 |
| Fernando Garcia  |                 2 |
| Isabel Fernandez |                 2 |
+------------------+-------------------+
6 rows in set (0,00 sec)

´´


8. Mostrar el pedido más reciente de cada cliente

```MySQL

SELECT c.nombre, p.id, p.fecha, p.total
FROM clientes c
JOIN pedidos p ON c.id = p.id_cliente
WHERE (c.id, p.fecha) IN (
    SELECT id_cliente, MAX(fecha)
    FROM pedidos
    GROUP BY id_cliente
);

+------------------+----+------------+-------+
| nombre           | id | fecha      | total |
+------------------+----+------------+-------+
| Juan Perez       |  2 | 2024-06-01 | 25.50 |
| Maria Lopez      |  4 | 2024-06-05 | 48.00 |
| Carlos Mendoza   |  5 | 2024-06-10 | 55.00 |
| Ana Gonzalez     |  7 | 2024-06-15 | 28.25 |
| Luis Torres      |  8 | 2024-06-20 | 45.00 |
| Laura Rivera     | 10 | 2024-06-10 | 33.75 |
| Fernando Garcia  | 12 | 2024-06-25 | 47.00 |
| Isabel Fernandez | 14 | 2024-06-30 | 39.50 |
| Ricardo Morales  | 15 | 2024-05-25 | 41.00 |
| Lucia Martinez   | 16 | 2024-06-04 | 55.75 |
| Santiago Gimenez | 17 | 2024-06-09 | 52.00 |
| Patricia Romero  | 18 | 2024-06-15 | 46.25 |
+------------------+----+------------+-------+
12 rows in set (0,00 sec)

´´
9. Obtener el detalle de pedidos (menús y cantidades) para el cliente 'Juan Perez'.

```MySQL

SELECT p.id AS pedido_id, m.nombre AS menu, dp.cantidad
FROM pedidos p
JOIN clientes c ON p.id_cliente = c.id
JOIN detallespedidos dp ON p.id = dp.id_pedido
JOIN menus m ON dp.id_menu = m.id
WHERE c.nombre = 'Juan Perez';

+-----------+----------------+----------+
| pedido_id | menu           | cantidad |
+-----------+----------------+----------+
|         1 | Ensalada Cesar |        1 |
|         1 | Filete de Res  |        1 |
|         1 | Cafe Americano |        3 |
|         2 | Sopa de Tomate |        1 |
|         2 | Pasta Alfredo  |        1 |
|         2 | Tarta de queso |        1 |
+-----------+----------------+----------+
6 rows in set (0,00 sec)
´´
