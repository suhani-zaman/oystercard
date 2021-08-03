require 'oystercard'

describe Oystercard do 
    card = Oystercard.new 
    it 'has a balance of zero' do 
        expect(card.balance).to eq(0) 
    end 
    
    describe '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }
    end
    it 'should top_up the balance' do 
        expect{ card.top_up 1}.to change{card.balance }.by 1
    end 
end 