
filepathname = (Rails.root.join('lib', 'seeds', 'offenses2.xlsx'))

offense_import = OffenseImport.new(file: filepathname)

offense_import.open_spreadsheet
# calling `load_imported_offenses` here
offense_import.load_imported_offenses

offense_import.save
