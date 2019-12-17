require 'journey_log'

class Oystercard

    attr_reader :balance, :journeylog

    MAX_LIMIT = 90
    MIN_LIMIT = 1
    MIN_FARE = 2
    PENALTY_FARE = 6

    def initialize(balance = 0)
        @balance = balance
        @journeylog = JourneyLog.new
    end

    def top_up(value)
        fail "Error: Maximum limit of #{MAX_LIMIT.to_s} reached" if exceeds_max?(value)
        @balance += value
    end

    def touch_in(station)
      fail "Not enough credit" if min_amount?
      journeylog.start(station)
    end

    def touch_out(station = nil)
      station == nil || journey.entry_station == nil ? deduct(PENALTY_FARE) : deduct(MIN_FARE)
      journey(station)
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
end
