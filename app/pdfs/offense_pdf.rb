class OffensePdf 
#   // `include` instead of subclassing Prawn::Document
#   // as advised by the official manual
  include Prawn::View

  def initialize
    content
  end

  def content
    text "Offense Outline"
  end
end