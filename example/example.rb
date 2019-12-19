require '../lib/oystercard.rb'
require '../lib/station.rb'

#create new oystercard with 30 balance
puts 'Create new oystercard with £16 balance'
oystercard = Oystercard.new(16)

#display balance
puts "Balance = £#{oystercard.balance}"

#fees
puts "£#{Oystercard::MIN_FARE} min fare, £1 fee per zone boundary"

#create stations
puts 'Create stations'
east_aldgate = Station.new('East Aldgate', 1)
richmond = Station.new('Richmond', 4)
brixton = Station.new('Brixton', 2)

#touch in
puts 'Touch in at Richmond'
oystercard.touch_in(richmond)

#touch out
puts 'Touch out at East Aldgate'
oystercard.touch_out(east_aldgate)

#display balance
puts "Balance = £#{oystercard.balance}"

#display journeys
puts "Journeys #{oystercard.show_journeys}"

#touch out
puts 'Touch out at Brixton but forget to touch in'
oystercard.touch_out(brixton)

#display balance
puts "Balance = £#{oystercard.balance}"

#touch in
puts 'Touch in at Richmond'
oystercard.touch_in(richmond)

#touch in
puts 'Touch in at Brixton without touching out'
oystercard.touch_in(brixton)

#display balance
puts "Balance = £#{oystercard.balance}"

#display journeys
puts "Journeys #{oystercard.show_journeys}"

#try touching in with no balance
puts 'Try touching in with no balance'
begin
  oystercard.touch_in(richmond)
rescue => e
  puts e
end

#try topping up above limit
puts 'Try topping up above limit'
begin
  oystercard.top_up(Oystercard::MAX_LIMIT + 1)
rescue => e
  puts e
end

#thanks for running me
puts 'Thanks for taking a look at the example... These fares look abit too low for London though ;)'
