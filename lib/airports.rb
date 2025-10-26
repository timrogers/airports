# frozen_string_literal: true

require "json"
require "airports/version"
require "airports/airport"

module Airports
  def self.find_by_iata_code(iata_code)
    return unless iata_code.length == 3

    all.find { _1.iata == iata_code }
  end

  def self.find_by_icao_code(icao_code)
    return unless icao_code.length == 4

    all.find { _1.icao == icao_code }
  end

  def self.find_all_by_city_name(city_name)
    all.select { _1.city.casecmp(city_name).zero? }
  end

  def self.find_all_by_country_name(country_name)
    all.select { _1.country.casecmp(country_name).zero? }
  end

  def self.iata_codes
    parsed_data.keys
  end

  def self.icao_codes
    parsed_data.values.map { _1["icao"] }
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
    transformed_hash = parsed_data_element.transform_keys(&:to_sym)

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
