require_relative 'hand'
require_relative 'poker_engine'

class Comparator
  VALUES = {
    straight_flush: 8,
    flush: 7,
    full_house: 6,
    straight: 5,
    four_of_a_kind: 4,
    three_of_a_kind: 3,
    two_pair: 2,
    pair: 1,
    nothing: 0
  }

  def initialize(first_hand, second_hand)
    @first_hand  = first_hand
    @second_hand = second_hand
  end

  # Evaluate both hands and return the highest ranking one
  def winner
    @first_hand_rank  = PokerEngine.evaluate(@first_hand)
    @second_hand_rank = PokerEngine.evaluate(@second_hand)

    return compare_cards if @first_hand_rank == @second_hand_rank

    highest_ranking_hand
  end

  def highest_ranking_hand
    rank_value(@first_hand_rank) > rank_value(@second_hand_rank) ? @first_hand : @second_hand
  end

  # In case of a tie compare the highest value card from each hand
  def compare_cards
    # @first_hand.values.max > @second_hand.values.max ? @first_hand : @second_hand

    @first_hand.values.each_with_index do |_, idx|
      return @first_hand  if @first_hand.values[idx] > @second_hand.values[idx]
      return @second_hand if @first_hand.values[idx] < @second_hand.values[idx]
    end

    raise "Both hands are equal"
  end

  def rank_value(hand)
    VALUES[hand]
  end
end
