class Station
    attr_reader :station_name, :zone, :card
    def initialize(name, zone)
      @station_name = name
      @zone = zone
    end
    def touch_in(card = Oystercard.new)
      @entry_station = self
      raise 'Insufficient funds' if card.balance < MINIMUM_BALANCE
      card.in_journey = true 
      journey = Journey.new(@station_name, @zone)
      card.journeys << journey
    end 
  
    def touch_out(station)
      deduct(MINIMUM_FARE)
      @in_journey = false
      @exit_station = station
      @journeys << { entrance: @entry_station, destination: @exit_station}
      #@journeys << @journey
    # @entry_station = nil
    end 
end