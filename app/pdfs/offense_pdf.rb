# class OffensePdf < Prawn::Document
#   def initialize(offense)
#     super(page_layout: :landscape)
#     @offense = Offense.all
#     pdf_starting_statement
#     first_name
#     middle_name
#     last_name
#     dob
#     race
#     gender
#     street
#     county
#     zip
#     driver_license_no
#     ssn_num
#     line_items
#   end
  
#   def pdf_starting_statement
#     fill_color #A9A9A
#     text "Please review following information to be printed on the form.", size: 20, align: :center, style: :bold
#   end
#   def personal_information
#     move_down 20
#     fill_color "0000ff"
#     text "Personal Information", size: 15, style: :bold, :align => :center
#   end
#   def first_name
#     move_down 30
#     text "First Name: #{@offense.first.first_name}", size: 15
#   end
#   def middle_name
#     text "Middle Name: #{@offense.first.middle_name}", size: 15
#   end
#   def last_name
#     move_up 35
#     text "Last Name: #{@offense.first.last_name}", size: 15, :align => :center
#   end
#   def dob
#     move_down 35
#     text "date of birth: #{@offense.first.dob}", size: 15
#   end
#   def race
#     text "Race: #{@offense.first.race}", size: 15
#   end
#   def gender
#     text "Gender: #{@offense.first.gender}", size: 15
#   end
#   def street
#     move_down 30
#     text "Street: #{@offense.first.address_number} #{@offense.first.street}", size: 15
#   end
#   def county
#     text "State: #{@offense.first.state} #{" | County"}  #{@offense.first.county}", size: 15
#   end
#   def zip
#     text "Zip: #{@offense.first.zip}", size: 15
#   end
#   def driver_license_no
#     move_down 20
#     text "Driver License no.", size: 15
#   end
#   def ssn_num
#     move_up 20
#     text "Full Social Security No.", size: 15, :align => :center
#     end  
#     #The offenses infromation is below
#     def line_items
#       move_down 30
#       text "Offense/s Information", size: 15, :align => :center
#       table line_items_rows
      
#     end
#     def line_items_rows
#       [["File Number", "Arrest date","Offense description","Offense date", "Disposition", "Disposition date", 
#       "County disposition", "Arrest agency name", "Arrest agency department", "Arresting agency/s Address"]] + 
#       @offense.map do |offense|
#         [offense.file_number, offense.arrest_date, offense.offense_description, offense.offense_date, offense.disposition,
#         offense.disposition_date, offense.county_disposition, offense.arrest_agency_name, offense.arrest_agency_department,
#         "#{offense.arrest_agency_address_number}
#         #{offense.arrest_agency_name}
#         #{offense.arrest_agency_zip}"]
#       end
#     end
# end
class OffensePdf1 < Prawn::Document
  def initialize(params)
    @offense = Offense.all
  first_name
  end
  
  def first_name
    text "First Name: #{@params.name.first_name}", size: 15
  end
end









