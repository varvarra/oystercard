require 'oyster_card'
describe OysterCard do
  describe '#balance' do
    it 'has balance of zero' do
      expect(subject.balance).to eq 0
    end
  end

end
