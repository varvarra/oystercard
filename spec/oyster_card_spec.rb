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

    context "when over max limit" do
      before do
        @max_balance = OysterCard::MAX_BALANCE
        subject.top_up(@max_balance)
      end
      it "raises error" do
        expect{subject.top_up(rand(10))}.to raise_error("Attempted to top up beyond max value of £#{@max_balance}.00")
      end
    end

    describe '#deduct' do
      context "when there is enough balance" do
        before do
          subject.top_up(50)
          subject.deduct(5)
        end
        it "can have balance decreased" do
          expect(subject.balance).to eq(45)
        end
      end
    end

    describe "in_journey?" do
      it "when created is not in journey" do
        expect(subject).not_to be_in_journey
      end
    end

    describe "touch_in" do
      context "when you start your journey" do
        before do
          subject.top_up(20)
        end
        it "changes your in journey status" do
          subject.touch_in
          expect(subject).to be_in_journey
        end
      end
      context "when balance is too low" do
        before do
          @min_journey_fund = OysterCard::MIN_JOURNEY_FUND
        end
        it "raises an error" do
          expect{subject.touch_in}.to raise_error("Insufficient funds")
        end
      end
    end

    describe "touch_out" do
      context "when you finish your journey" do
        it "changes your journey status" do
          subject.touch_out
          expect(subject).not_to be_in_journey
        end
      end
    end
end
