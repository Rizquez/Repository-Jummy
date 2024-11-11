-- Limpieza de los registros duplicados en la tabla de restaurantes
CREATE TEMPORARY TABLE RegistrosConRango AS
SELECT id,
    ROW_NUMBER() OVER (PARTITION BY cif, nombre_fiscal, direccion_fiscal, localidad, email ORDER BY id) AS fila
FROM restaurantes;

DELETE FROM restaurantes
WHERE id IN (
    SELECT id
    FROM RegistrosConRango
    WHERE fila > 1
);

DROP TEMPORARY TABLE RegistrosConRango;