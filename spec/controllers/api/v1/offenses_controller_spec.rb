require 'rails_helper'

RSpec.describe Api::V1::OffensesController, type: :controller do

  describe "GET #search" do
    it "returns http success" do
      get :search
      expect(response).to have_http_status(:success)
    end
  end

end
