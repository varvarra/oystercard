require 'oyster_card'
  describe OysterCard do

    let (:entry_station) {:aldgate}
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
        expect{subject.top_up(rand(1..10))}.to raise_error("Attempted to top up beyond max value of £#{@max_balance}.00")
      end
    end

    describe '#deduct' do
      context "when there is enough balance" do
        before do
          @oc=OysterCard.new
          @oc.top_up(50)
          result = @oc.send(:deduct,5)
        end
        it "balance is decreased by given amount" do
          expect(@oc.balance).to eq(45)
        end
      end
    end

    describe "#in_journey?" do
      it "when created is not in journey" do
        expect(subject).not_to be_in_journey
      end
    end

    describe "#touch_in" do
      before do
        @min_journey_fund = OysterCard::MIN_JOURNEY_FUND
      end
      context "when you start your journey" do
        before do
          subject.top_up(20)
        end
        it "changes your in journey status" do
          subject.touch_in(entry_station)
          expect(subject.in_journey?).to eq true
        end
      end
      context "when balance is too low" do
        it "raises an error" do
          expect{subject.touch_in(entry_station)}.to raise_error("Insufficient funds")
        end
      end
      context "when you start your journey at a station" do
        it "remembers the station" do
          subject.top_up(@min_journey_fund)
          expect(subject.touch_in(entry_station)).to eq entry_station
        end
      end
    end

    describe "#touch_out" do
      before do
        subject.top_up(20)
        subject.touch_in(entry_station)
      end
      context "when you finish your journey" do

        it "changes your journey status" do
          subject.touch_out
          expect(subject).not_to be_in_journey
        end

        it "deducts from your balance" do
          expect{subject.touch_out}.to change{subject.balance}.by(-5)
        end

        it "deletes entry station" do
          subject.touch_out
          expect(subject.entry_station).to eq nil
        end
      end
    end

end
