class Oystercard 
    MAXIMUM_BALANCE = 90 
    MINIMUM_BALANCE = 1
    MINIMUM_FARE = 1
    attr_reader :balance, :entry_station, :journey, :card


    def initialize()
        @balance = 0
        @in_journey = false 
        @entry_station = nil
        @journey = {@entry_station => @exit_station}
        @exit_station = nil
        @card = []

    end 
    #@journey = {@entry_station => @exit_station}
      
    def top_up(amount) 
        raise 'Maximum limit reached' if (@balance + amount) > MAXIMUM_BALANCE
        @balance += amount
    end 

     

    def touch_in(station) 
        @entry_station = station
        raise 'Insufficient funds' if @balance < MINIMUM_BALANCE
        @in_journey = true 
    end 

    def touch_out(station)
        deduct(MINIMUM_FARE)
        @in_journey = false
        #@entry_station = nil
        @exit_station = station
        @journey = {@entry_station => @exit_station}
    end 

    def in_journey?
        !!@entry_station
    end 
    
    

    private
    def deduct(amount)
        @balance -= amount 
    end

end 