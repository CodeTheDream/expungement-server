class Api::V1::OffensesController < ApplicationController
  def search
    offenses = Offense.all
    render json: offenses, status: :ok
  end
end
