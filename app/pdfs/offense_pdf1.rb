class OffensePdf1 < Prawn::Document
  def initialize(params)
      super(page_layout: :landscape)
    @params = params
    pdf_starting_statement
    first_name
    middle_name
    last_name
    sex
    race
    dob
    address
    county
    zip
    driver_license_no
    social_security
    line_items
    
  end
  
  def pdf_starting_statement
    fill_color #A9A9A
    text "Please review following information to be printed on the form.", size: 20, align: :center, style: :bold
  end
  def first_name
      move_down 30
    text "First Name: #{@params[:name] [:first]}", size: 15
  end
  def middle_name
    text "Middle Name: #{@params [:name] [:middle]}", size: 15
  end
  def last_name
    text "Last Name: #{@params[:name] [:last_names].join(",  ")}", size: 15
  end
  def sex
    move_down 35
    text "Gender: #{@params[:sex]}", size: 15
  end
  def race
    text "Race: #{@params[:race]}", size: 15
  end
  def dob
    text "Date of brith: #{@params[:dob]}", size: 15
  end
  def address
    move_down 30
    text "Address: #{@params[:address] [:street] }", size: 15
  end
  def county
    text "State: #{@params [:address] [:state]} #{" | County"}  #{@params [:city]}", size: 15
  end
  def zip
    text "Zip: #{@params [:address] [:zip]}", size: 15
  end
  def driver_license_no
    move_down 20
    text "Driver License no. #{@params [:drivers_license_no]}", size: 15
  end
  def social_security
    move_up 17
    text "Full Social Security No. #{@params [:social_security_no]}", size: 15, :align => :center
    end  
   
    def line_items
      move_down 30
      text "Offense/s Information", size: 15, :align => :center
      table line_items_rows
      
    end
    def line_items_rows
        
      [["File Number", "Offense description","Offense date", "Disposition date",  "Disposition", 
      "County disposition", "Arrest agency", "Arresting agency/s Address"]] + 
      @params[:offenses].map do |offense|
        [offense[:file_number], offense[:offense_description], offense[:offense_date],  offense[:disposition], offense[:disposition_date],
        offense[:county_disposition], offense[:arrest_agency][:name], 
         "#{offense[:arrest_agency][:address][:number]} #{offense[:arrest_agency][:address][:street]}
         Zip: #{offense[:arrest_agency][:address][:zip]}"] 
        
      end
    end
end


