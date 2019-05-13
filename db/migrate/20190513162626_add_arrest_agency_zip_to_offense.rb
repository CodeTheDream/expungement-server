class AddArrestAgencyZipToOffense < ActiveRecord::Migration[5.2]
  def change
    add_column :offenses, :arrest_agency_zip, :string
  end
end
