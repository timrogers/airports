# frozen_string_literal: true

require "spec_helper"
require "benchmark"

RSpec.describe "Performance" do
  describe ".find_by_iata_code" do
    it "performs lookups efficiently" do
      # Warmup
      Airports.find_by_iata_code("LHR")

      time = Benchmark.measure do
        1000.times { Airports.find_by_iata_code("LHR") }
      end

      # Should complete 1000 lookups in under 0.1 seconds
      expect(time.real).to be < 0.1
    end
  end

  describe ".find_by_icao_code" do
    it "performs lookups efficiently" do
      # Warmup
      Airports.find_by_icao_code("EGLL")

      time = Benchmark.measure do
        1000.times { Airports.find_by_icao_code("EGLL") }
      end

      # Should complete 1000 lookups in under 0.1 seconds
      expect(time.real).to be < 0.1
    end
  end

  describe ".find_all_by_city_name" do
    it "performs searches efficiently" do
      # Warmup
      Airports.find_all_by_city_name("London")

      time = Benchmark.measure do
        100.times { Airports.find_all_by_city_name("London") }
      end

      # Should complete 100 searches in under 0.1 seconds
      expect(time.real).to be < 0.1
    end
  end

  describe ".find_all_by_country_name" do
    it "performs searches efficiently" do
      # Warmup
      Airports.find_all_by_country_name("United Kingdom")

      time = Benchmark.measure do
        100.times { Airports.find_all_by_country_name("United Kingdom") }
      end

      # Should complete 100 searches in under 0.2 seconds
      expect(time.real).to be < 0.2
    end
  end

  describe ".icao_codes" do
    it "performs efficiently with memoization" do
      # Warmup
      Airports.icao_codes

      time = Benchmark.measure do
        100.times { Airports.icao_codes }
      end

      # Should complete 100 calls in under 0.01 seconds (thanks to memoization)
      expect(time.real).to be < 0.01
    end
  end
end
