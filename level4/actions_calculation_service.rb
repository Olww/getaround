require_relative '../level3/commissions_calculation_service'

module Level4
  class ActionsCalculationService < Level3::CommissionsCalculationService
    private

    def data
      [
          { who: 'driver', type: 'debit', amount: driver_price },
          { who: 'owner', type: 'credit', amount: owner_price },
          { who: 'insurance', type: 'credit', amount: insurance_fee },
          { who: 'assistance', type: 'credit', amount: assistance_fee },
          { who: 'drivy', type: 'credit', amount: drivy_fee }
      ]
    end

    def driver_price
      price
    end

    def owner_price
      (price - commission).to_i
    end
  end
end
