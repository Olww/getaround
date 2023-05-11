require_relative '../level2/rental'
require_relative 'commissions_calculation_service'

module Level3
  class Rental < Level2::Rental
    def commissions
      commissions_calculation_service.call
    end

    private

    def commissions_calculation_service
      Level3::CommissionsCalculationService.new(price, rental_days)
    end
  end
end
