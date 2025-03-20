with source_raw_marketing_events as (
    select
    *
    from
         {{ source('intus','marketing_events') }}
)

select 
    event_id, 
    user_id, 
    event_type, 
    event_timestamp,
    channel, 
    campaign, 
    cost
from source_raw_marketing_events
