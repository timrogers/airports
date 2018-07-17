require "json"
require "airports/version"
require "airports/airport"

module Airports
  def self.find_by_iata_code(iata_code)
    return unless iata_code.length == 3
    airport_data = parsed_data.fetch(iata_code, nil)

    return unless airport_data

    Airport.
      new(airport_data.each_with_object({}) { |(k, v), h| h[k.to_sym] = v })
  end
  
  def self.find_all_by_city(city)
    airport_data = parsed_data.values.find_all { |d| d["city"].downcase == city.downcase }
    return airport_data
  end

  def self.find_by_icao_code(icao_code)
    return unless icao_code.length == 4

    airport_data = parsed_data.values.find do |data|
      data["icao"] == icao_code
    end

    return unless airport_data

    Airport.
      new(airport_data.each_with_object({}) { |(k, v), h| h[k.to_sym] = v })
  end

  def self.iata_codes
    parsed_data.keys
  end

  def self.all
    @all ||= parsed_data.map do |_iata_code, airport_data|
      Airport.
        new(airport_data.each_with_object({}) { |(k, v), h| h[k.to_sym] = v })
    end
  end

  def self.parsed_data
    @parsed_data ||= JSON.parse(data)
  end

  def self.data
    @data ||= File.read(data_path)
  end
  private_class_method :data

  def self.data_path
    File.expand_path("../data/airports.json", __dir__)
  end
  private_class_method :data_path
end
