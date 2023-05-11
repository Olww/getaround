require_relative '../level3/rental'
require_relative 'actions_calculation_service'

module Level4
  class Rental < Level3::Rental
    def calculate_actions
      actions_calculation_service.call
    end

    private

    def actions_calculation_service
      Level4::ActionsCalculationService.new(price, rental_days)
    end
  end
end
