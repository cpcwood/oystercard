require_relative 'journey'

class JourneyLog
  attr_reader :current_journey

  def initialize(journey_class: Journey)
    @current_journey = journey_class
    @journeys = []
  end

  def start(station)
    current_journey.add_entry_station(station)
  end

  def finish(station)
    current_journey.add_exit_station(station)
  end

  def in_journey?
    current_journey.entry_station != nil
  end

  private



  # def journey_number(number)
  #   @journeys[number - 1]
  # end

end
