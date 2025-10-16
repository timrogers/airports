# frozen_string_literal: true

require "spec_helper"
require "benchmark"

# rubocop:disable RSpec/ExampleLength
RSpec.describe "Performance" do
  describe "find_by_iata_code performance" do
    it "performs lookups efficiently" do
      # Warm up the cache
      Airports.find_by_iata_code("LHR")

      # Measure time for 3000 lookups
      time = Benchmark.realtime do
        1000.times { Airports.find_by_iata_code("LHR") }
        1000.times { Airports.find_by_iata_code("JFK") }
        1000.times { Airports.find_by_iata_code("DXB") }
      end

      # Should be very fast with hash lookup (< 0.1 seconds for 3000 lookups)
      expect(time).to be < 0.1
    end
  end

  describe "find_by_icao_code performance" do
    it "performs lookups efficiently" do
      # Warm up the cache
      Airports.find_by_icao_code("EGLL")

      # Measure time for 3000 lookups
      time = Benchmark.realtime do
        1000.times { Airports.find_by_icao_code("EGLL") }
        1000.times { Airports.find_by_icao_code("KJFK") }
        1000.times { Airports.find_by_icao_code("OMDB") }
      end

      # Should be very fast with hash lookup (< 0.1 seconds for 3000 lookups)
      expect(time).to be < 0.1
    end
  end

  describe "icao_codes performance" do
    it "returns codes efficiently" do
      # Warm up the cache
      Airports.icao_codes

      # Measure time for 100 calls - should be cached
      time = Benchmark.realtime { 100.times { Airports.icao_codes } }

      # Should be very fast with cached keys (< 0.01 seconds for 100 calls)
      expect(time).to be < 0.01
    end
  end
end
# rubocop:enable RSpec/ExampleLength
