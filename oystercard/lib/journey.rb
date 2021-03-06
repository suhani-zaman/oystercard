require_relative "oystercard"

class Journey

    MAXIMUM_BALANCE = 90 
    MINIMUM_BALANCE = 1
    MINIMUM_FARE = 1
    PENALTY_FARE = 6
    attr_reader :balance, :entry_station, :journey, :journeys, :exit_station
  def initialize(station_name, zone)
    @entry_station = station_name
    @exit_station = nil
    @entry_zone = zone
    @exit_zone = nil
  end

  def complete(exit_station, exit_zone, fare)
    @exit_station = exit_station
    @exit_zone = exit_zone
    @fare = fare
  end

  # def top_up(amount) 
  #   raise 'Maximum limit reached' if (@balance + amount) > MAXIMUM_BALANCE
  #   @balance += amount
  # end 

  # def touch_in(station) 
  #   @entry_station = station
  #   raise 'Insufficient funds' if @balance < MINIMUM_BALANCE
  #   @in_journey = true 
  # end 

  # def touch_out(station)
  #   deduct(MINIMUM_FARE)
  #   @in_journey = false
  #   @exit_station = station
  #   @journeys << { entrance: @entry_station, destination: @exit_station}
  #   #@journeys << @journey
  # # @entry_station = nil
  # end 

  def in_journey?
    !!@entry_station
  end 

  def fare
     
   if entry_station == nil || exit_station == nil
    return PENALTY_FARE
   end
   return MINIMUM_FARE
  end
  def complete?
    if entry_station == nil || exit_station == nil
      return false
    end
  end
  # def finish(station)
  #   @exit_station = station
  #   if @exit_station != nil
  #     journeys << {destination: @exit_station}
  #     @entry_station
  #     @exit_station
  #     @journey
  #   end
  # end



  private

  def deduct(amount)
    @balance -= amount 
  end
end