require_relative '../card'

# number - suite

describe Card do
  let(:card) { Card.new("10D") }
  let(:other_card) { Card.new("4C") }

  it 'can parse the card number' do
    expect(card.number).to eq "10"
  end

  it 'can parse the card suite' do
    expect(card.suite).to eq "D"
  end

  it 'can calculate an absolute value' do
    expect(card.value).to eq 10
    expect(other_card.value).to eq 4
  end

  it 'can compare two cards' do
    expect(card <=> other_card).to eq 1
  end
end
