

/* with source as (
  select * from {{source('airbnb', 'listings')}}
),

renamed as (
  select

--id
    id as listing_id,
    host_id as host_id,
--
    ACCEPTANCE_RATE,
    ACCOMMODATES,
    AVAILABILITY_60,
    CANCELLATION_POLICY,
    --LAST_SCRAPED,
    LONGITUDE,
    --SCRAPE,
    SQUARE_FEET,
    BATHROOMS,
    --HOST_ID,
    REVIEW_SCORES_CHECKIN,
    --ID,
    TRANSIT,
    AVAILABILITY_90,
    BEDROOMS,
    COUNTRY_CODE,
    HOST_IDENTITY_VERIFIED,
    HOST_NAME,
    --HOST_URL,
    INTERACTION,
    LICENSE,
    GUESTS_INCLUDED,
    JURISDICTION_NAMES,
    PRICE,
    REVIEW_SCORES_LOCATION,
    REVIEW_SCORES_VALUE,
    STATE,
    REVIEW_SCORES_COMMUNICATION,
    HOUSE_RULES,
    EXTRA_PEOPLE,
    --HOST_THUMBNAIL_URL,
    IS_LOCATION_EXACT,
    NOTES,
    SMART_LOCATION,
    DESCRIPTION,
    RESPONSE_RATE,
    SECURITY_DEPOSIT,
    --THUMBNAIL_URL,
    WEEKLY_PRICE,
    AVAILABILITY_365,
    MAXIMUM_NIGHTS,
    MONTHLY_PRICE,
    CLEANING_FEE,
    HAS_AVAILABILITY,
    NAME,
    NUMBER_OF_REVIEWS,
    ZIPCODE,
    IS_BUSINESS_TRAVEL_READY,
    AVAILABILITY_30,
    BED_TYPE,
    HOST_HAS_PROFILE_PIC,
    HOST_NEIGHBOURHOOD,
    BEDS,
    MARKET,
    REQUIRE_GUEST_PHONE_VERIFICATION,
    RESPONSE_TIME,
    REVIEW_SCORES_ACCURACY,
    INSTANT_BOOKABLE,
    CITY,
    EXPERIENCES_OFFERED,
    LATITUDE,
    MINIMUM_NIGHTS,
    NEIGHBORHOOD_OVERVIEW,
    REQUIRES_LICENSE,
    HOST_LOCATION,
    --MEDIUM_URL,
    PROPERTY_TYPE,
    REVIEW_SCORES_RATING,
    SPACE,
    STREET,
    --XL_PICTURE_URL,
    ROOM_TYPE,
    IS_SUPERHOST,
    --CALENDAR_LAST_SCRAPED,
    COUNTRY,
    HOST_ABOUT,
    --HOST_PICTURE_URL,
    NEIGHBOURHOOD_GROUP_CLEANSED,
    NEIGHBOURHOOD,
    REVIEW_SCORES_CLEANLINESS,
    HOST_VERIFICATIONS,
    SUMMARY,
    ACCESS,
    CALENDAR_UPDATED,
    NEIGHBOURHOOD_CLEANSED,
    --PICTURE_URL,
    REQUIRE_GUEST_PROFILE_PICTURE,
    --URL,
    AMENITIES,

--timestamp
  HOST_SINCE,
  FIRST_REVIEW,
  LAST_REVIEW

from source
)

select * from renamed*/


with source as (

    select * from {{ source('airbnb', 'listings') }}

),

renamed as (

    select

        id as listing_id,
        url,

--listing info
        name,
        summary,
        space,
        description,
        experiences_offered,
        neighborhood_overview,
        notes,
        transit,
        access,
        interaction,
        house_rules,
        thumbnail_url,
        property_type,
        room_type,
        accommodates,
        bathrooms,
        bedrooms,
        beds,
        bed_type,
        amenities,
        square_feet,
        guests_included,
        extra_people,
        calendar_updated,
        has_availability,
        availability_30,
        availability_60,
        availability_90,
        availability_365,
        calendar_last_scraped,
        medium_url,
        picture_url,
        xl_picture_url,

    --host info
        host_id,
        host_url,
        host_name,
        host_since,
        host_location,
        host_about,
        response_time,
        response_rate,
        acceptance_rate,
        is_superhost,
        host_thumbnail_url,
        host_picture_url,
        host_neighbourhood,
        host_verifications,
        host_has_profile_pic,
        host_identity_verified,

--geography
        street,
        neighbourhood,
        neighbourhood_cleansed,
        neighbourhood_group_cleansed,
        city,
        state,
        zipcode,
        market,
        smart_location,
        country_code,
        country,
        latitude,
        longitude,
        is_location_exact,

--requirements
        requires_license,
        license,
        jurisdiction_names,
        instant_bookable,
        is_business_travel_ready,
        cancellation_policy,
        require_guest_profile_picture,
        require_guest_phone_verification,

--pricing
        cleaning_fee,
        security_deposit,
        nullif(replace(split_part(monthly_price, '$', 2), ',', ''), '') as monthly_price,
        nullif(replace(split_part(weekly_price, '$', 2), ',', ''), '') as weekly_price,
        nullif(replace(split_part(price, '$', 2), ',', ''), '') as price

    from source

)

select * from renamed
