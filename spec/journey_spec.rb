require 'journey'

describe Journey do

  let(:old_street){double('old_street')}

  describe '#initialize' do
    it 'journey hash is nil by default' do
      expect(subject.journey).to eq ({:touch_in => nil, :touch_out => nil})
    end
  end

  describe '#add_touch_in' do
    it 'records entry station' do
        subject.add_touch_in(old_street)
        expect(subject.journey[:touch_in]).to eq old_street
    end
  end

  describe '#add_touch_out' do
    it 'records exit station' do
      subject.add_touch_out(old_street)
      expect(subject.journey[:touch_out]).to eq old_street
    end
  end

  describe '#show_touch_in' do
    it 'returns touch in station' do
      subject.add_touch_in(old_street)
      expect(subject.show_touch_in).to eq old_street
    end
  end
end
