class Oystercard 
    MAXIMUM_BALANCE = 90 
    MINIMUM_BALANCE = 1
    attr_reader :balance 


    def initialize()
        @balance = 0
        @maximum_balance = MAXIMUM_BALANCE 
        @minimum_balance = MINIMUM_BALANCE
        @in_journey = false
    end 

    def top_up(amount) 
        raise 'Maximum limit reached' if (@balance + amount) > @maximum_balance
        @balance += amount
    end 

    def deduct(amount)
        @balance -= amount 
    end 

    def touch_in 
        raise 'Insufficient funds' if @balance < @minimum_balance
        @in_journey = true 
    end 

    def touch_out 
        @in_journey = false
    end 

    def in_journey?
        @in_journey
    end 
end 