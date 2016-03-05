require 'rails_helper'

RSpec.describe Seeker do

  let!(:query) { 'Generic' }
  let!(:med1) { Med.create(brand_name: 'Brand1', generic_name: 'Generic', apis: 'Generic, Other, Ingredients', price_cents: 1799, price_currency: 'EUR') }
  let!(:med2) { Med.create(brand_name: 'Patented', generic_name: 'Generic', apis: 'Generic, Ingredients', price_cents: 1599) }
  let!(:med3) { Med.create(brand_name: 'Snow', generic_name: 'Cocaine', apis: 'Cocaine, Other', price_cents: 1999, price_currency: 'CAD') }

  describe '#find' do
    subject { Seeker.find(query) }

    it { is_expected.to eq [med2, med1] }

    context 'case insensitive' do
      let(:query) { 'generic' }

      it 'returns the same results' do
        is_expected.to eq [med2, med1]
      end
    end

    context 'nil' do
      let(:query) { nil }

      it { is_expected.to eq [] }
    end

    context 'no results' do
      let(:query) { 'test' }

      it { is_expected.to eq [] }
    end
  end

  describe '#decorate' do
    let!(:results) { Seeker.find(query) }
    let!(:decorated_results) { "[{\"id\":#{med2.id},\"brand_name\":\"Patented\",\"generic_name\":\"Generic\",\"apis\":\"Generic, Ingredients\",\"price\":\"15.99\",\"currency_symbol\":\"$\"},{\"id\":#{med1.id},\"brand_name\":\"Brand1\",\"generic_name\":\"Generic\",\"apis\":\"Generic, Other, Ingredients\",\"price\":\"17.99\",\"currency_symbol\":\"€\"}]" }
    subject { Seeker.decorate(results) }

    it { is_expected.to eq decorated_results }

    context 'nil' do
      let(:results) { nil }

      it { is_expected.to eq "[]" }
    end

    context 'no results' do
      let(:query) { 'test' }

      it { is_expected.to eq "[]" }
    end
  end
end
