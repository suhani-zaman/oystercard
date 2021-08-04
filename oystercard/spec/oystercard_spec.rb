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

    it 'throws an error message when balance exceed limit' do 
        
        expect{ subject.top_up 1000}.to raise_error 'Maximum limit reached'
    end 
    describe '#deduct' do
    it { is_expected.to respond_to(:deduct).with(1).argument } 
    end 

    it 'should deduct from the balance' do 
        expect {subject.deduct 1}.to change{subject.balance}.by -1
    end

    it 'checks if the card is in journey' do 
        subject.top_up(50)
        subject.touch_in
        expect(subject.in_journey?).to eq true 
    end

    it 'checks if the card is not in journey' do 
        subject.top_up(50) 
        subject.touch_in 
        subject.touch_out
        expect(subject.in_journey?).to eq false 
    end 

    it 'raise an error at touch in when there is an insufficient balance' do 
        expect{ subject.touch_in}.to raise_error 'Insufficient funds'
    end
end 