module Level1
  class Rental
    attr_reader :id, :car, :start_date, :end_date, :distance

    def initialize(attributes, cars)
      @id = attributes[:id]
      @car = cars.find { |car| car.id == attributes[:car_id] }
      @start_date = Date.parse(attributes[:start_date])
      @end_date = Date.parse(attributes[:end_date])
      @distance = attributes[:distance]
    end

    def price
      time_component + distance_component
    end

    private

    def rental_days
      (end_date - start_date).to_i + 1
    end

    def time_component
      rental_days * car.price_per_day
    end

    def distance_component
      distance * car.price_per_km
    end
  end
end
