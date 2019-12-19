require_relative 'journey_log'
require_relative 'journey'

class Oystercard
    attr_reader :balance, :journeylog

    MAX_LIMIT = 90
    MIN_LIMIT = 1
    MIN_FARE = 1
    PENALTY_FARE = 6

    def initialize(balance = 0)
        @balance = balance
        @journeylog = JourneyLog.new(Journey)
    end

    def top_up(value)
        fail "Error: Maximum limit of #{MAX_LIMIT.to_s} reached" if exceeds_max?(value)
        @balance += value
    end

    def touch_in(station)
      fail "Not enough credit" if min_amount?
      touch_out(nil) if already_touched_in?
      journeylog.start(station)
    end

    def touch_out(station)
      journeylog.finish(station)
      deduct(last_journey_fare)
    end

    def show_journeys
      journeylog.journeys
    end

    private

    def exceeds_max?(value)
      @balance + value >= MAX_LIMIT
    end

    def min_amount?
      @balance <= MIN_LIMIT
    end

    def deduct(value)
      @balance -= value
    end

    def last_journey_fare
      begin
        (show_journeys[-1][:touch_in].zone - show_journeys[-1][:touch_out].zone).abs + MIN_FARE
      rescue
        PENALTY_FARE
      end
    end

    def already_touched_in?
      journeylog.in_journey?
    end
end
