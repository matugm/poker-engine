require_relative 'hand'

module PokerEngine
  extend self

  def evaluate(hand)
    return :straight_flush  if straight_flush(hand)
    return :flush           if flush(hand)
    return :full_house      if full_house(hand)
    return :straight        if straight(hand)
    return :four_of_a_kind  if four_of_a_kind(hand)
    return :three_of_a_kind if three_of_a_kind(hand)
    return :two_pair        if check_two_pair(hand)
    return :pair            if check_pair(hand)

    return :nothing
  end

  # Array size changes if there are repeated values
  def check_pair(hand)
    hand.numbers.size != hand.numbers.uniq.size
  end

  def count_card_values(hand)
    total      = {}
    numbers    = hand.numbers

    # Map to count
    numbers.map { |n| total[n] = numbers.count(n) }
    total.values
  end

  def check_two_pair(hand)
    count_card_values(hand).count(2) == 2
  end

  def three_of_a_kind(hand)
    count_card_values(hand).count(3) == 1
  end

  def four_of_a_kind(hand)
    count_card_values(hand).count(4) == 1
  end

  def full_house(hand)
    count_card_values(hand).count(2) == 1 &&
    three_of_a_kind(hand)
  end

  def flush(hand)
    suite = hand.cards.first.suite

    hand.cards.all? { |card| card.suite == suite }
  end

  # Sequential numbers: 10, 9, 8, 7, 6
  def straight(hand)
    numbers = hand.values
    numbers = numbers.sort

    # Handle special case where A = 1
    return true if numbers == [2, 3, 4, 5, 14]

    numbers
      .each_cons(2)
      .all? { |x, y| x == y - 1 }
  end

  # Sequential numbers with the same suite
  def straight_flush(hand)
    cards = hand.cards
    cards = cards.sort_by(&:value)

    cards.each_cons(2).all? do |x, y|
      x.value == y.value - 1 &&
      x.suite == y.suite
    end
  end
end
