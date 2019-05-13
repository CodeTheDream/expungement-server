class AddRemoveRenameColumns < ActiveRecord::Migration[5.2]
  def change
    change_table :offenses do |t|
      t.remove :arrest_agency_zip
      t.rename :address, :address_number
      t.string :dob
      t.string :offense_description
      t.rename :arrest_agency_address, :arrest_agency_address_number
      t.string :arrest_date
    end
  end
end
