class OffensePdf < Prawn::Document
  def initialize(offense)
    super(top_margin: 70)
    @offense = Offense.all
    offense_number
    personal_information
    first_name
    middle_name
    last_name
  end
  def offense_number
    text "offense number: #{@offense.first.id}", size: 15, style: :bold
  end
  def personal_information
    move_down 20
    text "Personal Information", size: 15, style: :bold, :align => :center
  end
  def first_name
    move_down 20
    text "First Name: #{@offense.first.first_name}", size: 15
  end
  def middle_name
    text "Middle Name: #{@offense.first.middle_name}", size: 15
  end
  def last_name
    text "Middle Name: #{@offense.first.last_name}", size: 15
  end
  def address
    move_down 20
    text "First Name: #{@offense.first.first_name}", size: 15
  end
  def middle_name
    text "Middle Name: #{@offense.first.middle_name}", size: 15
  end
  def last_name
    text "MIddle Name: #{@offense.first.last_name}", size: 15
end