require_relative '../comparator.rb'

describe Comparator do
  let(:nothing)  { Hand.new("3D 1H AD 2C JS") }

  let(:pair)       { Hand.new("3D 9H AD 3C JS") }
  let(:pair_lower) { Hand.new("3D 8H 1D 3C JS") }

  let(:triple)   { Hand.new("2C 2H 2S KS 5H") }

  let(:comparator) { Comparator.new(pair, triple) }
  let(:comparator_nothing) { Comparator.new(pair, nothing) }
  let(:comparator_pairs)   { Comparator.new(pair, pair_lower) }

  it 'has a table of hand values' do
    expect(comparator.rank_value(:pair)).to eq 1
  end

  it 'compares two hands' do
    expect(comparator.winner).to eq triple
    expect(comparator_nothing.winner).to eq pair
  end

  it 'returns the correct winner even if the two hands are of the same type' do
    expect(comparator_pairs.winner).to eq pair
  end
end
