# frozen_string_literal: true

require "spec_helper"
require "benchmark"

RSpec.describe "Performance" do
  describe "IATA code lookups" do
    it "performs well for valid codes" do
      result = Benchmark.measure do
        1000.times { Airports.find_by_iata_code("LHR") }
      end
      
      expect(result.real).to be < 0.1 # Should complete in under 100ms
    end

    it "performs well for invalid codes" do
      result = Benchmark.measure do
        1000.times { Airports.find_by_iata_code("XXX") }
      end
      
      expect(result.real).to be < 0.1 # Should complete in under 100ms
    end
  end

  describe "ICAO code lookups" do
    it "performs well for valid codes" do
      result = Benchmark.measure do
        1000.times { Airports.find_by_icao_code("EGLL") }
      end
      
      expect(result.real).to be < 0.1 # Should complete in under 100ms
    end

    it "performs well for invalid codes" do
      result = Benchmark.measure do
        1000.times { Airports.find_by_icao_code("XXXX") }
      end
      
      expect(result.real).to be < 0.1 # Should complete in under 100ms
    end
  end

  describe ".icao_codes" do
    it "performs well with caching" do
      # Warm up the cache
      Airports.icao_codes
      
      result = Benchmark.measure do
        100.times { Airports.icao_codes }
      end
      
      expect(result.real).to be < 0.01 # Should complete in under 10ms
    end
  end
end
