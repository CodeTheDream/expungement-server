class OffenseImportsController < ApplicationController
  def new
    @offense_import = OffenseImport.new
  end

  def create
    @offense_import = OffenseImport.new(offense_import_params)
    if @offense_import.save
      redirect_to root_url
      flash[:success] = "Offenses uploaded successfully"
    else
      render :new
    end
  end

  private

    def offense_import_params
      params.require(:offense_import).permit(:file)
    end
end
