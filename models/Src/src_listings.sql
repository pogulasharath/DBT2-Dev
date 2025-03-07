with raw_listings as (select * from airbnb.raw.raw_listings)
select
    id as Listing_id,
    Listing_url,
    name as Listing_name,
    room_type,
    minimum_nights,
    host_id,
    price,
    created_at,
    updated_at
from raw_listings
