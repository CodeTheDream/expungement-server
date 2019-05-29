require 'rails_helper'

RSpec.describe 'Offenses API', type: :request do
  let!(:offenses) { create_list(:offense, 10) }
  let!(:offense) { create(:offense, first_name: "John", last_name: "Doe") }
  let!(:offense2) { create(:offense, first_name: "John", last_name: "Doe", middle_name: "Bahadur") }

  describe 'GET /offenses' do
    # make HTTP get request before each example
    before { get '/api/v1/offenses', params: { "q"=>"{}" }}

    it 'returns offenses' do
      expect(json).not_to be_empty
      expect(json.size).to eq(12)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

  end

  describe 'GET /offenses when `first_name` is passed' do
    # byebug
    before { get '/api/v1/offenses',
              params: { "q"=> '{"first_name":"John"}' }
            }

    it 'returns offenses having `John`' do
      expect(json).not_to be_empty
      expect(json.size).to eq(2)
    end
  end

  describe 'GET /offenses when `first_name` and `last_name` are passed' do
    before { get '/api/v1/offenses',
              params: { "q"=> '{"first_name":"John", "last_name":"Doe"}'}
            }

    it 'returns offenses having `John` and `Doe`' do
      expect(json).not_to be_empty
      expect(json.size).to eq(2)
    end
  end

  describe 'GET /offenses when `first_name`, `last_name`, and `middle_name` are passed' do
    before { get '/api/v1/offenses',
              params: { "q"=> '{"first_name":"John","last_name":"Doe","middle_name":"Bahadur"}'}
            }
    it 'returns offenses having `John`, `Doe`, `Bahadur`' do
      expect(json).not_to be_empty
      expect(json.size).to eq(1)
    end
  end
end
