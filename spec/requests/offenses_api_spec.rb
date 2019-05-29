require 'rails_helper'

RSpec.describe 'Offenses API', type: :request do
  let!(:offenses) { create_list(:offense, 10) }

  describe 'GET /offenses' do
    # make HTTP get request before each example
    before { get '/api/v1/offenses', params: { "q"=>"{}" }}

    it 'returns offenses' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

  end
end
