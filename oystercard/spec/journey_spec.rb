require "Journey"
require "oystercard"

describe Journey do
  let(:station) {double :station}
  it "if entry and exit station nil then issues penalty fare" do
    subject.top_up(50)
    subject.touch_out("London")
    expect(subject.fare).to eq(6)
  end
  it "journey is not complete" do
    expect(subject).not_to be_complete
  end
  it "has penalty fare by default" do
    expect(subject.fare).to eq Journey::PENALTY_FARE
  end
  # it "return journey while exiting a journey" do
  #   expect(subject.finish(station)).to eq(subject)
  # end
  context 'entry station given' do
    subject {described_class.new(entry_station: station)}
    it "checks for entry station" do
      entry_station = station
      expect(subject.entry_station).to eq station
    end
    it "penalty fare return when no exit station given" do
      expect(subject.fare).to eq Journey::PENALTY_FARE
    end
  end
end