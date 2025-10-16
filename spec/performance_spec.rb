# frozen_string_literal: true

require "spec_helper"
require "benchmark"

RSpec.describe "Performance" do
  describe "find_by_iata_code performance" do
    it "performs lookups efficiently" do
      # Warm up the cache
      Airports.find_by_iata_code("LHR")

      # Measure time for 1000 lookups
      time = Benchmark.realtime do
        1000.times do
          Airports.find_by_iata_code("LHR")
          Airports.find_by_iata_code("JFK")
          Airports.find_by_iata_code("DXB")
        end
      end

      # Should be very fast with hash lookup (< 0.1 seconds for 3000 lookups)
      expect(time).to be < 0.1
    end
  end

  describe "find_by_icao_code performance" do
    it "performs lookups efficiently" do
      # Warm up the cache
      Airports.find_by_icao_code("EGLL")

      # Measure time for 1000 lookups
      time = Benchmark.realtime do
        1000.times do
          Airports.find_by_icao_code("EGLL")
          Airports.find_by_icao_code("KJFK")
          Airports.find_by_icao_code("OMDB")
        end
      end

      # Should be very fast with hash lookup (< 0.1 seconds for 3000 lookups)
      expect(time).to be < 0.1
    end
  end

  describe "icao_codes performance" do
    it "returns codes efficiently" do
      # Warm up the cache
      Airports.icao_codes

      # Measure time for 100 calls
      time = Benchmark.realtime do
        100.times do
          Airports.icao_codes
        end
      end

      # Should be very fast with cached keys (< 0.01 seconds for 100 calls)
      expect(time).to be < 0.01
    end
  end
end
