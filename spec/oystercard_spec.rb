require 'oystercard'

describe Oystercard do

  let(:old_street){ double :old_street, :name => 'old_street', :zone => 1 }
  let(:kings_cross){ double :kings_cross, :name => 'kings_cross', :zone => 4 }

  describe '#initialize' do
    it 'initializes with a default balance' do
      expect(subject.balance).to eq 0
    end
    it 'initializes with balance passed as arugment' do
      expect(Oystercard.new(20).balance).to eq 20
    end
    it 'initializes with a JourneyLog instance' do
      expect(subject.journeylog).to be_an_instance_of(JourneyLog)
    end
  end

  describe '#top_up' do
    it 'error raised if top_up would take the balance beyond the limit' do
      expect{ subject.top_up(Oystercard::MAX_LIMIT + 1) }.to raise_error "Error: Maximum limit of #{Oystercard::MAX_LIMIT.to_s} reached"
    end
    it 'tops up balance by value passed as arugment' do
      expect{ subject.top_up(1) }.to change{ subject.balance }.by 1
    end
  end

  describe '#touch_in' do
    it 'raises an error if balance less than minmum limit' do
      expect{ (Oystercard.new([Oystercard::MIN_LIMIT - 1, 0].max)).touch_in(old_street) }.to raise_error "Not enough credit"
    end
    it 'charges penalty fare if failed to touch out (touched in twice)' do
      subject.top_up(10)
      subject.touch_in(old_street)
      expect{subject.touch_in(kings_cross)}.to change{subject.balance}.by (-Oystercard::PENALTY_FARE)
    end
    it 'messages @journeylog to start journey at station passed' do
      subject.top_up(10)
      expect(subject.instance_variable_get(:@journeylog)).to receive(:start).with(old_street)
      subject.touch_in(old_street)
    end
  end

  describe '#touch_out' do
    it 'messages the journey log to add a finish station' do
      expect(subject.instance_variable_get(:@journeylog)).to receive(:finish).with(old_street)
      subject.touch_out(old_street)
    end
    it 'charges penatly fare if entry station not defined' do
      subject.top_up(10)
      expect{subject.touch_out(old_street)}.to change{subject.balance}.by (-Oystercard::PENALTY_FARE)
    end
    it 'charges min fare if no zone boundaries crossed' do
      subject.top_up(10)
      subject.touch_in(old_street)
      expect{ subject.touch_out(old_street) }.to change{ subject.balance }.by (-Oystercard::MIN_FARE)
    end
    it 'charges extra £1 for each zone boundary crossed' do
      subject.top_up(10)
      subject.touch_in(old_street)
      expect{ subject.touch_out(kings_cross) }.to change{ subject.balance }.by (-(Oystercard::MIN_FARE + 3))
    end
  end

  describe '#show_journeys' do
    it 'messages the journey log to return a list of journeys' do
      expect(subject.instance_variable_get(:@journeylog)).to receive(:journeys)
      subject.show_journeys
    end
  end
end
