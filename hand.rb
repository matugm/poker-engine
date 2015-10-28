require_relative 'card'

class Hand
  attr_reader :cards, :original

  def initialize(hand)
    @original = hand
    @cards    = hand.split.map { |card| Card.new(card) }
  end

  def numbers
    @cards.map(&:number)
  end

  def values
    @cards.map(&:value)
  end

  def inspect
    @original
  end
end
