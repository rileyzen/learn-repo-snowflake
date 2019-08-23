with source as (

    select * from raw.public.reviews

),

renamed as (

    select

        id as review_id,
        reviewer_id,
        listing_id,
        reviewer_name,
        comments,
        date as review_date

    from source

)

select * from renamed
