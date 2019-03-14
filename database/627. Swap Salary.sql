update salary
set sex = decode(sex,'m','f','m');

/* Recomended solution */
UPDATE salary
SET
    sex = CASE sex
        WHEN 'm' THEN 'f'
        ELSE 'm'
    END;