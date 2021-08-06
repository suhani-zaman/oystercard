require "./lib/oystercard.rb"
require "./lib/journey.rb"
class Station
    attr_reader :station_name, :zone, :card
    MINIMUM_BALANCE = 1
    def initialize(name, zone)
      @station_name = name
      @zone = zone
      @fare = MINIMUM_BALANCE
    end
    def touch_in(card = Oystercard.new)
      raise 'Insufficient funds' if card.balance < MINIMUM_BALANCE
      card.in_journey = true 
      journey = Journey.new(@station_name, @zone)
      card.journeys << journey
    end 
  
    def touch_out(card)
      @card = card
      deduct(MINIMUM_FARE)
      @card.in_journey = false
      complete_journey
    end 

    def complete_journey
      journey = @card.journeys.last
      journey.complete(@station_name, @zone, @fare)
    end
end