require 'journey_log'

describe JourneyLog do

  it 'initializes with a journey class parameter' do
    allow(Journey).to receive(:new).and_return('test')
    new_log = JourneyLog.new
    expect(new_log.journey).to eq 'test'
  end

  it 'starts new journey with entry station' do
    old_street = double("old_street", :name => 'Old Street', :zone => 1 )
    subject.start(old_street)
    expect(subject.entry_station).to eq old_street
  end


end
