USE PizzeriaCampus;

-- 1. Productos más vendidos
SELECT
    pedido_realizado AS producto,
    COUNT(*) AS veces_vendido
FROM Pedidos
GROUP BY pedido_realizado
ORDER BY veces_vendido DESC;

-- 2. Total de ingresos generados por cada combo
SELECT
    nombre_combo,
    precio_especial AS ingresos_generados
FROM Combos;

-- 3. Pedidos realizados para recoger vs comer en la pizzería
SELECT
    CASE
        WHEN pedido_para_entregar = TRUE THEN 'Para Entregar'
        ELSE 'Consumir en Local'
    END AS tipo_pedido,
    COUNT(*) AS cantidad
FROM Pedidos
GROUP BY pedido_para_entregar;

-- 4. Adiciones más solicitadas en pedidos personalizados
SELECT
    adiciones_seleccionadas,
    COUNT(*) AS veces_solicitada
FROM Pedidos
GROUP BY adiciones_seleccionadas
ORDER BY veces_solicitada DESC;

-- 5. Cantidad total de productos vendidos por categoría
SELECT
    m.categorias,
    COUNT(*) AS total_vendidos
FROM Pedidos p
JOIN Productos pr
    ON p.pedido_realizado = pr.nombre_producto
JOIN Menu m
    ON pr.id_menu = m.id_menu
GROUP BY m.categorias;

-- 6. Promedio de pizzas pedidas por cliente
SELECT
    AVG(total_pizzas) AS promedio_pizzas_por_cliente
FROM (
    SELECT
        id_usuario,
        COUNT(*) AS total_pizzas
    FROM Pedidos
    WHERE pedido_realizado LIKE '%Pizza%'
    GROUP BY id_usuario
) AS t;

-- 7. Total de ventas registradas
SELECT
    SUM(precio_total) AS total_ventas
FROM Pedidos;

-- 8. Cantidad de panzarottis vendidos con extra queso
SELECT
    COUNT(*) AS total_panzarottis_extra_queso
FROM Pedidos
WHERE pedido_realizado LIKE '%Panzarotti%'
AND adiciones_seleccionadas LIKE '%Queso Extra%';

-- 9. Pedidos que incluyen bebidas como parte del pedido
SELECT *
FROM Pedidos
WHERE pedido_realizado LIKE '%Coca-Cola%'
   OR pedido_realizado LIKE '%Gaseosa%';

-- 10. Clientes que han realizado más de 5 pedidos
SELECT
    u.nombre_usuario,
    COUNT(*) AS cantidad_pedidos
FROM usuarios u
JOIN Pedidos p
    ON u.id_usuario = p.id_usuario
GROUP BY u.id_usuario, u.nombre_usuario
HAVING COUNT(*) > 5;

-- 11. Ingresos generados por productos no elaborados (bebidas y postres)
SELECT
    SUM(p.precio_total) AS ingresos_no_elaborados
FROM Pedidos p
JOIN Productos pr
    ON p.pedido_realizado = pr.nombre_producto
JOIN Menu m
    ON pr.id_menu = m.id_menu
WHERE m.categorias IN ('Bebidas', 'Postres');

-- 12. Promedio de adiciones por pedido
SELECT
    AVG(
        LENGTH(adiciones_seleccionadas)
        - LENGTH(REPLACE(adiciones_seleccionadas, ',', ''))
        + 1
    ) AS promedio_adiciones
FROM Pedidos
WHERE adiciones_seleccionadas <> 'Ninguna';

-- 13. Total de combos vendidos
SELECT
    COUNT(*) AS total_combos_vendidos
FROM Pedidos
WHERE pedido_realizado LIKE '%Combo%';

-- 14. Clientes con pedidos para entregar y consumir en local
SELECT
    u.nombre_usuario
FROM usuarios u
JOIN Pedidos p
    ON u.id_usuario = p.id_usuario
GROUP BY u.id_usuario, u.nombre_usuario
HAVING
    SUM(pedido_para_entregar = TRUE) > 0
    AND
    SUM(pedido_para_entregar = FALSE) > 0;

-- 15. Total de productos personalizados con adiciones
SELECT
    COUNT(*) AS total_productos_personalizados
FROM Pedidos
WHERE adiciones_seleccionadas <> 'Ninguna';

-- 16. Pedidos con más de 3 productos diferentes
-- No pude hacerla

-- 17. Promedio de ingresos generados por pedido
SELECT
    AVG(precio_total) AS promedio_ingresos
FROM Pedidos;

-- 18. Clientes que han pedido pizzas con adiciones en más del 50% de sus pedidos
SELECT
    u.nombre_usuario
FROM usuarios u
JOIN Pedidos p
    ON u.id_usuario = p.id_usuario
GROUP BY u.id_usuario, u.nombre_usuario
HAVING
(
    SUM(
        pedido_realizado LIKE '%Pizza%'
        AND adiciones_seleccionadas <> 'Ninguna'
    ) / COUNT(*)
) > 0.5;

-- 19. Porcentaje de ventas provenientes de productos no elaborados
SELECT
(
    SUM(
        CASE
            WHEN pedido_realizado LIKE '%Coca-Cola%'
              OR pedido_realizado LIKE '%Brownie%'
            THEN precio_total
            ELSE 0
        END
    ) / SUM(precio_total)
) * 100 AS porcentaje_ventas_no_elaboradas
FROM Pedidos;

-- 20. Día de la semana con mayor número de pedidos para recoger
-- No pude hacerlo