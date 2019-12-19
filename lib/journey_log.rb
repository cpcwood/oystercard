class JourneyLog
  attr_reader :journey_class

  def initialize(journey_class)
    @journey_class = journey_class
    @current_journey = journey_class.new
    @journeylist = []
  end

  def start(station)
    @current_journey.add_touch_in(station)
  end

  def finish(station)
    @current_journey.add_touch_out(station)
    @journeylist << @current_journey.journey
    @current_journey = journey_class.new
  end

  def journeys
    @journeylist.map{|journey| journey.clone }
  end

  def in_journey?
    @current_journey.show_touch_in != nil
  end
end
