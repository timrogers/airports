require 'json'
require 'airports/version'
require 'airports/airport'

module Airports
  def self.find_by_iata_code(iata_code)
    return unless iata_code.length == 3
    return unless airport_data = parsed_data.fetch(iata_code, nil)

    Airport.
      new(airport_data.each_with_object({}) { |(k,v), h| h[k.to_sym] = v })
  end

  def self.iata_codes
    parsed_data.keys
  end

  def self.all
    @all ||= parsed_data.map do |_iata_code, airport_data|
      Airport.
        new(airport_data.each_with_object({}) { |(k,v), h| h[k.to_sym] = v })
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
    File.expand_path("../../data/airports.json", __FILE__)
  end
  private_class_method :data_path
end
