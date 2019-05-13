class CreateOffenses < ActiveRecord::Migration[5.2]
  def change
    create_table :offenses do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :gender
      t.string :race
      t.string :address
      t.string :street
      t.integer :zip
      t.string :county
      t.string :state
      t.string :file_number
      t.string :offense_date
      t.string :disposition
      t.string :disposition_date
      t.string :county_disposition
      t.string :arrest_agency_name
      t.string :arrest_agency_department
      t.string :arrest_agency_address
      t.integer :arrest_agency_street
      t.string :arrest_agency_zip
      t.string :arrest_agency_zip
      
      

      t.timestamps
    end
  end
end
