class OffenseImport
  include ActiveModel::Model
  require 'roo'

  attr_accessor :original_filename, :filepathname

  def initialize(attributes={})
    # attributes.each { |name, value| send("#{name}=", value) }
    @original_filename = attributes[:original_filename]
    @filepathname = attributes[:filepathname]
  end

  def persisted?
    false
  end

  def open_spreadsheet
    case File.extname(original_filename)
    when ".csv" then Csv.new(filepathname, nil, :ignore)
    when ".xls" then Roo::Excel.new(filepathname)
    when ".xlsx" then Roo::Excelx.new(filepathname)
    when ".ods" then Roo::OpenOffice.new(filepathname)
    else raise "Unknown file type: #{original_filename}"
    end
  end

  def load_imported_offenses
    spreadsheet = open_spreadsheet
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).map do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      offense = Offense.find_by_id(row["id"]) || Offense.new
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
      offense
    end
  end

  def imported_offenses
    @imported_offenses ||= load_imported_offenses
  end

  def save
    Offense.delete_all
    if imported_offenses.map(&:valid?).all?
      imported_offenses.each(&:save!)
      true
    else
      imported_offenses.each_with_index do |offense, index|
        offense.errors.full_messages.each do |msg|
          errors.add :base, "Row #{index + 2}: #{msg}"
        end
      end
      false
    end
  end

end
