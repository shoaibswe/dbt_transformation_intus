WITH stg_marketing AS (
    SELECT *
    FROM {{ ref('stg_intus_marketing_events') }}
)

SELECT
    {{ extract_year_month('event_timestamp') }},
    user_id,
    SUM(cost) AS total_marketing_cost,
    COUNT(event_id) AS total_marketing_events
FROM stg_marketing
GROUP BY 1, 2
