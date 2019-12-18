class JourneyLog
  attr_reader :journey_class

  def initialize(journey_class_inject)       # inverts Journey class dependecy to initialization
    @journey_class = journey_class_inject    # makes Journey class object in JourneyLog
    @journeys = []
    @current_journey = journey_class.new
  end

  def start(station)
    @current_journey.add_touch_in(station)
  end

  def finish(station)
    @current_journey.add_touch_out(station)
    @journeys << @current_journey.journey
    @current_journey = journey_class.new
  end

  def entry_station
    @current_journey.show_touch_in
  end

  def journeys
    @journeys.map{|journey| journey.clone }
  end

end

# def journey_number(number)
#   @journeys[number - 1]
# end
#
# require './lib/oystercard.rb'
# require './lib/station.rb'
# kings = Station.new('kings', 2)
# old = Station.new('old', 2)
# oyster = Oystercard.new(20)
# oyster.touch_in(kings)
# oyster.touch_out(old)
