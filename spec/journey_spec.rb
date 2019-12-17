require 'journey'

describe Journey do

  before(:each) do
    oystercard = double('oystercard', :balance => 10)
  end

  it 'shows if card is in journey' do
    expect(subject.in_journey?).to eq false
  end

  it 'shows card is in journey after touching in' do
    old_street = double("old_street", :name => 'Old Street', :zone => 1 )
    subject.add_entry_station(old_street)
    expect(subject.in_journey?).to eq true
  end

  it 'returns entry station after touch in' do
      old_street = double("old_street", :name => 'Old Street', :zone => 1 )
      subject.add_entry_station(old_street)
      expect(subject.entry_station).to eq old_street
  end

  it 'shows card is not in journey after touching in then touching out again' do
    old_street = double("old_street", :name => 'Old Street', :zone => 1 )
    kings_cross = double("kings_cross", :name => 'Kings Cross', :zone => 1)
    subject.add_entry_station(old_street)
    subject.add_exit_station(kings_cross)
    expect(subject.in_journey?).to eq false
  end

  it 'after touching out, entry station returns nil' do
    old_street = double("old_street", :name => 'Old Street', :zone => 1 )
    kings_cross = double("kings_cross", :name => 'Kings Cross', :zone => 1)
    subject.add_entry_station(old_street)
    expect{ subject.add_exit_station(kings_cross) }.to change{ subject.entry_station }.to nil
  end

  it 'journeys is empty by default' do
    expect(subject.journeys).to eq []
  end

  it 'after touching out, journey is recorded' do
    old_street = double("old_street", :name => 'Old Street', :zone => 1 )
    kings_cross = double("kings_cross", :name => 'Kings Cross', :zone => 1)
    subject.add_entry_station(old_street)
    subject.add_exit_station(kings_cross)
    expect(subject.journey_number(1)).to eq ({:touch_in => old_street, :touch_out => kings_cross})
  end

end
