SELECT 
    r.service_id,
    r.branch_id,
    ROUND(AVG(CASE 
        WHEN r.time_taken IS NOT NULL AND r.time_taken >= 0 
        THEN r.time_taken::NUMERIC 
        ELSE NULL 
    END), 2) AS avg_time_taken,
    MAX(CASE 
        WHEN r.time_taken IS NOT NULL AND r.time_taken >= 0 
        THEN r.time_taken 
        ELSE NULL 
    END) AS max_time_taken
FROM request r
WHERE r.service_id IS NOT NULL 
    AND r.branch_id IS NOT NULL
GROUP BY r.service_id, r.branch_id
ORDER BY r.service_id, r.branch_id;