class OffensePdf < Prawn::Document
  def initialize(offense)
    super(page_layout: :landscape)
    @offense = Offense.all
    pdf_starting_statement
    first_name
    middle_name
    last_name
    dob
    race
    gender
    street
    county
    zip
    driver_license_no
    ssn_num
    file_no
    date_of_arrest
    offense_description
    offense_date
    disposition
    date_of_disposition
    county_of_disposition
    arrest_agency
  end
  
  def pdf_starting_statement
     fill_color #A9A9A
    text "Please review following information to be printed on the form.", size: 20, align: :center, style: :bold
  end
  def personal_information
    move_down 20
    fill_color "0000ff"
    text "Personal Information", size: 15, style: :bold, :align => :center
  end
  def first_name
    move_down 30
    text "First Name: #{@offense.first.first_name}", size: 15
  end
  def middle_name
    text "Middle Name: #{@offense.first.middle_name}", size: 15
  end
  def last_name
    move_up 35
    text "Last Name: #{@offense.first.last_name}", size: 15, :align => :center
  end
  def dob
    move_down 35
    text "date of birth: #{@offense.first.dob}", size: 15
  end
  def race
    text "Race: #{@offense.first.race}", size: 15
  end
  def gender
     text "Gender: #{@offense.first.gender}", size: 15
  end
  def street
    move_down 30
    text "Street: #{@offense.first.address_number} #{@offense.first.street}", size: 15
  end
  def county
    text "State: #{@offense.first.state} #{" | County"}  #{@offense.first.county}", size: 15
  end
  def zip
     text "Zip: #{@offense.first.zip}", size: 15
  end
  def driver_license_no
    move_down 20
    text "Driver License no.", size: 15
  end
  def ssn_num
    move_up 20
    text "Full Social Security No.", size: 15, :align => :center
    end  
    #The offenses infromation is below
    def line_items 
      
    end
    def file_no
      move_down 40
    text_box "File No.
    #{@offense.first.file_number}", size: 12, :at => [0, cursor]
  end
  def date_of_arrest.
     text_box "Date of arrest.
     #{@offense.first.offense_date}", size: 12, :at => [90, cursor]
     end
  def offense_description
    text_box "Offense description.
     #{@offense.first.offense_description}", size: 12, :at => [180, cursor]
  end
  def offense_date
    text_box "Offense date. 
    #{@offense.first.offense_date}",  size: 12, :at => [325, cursor]
  end
  def disposition
     text_box "Disposition. 
     #{@offense.first.disposition}", size: 12, :at => [400, cursor]
  end
  def date_of_disposition
      text_box "Date of disposition. 
     #{@offense.first.disposition_date}", size: 12, :at => [470, cursor]  
     end
  def county_of_disposition
    text_box "County of disposition. 
     #{@offense.first.county_disposition}", size: 12, :at => [580, cursor]  
     end
  def arrest_agency
    text_box "Arresting agency/s. 
     #{@offense.first.arrest_agency_department} 
     #{@offense.first.arrest_agency_address_number} #{@offense.first.arrest_agency_street} #{@offense.first.arrest_agency_zip}", size: 12, :at => [690, cursor]  
     end

end
