select * from {{ref('stg_airbnb_listings')}}
left join {{ref('stg_airbnb_reviews')}} using (listing_id)
where property_type = 'Apartment'
