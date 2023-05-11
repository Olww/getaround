require_relative '../level4/rental'
require_relative 'actions_calculation_with_options_service'

module Level5
  class Rental < Level4::Rental
    attr_reader :options

    def initialize(attributes, cars, options)
      super(attributes, cars)
      @options = options.select { |option| option.rental_id == attributes[:id] }
    end

    def calculate_actions
      actions_calculation_service.call
    end

    def options_list
      options.map(&:type)
    end

    private

    def actions_calculation_service
      Level5::ActionsCalculationWithOptionsService.new(price, rental_days, options_list)
    end
  end
end
