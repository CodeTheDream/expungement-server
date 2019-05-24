class OffensesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @offense = Offense.all
  end
  def show
    pdf = OffensePdf.new
    send_data pdf.render,
    filename: "export.pdf",
    type: 'application/pdf',
    disposition: 'inline'
  end
end
