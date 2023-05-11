require_relative '../level1/getaround_car_rental_service'
require_relative 'car'
require_relative 'rental'
require 'date'
require 'json'

module Level2
  class GetaroundCarRentalService < Level1::GetaroundCarRentalService
    LEVEL = "Level2"
  end
end
