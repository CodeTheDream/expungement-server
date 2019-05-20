
filename = Rails.root.join('lib', 'seeds', 'offenses.xlsx').to_s

offense_import = OffenseImport.new(original_filename: filename, filepathname: filename)

offense_import.open_spreadsheet
# calling `load_imported_offenses` here
offense_import.load_imported_offenses

offense_import.save
