# Require Ruby CSV library to properly parse the CSV data.
require 'csv'

# read CSV file into a variable
csv_text = File.read(Rails.root.join('lib', 'seeds', 'offenses.csv'))

# Converts the CSV into a structure that Ruby can read.
csv = CSV.parse(csv_text, headers: true, encoding: 'UTF-8')

# Loop through the entire CSV file and convert each row of thr document
# into a hash. The headers of the CVS file are used as keys for the hash
csv.each do |row|
  offense = Offense.new
  offense.file_number = row['File Number']
  offense.first_name = row['First Name']
  offense.middle_name = row['Middle Name']
  offense.last_name = row['Last Name']
  offense.gender = row['Gender']
  offense.race = row['Race']
  offense.dob = row['Date of Birth']
  offense.address_number = row['Street Number']
  offense.street = row['Street Name']
  offense.zip = row['Zip']
  offense.county = row['County']
  offense.state = row['State']
  offense.offense_description = row['Offense Description']
  offense.offense_date = row['Offense Date']
  offense.disposition = row['Disposition']
  offense.disposition_date = row['Disposition Date']
  offense.county_disposition = row['County Disposition']
  offense.arrest_date = row['Arrest Date']
  offense.arrest_agency_name = row['Arrest Agency Name']
  offense.arrest_agency_department = row['Arrest Agency Department']
  offense.arrest_agency_address_number = row['Arrest Agency Street Number']
  offense.arrest_agency_street = row['Arrest Agency Street Name']
  offense.arrest_agency_zip = row['Arrest Agency Zip']

  if offense.save
    puts "Offense #{offense.file_number} saved!"
  else
    offense.errors
  end

end

puts "There are now #{Offense.count} rows in the Offense table"
# Print contents of the variable
