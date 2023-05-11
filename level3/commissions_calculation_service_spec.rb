require_relative 'commissions_calculation_service'
require 'rspec'
require 'pry'

RSpec.describe Level3::CommissionsCalculationService do
  let(:price) { 3000 }
  let(:rental_days) { 1 }
  let(:subject) { Level3::CommissionsCalculationService.new(price, rental_days) }

  describe '#call' do
    context "when the price and rental days are correct" do
      it { expect(subject.call).to eq({ :assistance_fee=>100, :drivy_fee=>350, :insurance_fee=>450 }) }
    end

    context "when the price and rental days are incorrect" do
      let(:price) { 1000 }
      let(:rental_days) { 10 }

      it { expect(subject.call).to eq({}) }
    end
  end
end
