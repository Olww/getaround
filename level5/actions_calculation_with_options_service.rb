require_relative '../level4/actions_calculation_service'

module Level5
  class ActionsCalculationWithOptionsService < Level4::ActionsCalculationService
    attr_reader :options

    def initialize(price, rental_days, options)
      super(price, rental_days)
      @options = options
    end

    private

    def gps_price
      options.include?("gps") ? rental_days * 500 : 0
    end

    def baby_seat_price
      options.include?("baby_seat") ? rental_days * 200 : 0
    end

    def additional_insurance_price
      options.map.include?("additional_insurance") ? rental_days * 1000 : 0
    end

    def driver_price
      (price + options_price).to_i
    end

    def owner_price
      (price - commission + gps_price + baby_seat_price).to_i
    end

    def options_price
      gps_price + baby_seat_price + additional_insurance_price
    end

    def drivy_fee
      commission - insurance_fee - assistance_fee + additional_insurance_price
    end
  end
end
