class Api::V1::OffensesController < ApplicationController
  def index
    offenses = Offense.all

    offenses = offenses.map do |offense|
      offense.new_offense_hash
    end

    render json: offenses, status: :ok
  end
end
