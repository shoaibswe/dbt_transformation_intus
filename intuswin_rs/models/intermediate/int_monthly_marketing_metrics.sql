WITH stg_marketing AS (
    SELECT *
    FROM {{ ref('stg_intus_marketing_events') }}
)

SELECT
    {{ extract_year_month('event_timestamp') }},
    user_id,
    COALESCE(SUM(cost),0) AS total_marketing_cost,
    COALESCE(COUNT(event_id),0) AS total_marketing_events
FROM stg_marketing
GROUP BY 1, 2
