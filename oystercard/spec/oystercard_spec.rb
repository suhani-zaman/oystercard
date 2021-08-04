require 'oystercard'

describe Oystercard do 
    let (:station) {double :station} 

    it 'has a balance of zero' do 
        expect(subject.balance).to eq(0) 
    end 
    
    describe '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }
    end
    it 'should top_up the balance' do 
        expect{ subject.top_up 1}.to change{subject.balance }.by 1
    end 

    it 'throws an error message when balance exceed limit' do 
        
        expect{ subject.top_up 1000}.to raise_error 'Maximum limit reached'
    end 
    # describe '#deduct' do
    # it { is_expected.to respond_to(:deduct).with(1).argument } 
    # end 

    # it 'should deduct from the balance' do 
    #     expect {subject.deduct 1}.to change{subject.balance}.by -1
    # end

    it 'checks if the card is in journey' do 
        subject.top_up(50)
        subject.touch_in(station)
        expect(subject.in_journey?).to eq true 
    end

    it 'checks if the card is not in journey' do 
        subject.top_up(50) 
        subject.touch_in(station) 
        subject.touch_out
        expect(subject.in_journey?).to eq false 
    end 

    it 'raise an error at touch in when there is an insufficient balance' do 
        expect{ subject.touch_in(station)}.to raise_error 'Insufficient funds'
    end 

    it 'checks if touch_out deducts money from the balance' do 
        subject.top_up(5)
        subject.touch_in(station)
        expect{subject.touch_out}.to change{subject.balance}.by -1
    end 

    it 'stores the entry station after touch_in' do 
        subject.top_up(5)
        subject.touch_in(station)
        expect(subject.entry_station).to eq station
    end
end 