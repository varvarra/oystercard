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
    it "Stops top ups beyond max balance" do
      max_balance = OysterCard::MAX_BALANCE
      message = "Attempted to top up beyond max value of £#{max_balance}.00"
      expect {subject.top_up(max_balance+0.01)}.to raise_error(message)
    end
  end

end
