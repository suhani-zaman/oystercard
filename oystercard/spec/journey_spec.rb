require "Journey"
require "oystercard"

describe Journey do
  
  it "if entry and exit station nil then issues penalty fare" do
    subject.top_up(50)
    subject.touch_out("London")
    expect(subject.fare).to eq(6)
  end
end