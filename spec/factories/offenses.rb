FactoryBot.define do
  factory :offense do
    first_name { FFaker::Name.first_name }
    middle_name { FFaker::Name.name }
    last_name { FFaker::Name.last_name }
    gender { FFaker::Gender }
    race { "English" }
    address_number { FFaker::Address.building_number }
    street { FFaker::Address.street_name }
    zip { "27701" }
    county { "Durham" }
    state { "NC" }
    file_number { FFaker::Product.model }
    offense_date { FFaker::Time.date }
    disposition { "Not guilty" }
    disposition_date { FFaker::Time.date }
    county_disposition { "Wake" }
    arrest_agency_name { "Durham Police Department"  }
    arrest_agency_department { "Durham Police" }
    arrest_agency_address_number { FFaker::Address.building_number }
    arrest_agency_street { FFaker::Address.street_name }
    dob { FFaker::Time.date }
    offense_description { FFaker::Lorem.phrase[1..40] }
    arrest_date { FFaker::Time.date  }
    arrest_agency_zip { "27701" }
  end
end
