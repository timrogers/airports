# frozen_string_literal: true

require "spec_helper"
require "benchmark"

RSpec.describe "Performance" do
  # These tests verify that the key lookup methods perform efficiently
  # with a large dataset (6000+ airports).
  #
  # Performance expectations:
  # - find_by_iata_code should be O(1) hash lookup
  # - find_by_icao_code should be O(1) hash lookup
  # - icao_codes should be cached after first call

  describe ".find_by_iata_code" do
    it "performs efficiently with hash lookup" do
      # Warm up
      Airports.find_by_iata_code("LHR")

      time = Benchmark.measure do
        1000.times { Airports.find_by_iata_code("LHR") }
      end

      # Should complete 1000 lookups in under 0.1 seconds (O(1) hash lookup)
      expect(time.real).to be < 0.1
    end
  end

  describe ".find_by_icao_code" do
    it "performs efficiently with hash lookup" do
      # Warm up
      Airports.find_by_icao_code("EGLL")

      time = Benchmark.measure do
        1000.times { Airports.find_by_icao_code("EGLL") }
      end

      # Should complete 1000 lookups in under 0.1 seconds (O(1) hash lookup)
      expect(time.real).to be < 0.1
    end
  end

  describe ".icao_codes" do
    it "caches the result after first call" do
      # Warm up
      Airports.icao_codes

      time = Benchmark.measure do
        100.times { Airports.icao_codes }
      end

      # Should complete 100 calls in under 0.01 seconds (cached result)
      expect(time.real).to be < 0.01
    end
  end
end
