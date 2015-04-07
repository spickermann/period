require 'spec_helper'

RSpec.describe Period::Year do
  describe '.new' do
    context 'with args' do
      let(:start)  { Time.local(2014, 01, 01) }
      let(:finish) { Time.local(2014, 12, 31, 23, 59, 59, Rational(999_999_999, 1000)) }

      subject(:period) { Period::Year.new(year: 2014) }

      its(:year) { is_expected.to eq 2014 }
      its(:start) { is_expected.to eq start }
      its(:finish) { is_expected.to eq finish }
    end

    context 'without args' do
      subject(:period) { Period::Year.new }

      its(:year) { is_expected.to eq Period.current_time.year }
    end
  end

  describe '.from' do
    context 'without args' do
      subject(:period) { Period::Year.from }

      its(:year) { is_expected.to eq Period.current_time.year }
    end

    context 'with a time arg' do
      subject(:period) { Period::Year.from(time: Time.local(2009)) }

      its(:year) { is_expected.to eq 2009 }
    end

    context 'with a string arg' do
      subject(:period) { Period::Year.from(string: '2013') }

      its(:year) { is_expected.to eq 2013 }
    end
  end

  describe '#previous' do
    subject(:period) { Period::Year.new(year: 2000) }

    it 'returns the previous `Period::Year`' do
      expect(period.previous).to eq Period::Year.new(year: 1999)
    end
  end

  describe '#prev' do
    subject(:period) { Period::Year.new(year: 1987) }

    it 'is a alias for #previous' do
      expect(period.prev).to eq period.previous
    end
  end

  describe '#next' do
    subject(:period) { Period::Year.new(year: 1971) }

    it 'returns the next `Period::Year`' do
      expect(period.next).to eq Period::Year.new(year: 1972)
    end
  end

  describe '#==' do
    let(:period) { Period::Year.new(year: 2015) }

    subject(:comparasion) { period == other }

    context 'when other covers the same period' do
      let(:other) { Period::Year.new(year: 2015) }

      it { is_expected.to be true }
    end

    context 'when other is not a `Period::Year`' do
      let(:other) { Time.local('2015-12-12') }

      it { is_expected.to be false }
    end

    context 'when other covers not the same period' do
      let(:other) { Period::Year.new(year: 1999) }

      it { is_expected.to be false }
    end
  end

  describe '#cover?' do
    subject(:cover) { Period::Year.new(year: 2014).cover?(date) }

    context 'when date is covered by the range' do
      let(:date) { Time.local('2014-06-09') }

      it { is_expected.to be true }
    end

    context 'when date is not covered by the range' do
      let(:date) { Time.local('2011-06-09') }

      it { is_expected.to be false }
    end
  end

  describe '#to_r' do
    subject(:period) { Period::Year.new(year: 2014) }

    its(:to_r) { is_expected.to eq Time.local('2014').all_year }
  end

  describe '#to_s' do
    subject(:period) { Period::Year.new(year: 2014) }

    its(:to_s) { is_expected.to eq '2014' }
  end
end
