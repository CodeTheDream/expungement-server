class Api::V1::OffensesController < ApplicationController
   include ActionController::MimeResponds
   skip_before_action :verify_authenticity_token  

  # before_action :check_wild_cards
  def index
    # offenses = Offense.all
    check_wild_cards
    unless @query.empty?
      if @first_name.present? # this is big if
        if @last_name.present?
          if @middle_name.present?
            offenses = Offense.where("first_name LIKE ? AND last_name LIKE ? AND middle_name LIKE ?", @first_name, @last_name, @middle_name)
          else
            offenses = Offense.where("first_name LIKE ? AND last_name LIKE ?", @first_name, @last_name)
          end
        elsif @middle_name.present?
          offenses = Offense.where("first_name LIKE ? AND middle_name LIKE ?", @first_name, @middle_name)
        else
          offenses = Offense.where("first_name LIKE ?", @first_name)
        end
      elsif @middle_name.present? # this is big elsif
        if @last_name.present?
          offenses = Offense.where("middle_name LIKE ? AND last_name LIKE ?", @middle_name, @last_name)
        else
          offenses = Offense.where("middle_name LIKE ?", @middle_name)
        end
      elsif @last_name.present? # another big elsf
        offenses = Offense.where("last_name LIKE ?", @last_name) # another big elsif
      else #this is big else
        render json: { status: "error", code: 400, message: "Can't find offenses without first_name, middle_name, or last_name" }
        return
      end
    end

    # Mapping here
    offenses = offenses.map do |offense| 
      offense.new_offense_hash
    end
    
    render json: offenses, status: :ok
  end
  
  def offenses_pdf
    respond_to do | format| 
      format.html
      format.pdf do
    pdf = OffensePdf1.new(request.parameters)
    send_data pdf.render, filename: 'Offenses.pdf',
                              type: 'application/pdf',
                              disposition: 'inline'
      end                        
    end                      
  end

  private

    def check_wild_cards
      if params[:q].present?
        @query = JSON.parse(params[:q])
        @first_name = @query["first_name"].gsub("*","%") if @query["first_name"].present?
        @middle_name = @query["middle_name"].gsub("*","%") if @query["middle_name"].present?
        @last_name = @query["last_name"].gsub("*","%") if @query["last_name"].present?
      end
    end
end
