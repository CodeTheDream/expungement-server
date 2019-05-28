class OffensesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @offense = Offense.all
  end
  def show
    respond_to do | format| 
      format.html
      format.pdf do
      pdf = OffensePdf.new(@offense)
        send_data pdf.render, filename: 'Offenses.pdf',
                              type: 'application/pdf',
                              disposition: 'inline'
                              :rotate 
                            
      end
     end 
  end
end
