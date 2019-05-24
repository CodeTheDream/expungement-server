class OffensePdf < Prawn::Document
  def initialize
    super
    text "Offenses"
  end
end