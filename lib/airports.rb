# frozen_string_literal: true

require "json"
require "airports/version"
require "airports/airport"

module Airports
  def self.find_by_iata_code(iata_code)
    return unless iata_code.length == 3

    all.find { |airport| airport.iata == iata_code }
  end

  def self.find_by_icao_code(icao_code)
    return unless icao_code.length == 4

    all.find { |airport| airport.icao == icao_code }
  end

  def self.find_all_by_city_name(city_name)
    all.select { |airport| airport.city.casecmp(city_name).zero? }
  end

  def self.iata_codes
    parsed_data.keys
  end

  def self.all
    @all ||= parsed_data.values.map do |airport_data|
      airport_from_parsed_data_element(airport_data)
    end
  end

  def self.parsed_data
    @parsed_data ||= JSON.parse(data)
  end

  def self.airport_from_parsed_data_element(parsed_data_element)
    # TODO: Once we're using Ruby 2.5+, use Hash#transform_keys here to symbolize the keys
    transformed_hash = parsed_data_element.each_with_object({}) do |(k, v), hash|
      hash[k.to_sym] = v
    end

    Airport.new(**transformed_hash)
  end
  private_class_method :airport_from_parsed_data_element

  def self.data
    @data ||= File.read(data_path)
  end
  private_class_method :data

  def self.data_path
    File.expand_path("../data/airports.json", __dir__)
  end
  private_class_method :data_path
end
