WITH avg_ratings AS (
    SELECT 
        service_id,
        branch_id,
        ROUND(AVG(CASE 
            WHEN rating IS NOT NULL AND rating >= 0 AND rating <= 5
            THEN rating::NUMERIC 
            ELSE NULL 
        END), 2) AS avg_rating
    FROM request r
    WHERE service_id IS NOT NULL 
        AND branch_id IS NOT NULL
    GROUP BY service_id, branch_id
)
SELECT 
    service_id,
    branch_id,
    avg_rating
FROM avg_ratings
WHERE avg_rating < 4.5
    AND avg_rating IS NOT NULL
ORDER BY 
    avg_rating ASC,
    service_id,
    branch_id;