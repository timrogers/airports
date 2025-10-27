# frozen_string_literal: true

require "spec_helper"
require "benchmark"

RSpec.describe "Performance" do
  describe ".find_by_iata_code" do
    it "performs lookups in constant time" do
      # Warm up
      Airports.find_by_iata_code("LHR")

      # Should be very fast with hash lookup
      time = Benchmark.measure do
        100.times { Airports.find_by_iata_code("LHR") }
      end

      # Each lookup should take less than 0.01ms (hash lookup is O(1))
      expect(time.real).to be < 0.001 # 1ms for 100 lookups = 0.01ms per lookup
    end
  end

  describe ".find_by_icao_code" do
    it "performs lookups in constant time" do
      # Warm up
      Airports.find_by_icao_code("EGLL")

      # Should be very fast with hash lookup
      time = Benchmark.measure do
        100.times { Airports.find_by_icao_code("EGLL") }
      end

      # Each lookup should take less than 0.01ms (hash lookup is O(1))
      expect(time.real).to be < 0.001 # 1ms for 100 lookups = 0.01ms per lookup
    end
  end

  describe ".icao_codes" do
    it "returns cached results on subsequent calls" do
      # First call to initialize cache
      Airports.icao_codes

      # Subsequent calls should be instant (cached)
      time = Benchmark.measure do
        100.times { Airports.icao_codes }
      end

      # Cached calls should be extremely fast
      expect(time.real).to be < 0.0001 # 0.1ms for 100 calls
    end
  end

  describe ".iata_codes" do
    it "returns keys directly from hash" do
      # Should be instant since it just returns hash keys
      time = Benchmark.measure do
        100.times { Airports.iata_codes }
      end

      # Should be fast (no iteration needed)
      expect(time.real).to be < 0.01 # 10ms for 100 calls
    end
  end
end
