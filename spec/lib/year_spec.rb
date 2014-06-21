require 'spec_helper'

describe Period::Year do
  describe '.new' do
    context 'with valid args' do
      let(:year) { 2014 }
      subject(:period) { Period::Year.new(:year => year) }

      it 'returns a `Period::Year`' do
        expect(period).to be_a Period::Year
      end

      it 'covers the defined year' do
        expect(period.year).to eq 2014
      end

      it 'starts at `2014-01-01 00:00:00`' do
        expect(period.start.to_s(:db)).to eq '2014-01-01 00:00:00'
      end

      it 'ends at `2014-12-31 23:59:59`' do
        expect(period.finish.to_s(:db)).to eq '2014-12-31 23:59:59'
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

  describe '#previous' do
    subject(:period) { Period::Year.new(:year => 2000).previous }

    it 'returns the previous `Period::Year`' do
      expect(period).to be_a Period::Year
      expect(period.year).to eq 1999
    end
  end

  describe '#previous' do
    subject(:period) { Period::Year.new(:year => 2000) }

    it 'is a alias for #previous' do
      expect(period.prev).to eq period.previous
    end
  end

  describe '#next' do
    subject(:period) { Period::Year.new(:year => 2000).next }

    it 'returns the next `Period::Year`' do
      expect(period).to be_a Period::Year
      expect(period.year).to eq 2001
    end
  end

  describe '#==' do
    let(:period) { Period::Year.new(:year => 2004) }
    subject(:comparasion) { period == other }

    context 'when other is not a `Period::Year`' do
      let(:other) { Time.local('2004-12-12') }

      it 'returns false' do
        expect(comparasion).to be false
      end
    end

    context 'when other covers not the same period' do
      let(:other) { Period::Year.new(:year => 2003) }

      it 'returns false' do
        expect(comparasion).to be false
      end
    end

    context 'when other covers the same period' do
      let(:other) { Period::Year.new(:year => 2004) }

      it 'returns false' do
        expect(comparasion).to be true
      end
    end
  end
end
