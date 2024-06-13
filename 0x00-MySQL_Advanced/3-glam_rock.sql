-- a sql scripts lists all bands with Glam rock

SELECT 
    band_name,
    (2022 - formed) AS lifespan
FROM 
    metal_bands
WHERE 
    FIND_IN_SET('Glam rock', IFNULL(style, '')) > 0
ORDER BY 
    lifespan DESC;