require 'journey'

describe Journey do
  it "responds to a new journey class" do
    expect(subject).to be_an_instance_of Journey
  end

  context "when starting a journey" do

    it "should check if entry station is not nil" do
    journey = Journey.new
    journey.start_journey("Victoria")
    expect(journey.entry_station).not_to be_nil
  end
  end
end
