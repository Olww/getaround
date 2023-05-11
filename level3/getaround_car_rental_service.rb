require_relative '../level2/getaround_car_rental_service'
require_relative 'car'
require_relative 'rental'
require 'date'
require 'json'

module Level3
  class GetaroundCarRentalService < Level2::GetaroundCarRentalService
    LEVEL = "Level3"

    private

    def generate_output
      output_data = {
          rentals: rentals.map do |rental|
            {
              id: rental.id,
              price: rental.price,
              commission: rental.commissions
            }
          end
      }

      File.write(@output_file_path, JSON.pretty_generate(output_data))
    end
  end
end
