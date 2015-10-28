require_relative '../hand'

describe Hand do
  let(:hand) { Hand.new("3D 9H AD 8C JS") }

  it 'can turn an input string into an array of cards' do
    expect(hand.cards.size).to eq 5
    expect(hand.cards[0].value).to eq 3
  end
end
