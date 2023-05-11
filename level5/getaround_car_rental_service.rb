require_relative '../level4/getaround_car_rental_service'
require_relative 'car'
require_relative 'rental'
require_relative 'option'
require 'date'
require 'json'

module Level5
  class GetaroundCarRentalService < Level4::GetaroundCarRentalService
    LEVEL = "Level5"

    attr_accessor :options

    private

    def process_input_data
      process_options(input_data['options'])
      super
    end

    def process_options(options_data)
      @options = options_data.map do |option_data|
        Option.new(
            id: option_data['id'],
            rental_id: option_data['rental_id'],
            type: option_data['type']
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
            cars,
            options
        )
      end
    end

    def generate_output
      output_data = {
          rentals: rentals.map do |rental|
            {
              id: rental.id,
              options: rental.options_list,
              actions: rental.calculate_actions
            }
          end
      }

      File.write(@output_file_path, JSON.pretty_generate(output_data))
    end
  end
end
