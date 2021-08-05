require "Station"
describe Station do
  let(:station) { Station.new("london", 5)}
  it "class station has a name" do
    #station = Station.new("london", 5)
    expect(station.station_name).to eq ("london")
  end
  it "class station has a zone" do
    #station = Station.new("london", 5)
    expect(station.zone).to eq (5)
  end
end