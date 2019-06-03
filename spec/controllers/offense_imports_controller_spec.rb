require 'rails_helper'

RSpec.describe OffenseImportsController, type: :controller do
  let(:admin) { create :admin }

  describe "POST Offenses#create" do
    before { sign_in admin }
    let(:excel) { fixture_file_upload('import/test_offenses.xlsx', 'text/excel')}

    it "changes Offense count on successful file upload" do
      expect do
        post :create, params: { offense_import: {file: excel} }
      end.to change(Offense, :count).by(5)
    end
  end

end
