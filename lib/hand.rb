require_relative 'card'

class Hand
  attr_reader :cards, :original

  def initialize(hand)
    @original = hand
    @cards    = hand.split.map { |card| Card.new(card) }
  end

  # Returns an array of raw card valuues
  def numbers
    @cards.map(&:number)
  end

  # Returns an array of absolute card values
  def values
    @cards.map(&:value)
  end

  # Returns the original input string
  def inspect
    @original
  end
end
