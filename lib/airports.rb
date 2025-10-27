# frozen_string_literal: true

require "json"
require "airports/version"
require "airports/airport"

module Airports
  def self.find_by_iata_code(iata_code)
    return unless iata_code.length == 3

    airport_data = parsed_data[iata_code]
    return unless airport_data

    airport_from_parsed_data_element(airport_data)
  end

  def self.find_by_icao_code(icao_code)
    return unless icao_code.length == 4

    airport_data = icao_index[icao_code]
    return unless airport_data

    airport_from_parsed_data_element(airport_data)
  end

  def self.find_all_by_city_name(city_name)
    normalized_city = city_name.downcase
    (city_index[normalized_city] || []).map do |airport_data|
      airport_from_parsed_data_element(airport_data)
    end
  end

  def self.find_all_by_country_name(country_name)
    normalized_country = country_name.downcase
    (country_index[normalized_country] || []).map do |airport_data|
      airport_from_parsed_data_element(airport_data)
    end
  end

  def self.iata_codes
    parsed_data.keys
  end

  def self.icao_codes
    @icao_codes ||= parsed_data.values.map { |airport_data| airport_data["icao"] }
  end

  def self.all
    @all ||= parsed_data.values.map do |airport_data|
      airport_from_parsed_data_element(airport_data)
    end
  end

  def self.parsed_data
    @parsed_data ||= JSON.parse(data)
  end

  def self.icao_index
    @icao_index ||= parsed_data.values.each_with_object({}) do |airport_data, index|
      index[airport_data["icao"]] = airport_data
    end
  end
  private_class_method :icao_index

  def self.city_index
    @city_index ||= parsed_data.values.each_with_object(Hash.new { |h, k| h[k] = [] }) do |airport_data, index|
      normalized_city = airport_data["city"].downcase
      index[normalized_city] << airport_data
    end
  end
  private_class_method :city_index

  def self.country_index
    @country_index ||= parsed_data.values.each_with_object(Hash.new { |h, k| h[k] = [] }) do |airport_data, index|
      normalized_country = airport_data["country"].downcase
      index[normalized_country] << airport_data
    end
  end
  private_class_method :country_index

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
