require_relative 'car'
require_relative 'rental'
require 'date'
require 'json'

module Level1
  class GetaroundCarRentalService
    LEVEL = "Level1"

    attr_accessor :cars, :input_file_path, :output_file_path, :rentals

    def initialize(input_file_path, output_file_path)
      @input_file_path = input_file_path
      @output_file_path = output_file_path
    end

    def call
      process_input_data
      generate_output
    end

    private

    def input_data
      @input_data ||= JSON.parse(File.read(input_file_path))
    end

    def level_module
      @level_module ||= Module.const_get(self.class::LEVEL)
    end

    def process_input_data
      process_cars(input_data['cars'])
      process_rentals(input_data['rentals'])
    end

    def process_cars(cars_data)
      @cars = cars_data.map do |car_data|
        level_module::Car.new(id: car_data['id'],
                              price_per_day: car_data['price_per_day'],
                              price_per_km: car_data['price_per_km']
        )
      end
    end

    def process_rentals(rentals_data)
      @rentals = rentals_data.map do |rental_data|
        level_module::Rental.new(
            {
                id: rental_data['id'],
                car_id: rental_data['car_id'],
                start_date: rental_data['start_date'],
                end_date: rental_data['end_date'],
                distance: rental_data['distance']
            },
            cars
        )
      end
    end

    def generate_output
      output_data = {
          rentals: rentals.map do |rental|
            {
              id: rental.id,
              price: rental.price
            }
          end
      }

      File.write(output_file_path, JSON.pretty_generate(output_data))
    end
  end
end
