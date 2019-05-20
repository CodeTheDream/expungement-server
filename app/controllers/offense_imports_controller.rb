class OffenseImportsController < ApplicationController
  def new
    @offense_import = OffenseImport.new
  end

  def create
    if params["offense_import"].present? && params["offense_import"]["file"].present?
      @offense_import = OffenseImport.new(original_filename: (params["offense_import"]["file"]).original_filename,
        filepathname: (params["offense_import"]["file"]).path)
      if @offense_import.save
        redirect_to root_url
        flash[:success] = "Offenses uploaded successfully"
      else
        render :new
      end
    else
      redirect_to root_url
      flash[:success] = "You need to choose a file first"
    end
  end

  private

    def offense_import_params
      params.require(:offense_import).permit(:file)
    end
end
