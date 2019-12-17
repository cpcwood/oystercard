class Journey
  attr_reader :entry_station, :exit_station, :journeys

  def initialize
    @entry_station = nil
    @exit_station = nil
    @journeys = []
  end

  def in_journey?
    @entry_station != nil
  end

  def add_entry_station(station)
    @entry_station = station
  end

  def add_exit_station(station)
    @exit_station = station
    record_journey
    @entry_station, @exit_station = nil
  end

  def journey_number(number)
    @journeys[number - 1]
  end

  private

  def record_journey
    @journeys << {:touch_in => @entry_station, :touch_out => @exit_station}
  end

end
