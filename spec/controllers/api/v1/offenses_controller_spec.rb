require 'rails_helper'

RSpec.describe Api::V1::OffensesController, type: :controller do

  def index
    @offenses = Offense.all
  
  end    

end
