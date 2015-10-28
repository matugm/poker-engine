
class Card
  include Comparable
  attr_accessor :number, :suite

  CARD = /([0-9JQKA]+)([SHCD])/

  def initialize(card)
      @number, @suite = card.match(CARD).captures
  end

  def value
    case number
    when /\d/ then number.to_i
    when "J"  then 11
    when "Q"  then 12
    when "K"  then 13
    when "A"  then 14
    end
  end

  def <=>(other)
    value <=> other.value
  end
end
