require 'spec_helper'

describe Period::Year do
  describe '.new' do
    context 'with valid args' do
      let(:year) { 2014 }
      subject(:period) { Period::Year.new(:year => year) }

      it 'returns a `Period::Year`' do
        expect(period).to be_a Period::Year
      end

      it 'is in the defined year' do
        expect(period.year).to eq 2014
      end
    end

    context 'with missing args' do
      subject(:period) { Period::Year.new }

      it 'raises KeyError' do
        expect{ period }.to raise_error(KeyError)
      end
    end
  end

  describe '.from_time' do
    let(:time) { Time.local('1999-08-31 23:03:12') }

    before do
      allow(Period::Year).to receive(:new)
    end

    it 'initializes a Period::Year with the given year' do
      Period::Year.from_time(time)
      expect(Period::Year).to have_received(:new).with(:year => 1999)
    end
  end

  describe '.current' do
    let(:time) { Time.local('2016-04-01 15:45:55') }

    before do
      allow(Period).to receive(:current_time).and_return(time)
      allow(Period::Year).to receive(:from_time)
    end

    it 'initializes a Period::Year with the current year' do
      Period::Year.current
      expect(Period::Year).to have_received(:from_time).with(time)
    end
  end
end
