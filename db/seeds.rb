# Require Ruby CSV library to properly parse the CSV data.
require 'csv'

# read CSV file into a variable
csv_text = File.read(Rails.root.join('lib', 'seeds', 'offenses.csv'))
# Converts the CSV into a structure that Ruby can read.
csv = CSV.parse(csv_text, headers: true, encoding: 'UTF-8')
# Loop through the entire CSV file and convert each row of thr document
# into a hash. The headers of the CVS file are used as keys for the hash

csv.each do |row|
  t = Offense.new
  t.first_name = row['first_name']
  t.middle_name = row['middle_name']
  t.last_name = row['last_name']
  t.gender = row['gender']
  t.race = row['race']
  t.address_number = row['address_number']
  t.street = row['street']
  t.zip = row['zip']
  t.county = row['county']
  t.state = row['state']
  t.file_number = row['file_number']
  t.offense_date = row['offense_date']
  t.disposition = row['disposition']
  t.disposition_date = row['disposition_date']
  t.county_disposition = row['county_disposition']
  t.arrest_agency_name = row['arrest_agency_name']
  t.arrest_agency_department = row['arrest_agency_department']
  t.arrest_agency_address_number = row['arrest_agency_address_number']
  t.arrest_agency_street = row['arrest_agency_street']
  t.dob = row['dob']
  t.offense_description = row['offense_description']
  t.arrest_date = row['arrest_date']
  t.arrest_agency_zip = row['arrest_agency_zip']
  # t.save

  if t.save

  else
    t.errors
  end

  puts "Offense #{t.first_name} saved!"
end

puts "There are now #{Offense.count} rows in the Offense table"
# Print contents of the variable
