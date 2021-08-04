class Oystercard 
    MAXIMUM_BALANCE = 90 
    MINIMUM_BALANCE = 1
    MINIMUM_FARE = 1
    attr_reader :balance, :entry_station


    def initialize()
        @balance = 0
        @in_journey = false 
        @entry_station = ''
    end 

    def top_up(amount) 
        raise 'Maximum limit reached' if (@balance + amount) > MAXIMUM_BALANCE
        @balance += amount
    end 

     

    def touch_in(station) 
        @entry_station = station
        raise 'Insufficient funds' if @balance < MINIMUM_BALANCE
        @in_journey = true 
    end 

    def touch_out
        deduct(MINIMUM_FARE)
        @in_journey = false
        @entry_station = nil
    end 

    def in_journey?
        #!!@entry_station
        @entry_station != nil
    end 
    
    

    private
    def deduct(amount)
        @balance -= amount 
    end

end 