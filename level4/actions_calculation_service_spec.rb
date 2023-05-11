require_relative 'actions_calculation_service'
require 'rspec'
require 'pry'

RSpec.describe Level4::ActionsCalculationService do
  let(:price) { 3000 }
  let(:rental_days) { 1 }
  let(:subject) { Level4::ActionsCalculationService.new(price, rental_days) }

  describe '#call' do
    context "when the price and rental days are correct" do
      let(:expected_actions) {
        [
            { who: "driver", type: "debit", amount: 3000 },
            { who: "owner", type: "credit", amount: 2100.0 },
            { who: "insurance", type: "credit", amount: 450.0 },
            { who: "assistance", type: "credit", amount: 100 },
            { who: "drivy", type: "credit", amount: 350.0 },

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
