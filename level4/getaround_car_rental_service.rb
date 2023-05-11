require_relative '../level3/getaround_car_rental_service'
require_relative 'car'
require_relative 'rental'
require 'date'
require 'json'

module Level4
  class GetaroundCarRentalService < Level3::GetaroundCarRentalService
    LEVEL = "Level4"

    private

    def generate_output
      output_data = {
          rentals: rentals.map do |rental|
            {
              id: rental.id,
              actions: rental.calculate_actions
            }
          end
      }

      File.write(@output_file_path, JSON.pretty_generate(output_data))
    end
  end
end
