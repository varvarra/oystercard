require 'oyster_card'
describe OysterCard do
  describe '#balance' do
    it 'has balance of zero' do
      expect(subject.balance).to eq 0
    end
  end

  describe '#top_up' do
    it "adds the specified value" do
      subject.top_up(20)
      expect(subject.top_up(20)).to eq 40 
    end
  end

end
