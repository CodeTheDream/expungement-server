class Api::V1::OffensesController < ApplicationController
    def import_user_information 
        @user = new_offense_hash @user.map  { |offense| offense.new_offense_hash }
        render json: @user, status: :ok
        
    end
end
