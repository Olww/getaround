require_relative '../level1/rental'

module Level2
  class Rental < Level1::Rental
    private

    def time_component
      time_component_with_discount.round
    end

    def time_component_with_discount
      case rental_days
      when 1
        car.price_per_day
      when 2..4
        car.price_per_day * (1 + 0.9 * (rental_days - 1))
      when 5..10
        car.price_per_day * (1 + 0.9 * 3 + 0.7 * (rental_days - 4))
      else
        car.price_per_day * (1 + 0.9 * 3 + 0.7 * 6 + 0.5 * (rental_days - 10))
      end
    end
  end
end
