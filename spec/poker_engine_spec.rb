require 'poker_engine'

describe PokerEngine do
  let(:nothing) { Hand.new("3D 1H AD 2C JS") }

  let(:pair)     { Hand.new("3D 9H AD 3C JS") }
  let(:two_pair) { Hand.new("JH JC 4C 4S 9H") }
  let(:triple)   { Hand.new("2C 2H 2S KS 5H") }
  let(:four)     { Hand.new("9C 9H 9S 9D 7H") }

  let(:straight)          { Hand.new("QC JH 10S 9D 8H")}
  let(:straight_ace)      { Hand.new("5C 4H 3S 2D AH")}
  let(:straight_unsorted) { Hand.new("10S 8H JH QC 9D")}
  let(:straight_flush)    { Hand.new("QD JD 10D 9D 8D")}

  let(:flush) { Hand.new("QD 3D 9D KD 1D")}

  let(:full_house) { Hand.new("7S 7S 7S 4S 4H") }

  it 'can find one pair of cards with the same number' do
    expect(PokerEngine.check_pair(pair)).to be_truthy
  end

  it 'does not find a pair if all the numbers are uniq' do
    expect(PokerEngine.check_pair(nothing)).to be_falsy
  end

  it 'can find a two pair' do
    expect(PokerEngine.check_two_pair(two_pair)).to be_truthy
  end

  it 'doesn not find two pair when there is none' do
    expect(PokerEngine.check_two_pair(nothing)).to be_falsy
  end

  it 'can find three_of_a_kind' do
    expect(PokerEngine.three_of_a_kind(triple)).to be_truthy
  end

  it 'can find four_of_a_kind' do
    expect(PokerEngine.four_of_a_kind(four)).to be_truthy
  end

  it 'finds a straight' do
    expect(PokerEngine.straight(straight)).to be_truthy
  end

  it 'finds a straight even if the cards are unsorted' do
    expect(PokerEngine.straight(straight_unsorted)).to be_truthy
  end

  it 'finds a straight with an Ace working as 1 instead of 14' do
    expect(PokerEngine.straight(straight_ace)).to be_truthy
  end

  it 'should not find a straight flush' do
    expect(PokerEngine.straight_flush(nothing)).to be_falsy
  end

  it 'should find a straight flush' do
    expect(PokerEngine.straight_flush(straight_flush)).to be_truthy
  end

  it 'finds a full-house' do
    expect(PokerEngine.full_house(full_house)).to be_truthy
  end

  it 'finds a flush' do
    expect(PokerEngine.flush(flush)).to be_truthy
  end

  it 'returns the correct hand name' do
    expect(PokerEngine.evaluate(flush)).to eq  :flush
    expect(PokerEngine.evaluate(triple)).to eq :three_of_a_kind
    expect(PokerEngine.evaluate(full_house)).to eq      :full_house
    expect(PokerEngine.evaluate(straight_flush)).to eq  :straight_flush
  end
end
