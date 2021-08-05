class Oystercard 
    MAXIMUM_BALANCE = 90 
    MINIMUM_BALANCE = 1
    MINIMUM_FARE = 1
    attr_reader :balance, :entry_station, :journey, :journeys, :exit_station


    def initialize()
        @balance = 0
        @in_journey = false 
        @entry_station = nil
        @exit_station = nil
        @journeys = []
        #@journey ={}

    end 
    # @journey << { entrance :@entry_station => destination :@exit_station}
    # @journeys << @journey
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
        @exit_station = station
        @journeys << { entrance: @entry_station, destination: @exit_station}
        #@journeys << @journey
        @entry_station = nil
    end 

    def in_journey?
        !!@entry_station
    end 
    
    

    private
    def deduct(amount)
        @balance -= amount 
    end

end 