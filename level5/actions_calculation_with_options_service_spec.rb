require_relative 'actions_calculation_with_options_service'
require 'rspec'
require 'pry'

RSpec.describe Level5::ActionsCalculationWithOptionsService do
  let(:price) { 3000 }
  let(:rental_days) { 1 }
  let(:options) { ["gps", "baby_seat", "additional_insurance"] }
  let(:subject) { Level5::ActionsCalculationWithOptionsService.new(price, rental_days, options) }

  describe '#call' do
    context "when the price and rental days are correct" do
      let(:expected_actions) {
        [
            { who: "driver", type: "debit", amount: 4700 },
            { who: "owner", type: "credit", amount: 2800 },
            { who: "insurance", type: "credit", amount: 450.0 },
            { who: "assistance", type: "credit", amount: 100 },
            { who: "drivy", type: "credit", amount: 1350.0 },
        ]
      }

      it { expect(subject.call).to match_array(expected_actions) }
    end

    context "when the price and rental days are incorrect" do
      let(:price) { 1000 }
      let(:rental_days) { 10 }

      it { expect(subject.call).to eq({}) }
    end
  end
end
