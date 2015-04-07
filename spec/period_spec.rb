require 'spec_helper'

describe Period::Year do
  describe '.current_time' do
    let(:time) { Time.parse('1989-02-12 15:10:00') }
    let(:zone) { instance_double(ActiveSupport::TimeZone, :now => time) }

    before do
      allow(Time).to receive(:zone).and_return(zone)
    end

    it 'returns the current time' do
      expect(Period.current_time).to eq (time)
    end
  end
end
