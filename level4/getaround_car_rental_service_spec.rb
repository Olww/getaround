require_relative 'getaround_car_rental_service'
require 'rspec'
require 'json'
require 'pry'

RSpec.describe Level4::GetaroundCarRentalService do
  let(:input_file_path) { 'data/input.json' }
  let(:output_file_path) { 'data/test_output.json' }
  let(:expected_output_file_path) { 'data/expected_output.json' }
  let(:service) { Level4::GetaroundCarRentalService.new(input_file_path, output_file_path) }

  after(:each) do
    File.delete('data/test_output.json') if File.exist?('data/test_output.json')
  end

  describe '#call' do
    it 'generates the correct output file' do
      service.call
      output_data = JSON.parse(File.read(output_file_path))

      expect(output_data).to eq(JSON.parse(File.read(expected_output_file_path)))
    end
  end
end
