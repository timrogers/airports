module Airports
  class Airport
    attr_reader :name, :city, :country, :iata, :icao, :latitude, :longitude,
                :altitude, :timezone, :dst

    def initialize(name:, city:, country:, iata:, icao:, latitude:, longitude:,
                   altitude:, timezone:, dst:)
      @name = name
      @city = city
      @country = country
      @iata = iata
      @icao = icao
      @latitude = latitude
      @longitude = longitude
      @altitude = altitude
      @timezone = timezone
      @dst = dst
    end
  end
end
