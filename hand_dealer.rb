require_relative 'poker_engine'
require_relative 'hand'

def gen_cards
  numbers = (2..10).to_a + %w(J K Q A)
  suits   = %w(H S D C)

  suits.flat_map { |s| numbers.map { |n| "#{n}#{s}" } }
end

def get_hand
  gen_cards.sample(5).join(" ")
end

20.times do
  hand   = Hand.new(get_hand)
  result = PokerEngine.evaluate(hand)

  puts "#{result}".ljust(20) + "#{hand.original.split}"
end
