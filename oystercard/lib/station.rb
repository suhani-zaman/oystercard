class Station
    attr_reader :station_name, :zone
    def initialize(name, zone)
      @station_name = name
      @zone = zone

    end
end