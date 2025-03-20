WITH monthly_marketing AS (
    SELECT *
    FROM {{ ref('int_monthly_marketing_metrics') }}
)

SELECT *
FROM monthly_marketing
WHERE total_marketing_cost > 100000 -- this threshold can be changed on demand
