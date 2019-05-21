class Offense < ApplicationRecord
  
  def new_offense_hash
    offense_hash = {}
    name = {first: self.first_name, middle: self.middle_name, last: self.last_name}
    offense_hash[:name] = name
    offense_hash [:sex] = self.gender
    offense_hash[:race] = self.race
    offense_hash[:dob] = self.dob
    address = {number: self.address_number, street: self.street, zip: self.zip, county: self.county, state: self.state}
    offense_hash[:address] = address
    offense_hash[:file_number] = self.file_number
    offense_hash[:offense_description] = self.offense_description
    offense_hash[:offense_date] = self.offence_date
    offense_hash[:disposition] = self.disposition
    offense_hash[:disposition_date] = self.disposition_date
    offense_hash[:county_disposition] = self.county_disposition
    arrest_agency = {name: self.arrest_agency_name, address: self.arrest_agency_address, arrest_agency_number: self.arrest_agency_address_number, 
    arrest_agency_street: self.arrest_agency_street, arrest_agency_zip: self.arrest_agency_zip, arrest_agency_date: self.arrest_agency_date}
    offense_hash[:arrest_agency] = arrest_agency
    
  end
  
end
