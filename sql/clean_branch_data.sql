SELECT 
    id::TEXT AS id,
    
   location,
    
    CASE 
        WHEN total_rooms::INTEGER BETWEEN 1 AND 400 
            THEN total_rooms::INTEGER
        ELSE 100 
    END AS total_rooms,
    
    CASE 
        WHEN staff_count IS NOT NULL AND staff_count::INTEGER > 0 
            THEN staff_count::INTEGER
        ELSE (CASE 
                WHEN total_rooms::INTEGER BETWEEN 1 AND 400 
                    THEN CEIL(total_rooms::INTEGER * 1.5)
                ELSE CEIL(100 * 1.5)
              END)::INTEGER
    END AS staff_count,
    
    CASE 
        WHEN opening_date ~ '^\d+$' 
            AND opening_date::INTEGER BETWEEN 2000 AND 2023 
            THEN opening_date::INTEGER
        ELSE 2023
    END AS opening_date,
    
    CASE 
        WHEN TRIM(LOWER(target_guests)) IN ('business', 'busniess', 'b.') THEN 'Business'
        WHEN TRIM(LOWER(target_guests)) = 'leisure' THEN 'Leisure'
        ELSE 'Leisure'
    END AS target_guests
FROM branch;