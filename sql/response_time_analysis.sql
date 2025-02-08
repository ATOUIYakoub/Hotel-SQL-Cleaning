SELECT 
    s.description,
    b.id AS branch_id,
    UPPER(TRIM(b.location)) AS location,
    r.id AS request_id,
    r.rating
FROM service s
JOIN request r ON s.id = r.service_id
JOIN branch b ON b.id = r.branch_id
WHERE LOWER(TRIM(s.description)) IN ('meal', 'laundry')
    AND UPPER(TRIM(COALESCE(b.location, ''))) IN ('EMEA', 'LATAM')
    AND r.rating IS NOT NULL
ORDER BY 
    s.description,
    b.location,
    b.id,
    r.id;