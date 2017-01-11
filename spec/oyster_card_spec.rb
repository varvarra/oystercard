require 'oyster_card'
  describe OysterCard do
    let (:entry_station) {double :aldgate}
    let (:exit_station) {double :victoria}

    describe '#balance' do
      it 'has balance of zero' do
        expect(subject.balance).to eq 0
      end
    end

    describe '#journey_history' do
      it "returns an empty array" do
      expect(subject.journey_history).to eq []
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

    describe "#in_journey?" do
      it "when created is not in journey" do
        expect(subject).not_to be_in_journey
      end
    end

    describe "#touch_in" do
      context "when balance is too low" do
        it "raises an error" do
          oc = OysterCard.new
          expect{oc.touch_in(entry_station)}.to raise_error("Insufficient funds")
        end
      end
      before do
        @min_journey_fund = OysterCard::MIN_JOURNEY_FUND
        subject.top_up(20)
      end

      context "when you start your journey" do

        it "changes your in journey status" do
          subject.touch_in(entry_station)
          expect(subject.in_journey?).to eq true
        end
      end

      context "when you start your journey at a station" do
        it "remembers the station" do
          expect(subject.touch_in(entry_station)).to eq entry_station
        end
      end
      it "stores the entry station" do
        subject.touch_in(entry_station)
        expect(subject.journey[:entry_station]).to eq entry_station
      end
    end

    describe "#touch_out" do
      before do
        subject.top_up(20)
        subject.touch_in(entry_station)
      end

      context "when you finish your journey" do
        it "changes your journey status" do
          subject.touch_out(exit_station)
          expect(subject).not_to be_in_journey
        end

        it "deducts from your balance" do
          expect{subject.touch_out(exit_station)}.to change{subject.balance}.by(-5)
        end

        it "deletes entry station" do
          subject.touch_out(exit_station)
          expect(subject.entry_station).to eq nil
        end

        it "remembers the station" do
          expect(subject.touch_out(exit_station)).to eq exit_station
        end

        it "stores the exit_station" do
          subject.touch_out(exit_station)
          expect(subject.journey[:exit_station]).to eq exit_station
        end

        it "stores the whole journey" do
          subject.touch_out(exit_station)
          expect(subject.journey_history).to include subject.journey
        end

      end
    end

end
