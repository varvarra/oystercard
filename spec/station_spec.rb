require 'station.rb'
require 'oyster_card.rb'

describe Station do

  subject {described_class.new(name: "Vicotria", zone: 1)}
  it "responds to its name" do
    expect(subject.name).to eq("Vicotria")
  end
  it "responds to" do
    expect(subject.zone).to eq(1)
  end
end
