require 'journey_log'

describe JourneyLog do

  let(:old_street){double('old_street')}
  let(:journey_instance){double :journey_instance, :add_touch_in => nil, :add_touch_out => nil}
  let(:journey_class){double :journey_class, :new => journey_instance}

  subject{JourneyLog.new(journey_class)}

  describe '#initialize' do
    it 'initializes with a journey class parameter' do
      expect(subject.journey_class).to eq journey_class
    end
    it 'initializes with a new journey instance' do
      expect(subject.instance_variable_get(:@current_journey)).to eq journey_instance
    end
    it 'initializes with empty journeylist array' do
      expect(subject.instance_variable_get(:@journeylist)).to eq []
    end
  end

  describe '#start' do
    it 'message current journey to add entry station' do
      expect(journey_instance).to receive(:add_touch_in).with(old_street)
      subject.start(old_street)
    end
  end

  describe '#finish' do
    it 'message current journey to add exit station' do
      allow(journey_instance).to receive(:journey)
      subject.start(old_street)
      expect(journey_instance).to receive(:add_touch_out).with(old_street)
      subject.finish(old_street)
    end
    it 'current journey hash added to journeylist array' do
      journey_taken = {:touch_in => old_street, :touch_out => old_street}
      allow(journey_instance).to receive(:journey).and_return(journey_taken)
      subject.start(old_street)
      subject.finish(old_street)
      expect(subject.instance_variable_get(:@journeylist)).to eq [journey_taken]
    end
    it 'current_journeys reset with new journey instance' do
      allow(journey_instance).to receive(:journey)
      subject.start(old_street)
      another_journey_instance = double('another_journey_instance')
      allow(journey_class).to receive(:new).and_return(another_journey_instance)
      expect{subject.finish(old_street)}.to change{subject.instance_variable_get(:@current_journey)}.from(journey_instance).to(another_journey_instance)
    end
  end

  describe '#journeys' do
    it 'returns an accurate list of journeys taken' do
      journey_taken = {:touch_in => old_street, :touch_out => old_street}
      allow(journey_instance).to receive(:journey).and_return(journey_taken)
      subject.start(old_street)
      subject.finish(old_street)
      expect(subject.journeys[0][:touch_in]).to eq old_street
      expect(subject.journeys[0][:touch_out]).to eq old_street
    end
    it 'expect mutation of returned list of journeys not to modify journeylist array' do
      journey_taken = {:touch_in => old_street, :touch_out => old_street}
      allow(journey_instance).to receive(:journey).and_return(journey_taken)
      subject.start(old_street)
      subject.finish(old_street)
      journey_list = subject.journeys
      expect{journey_list[0][:touch_in] = nil}.not_to change{subject.instance_variable_get(:@journeylist)}.from([journey_taken])
    end
  end

  describe '#in_journey?' do
    it 'returns boolean on whether already touched in' do
      allow(journey_instance).to receive(:show_touch_in).and_return(old_street)
      expect(subject.in_journey?).to eq true
    end
  end
end
