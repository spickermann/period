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
end
