require 'spec_helper'

RSpec.describe Airports do
  it "has a version number" do
    expect(Airports::VERSION).not_to be nil
  end

  describe ".find_by_iata_code" do
    subject(:find_by_iata_code) do
      described_class.find_by_iata_code(iata_code)
    end

    context "with a valid IATA code" do
      let(:iata_code) { "LHR" }

      it { is_expected.to be_a(Airports::Airport) }
      its(:name) { is_expected.to eq("London Heathrow Airport") }
    end

    context "with an invalid IATA code" do
      let(:iata_code) { "XOX" }

      it { is_expected.to be_nil }

      context "with a code that is too long" do
        let(:iata_code) { "ALICE" }

        it "doesn't try to look it up" do
          expect(Airports.parsed_data).not_to receive(:fetch).with(iata_code, nil)
          find_by_iata_code
        end
      end
    end
  end

  describe ".iata_codes" do
    subject { described_class.iata_codes }

    it { is_expected.to be_a(Array) }
    it { is_expected.to include("LHR") }
  end

  describe ".icao_codes" do
    subject { described_class.icao_codes }

    it { is_expected.to be_a(Array) }
    it { is_expected.to include("KCRG") }
  end

  describe ".all" do
    subject { described_class.all }

    it { is_expected.to be_a(Array) }
    its(:first) { is_expected.to be_a(Airports::Airport) }
  end

  describe ".find_by_icao_code" do
    subject(:find_by_icao_code) do
      described_class.find_by_icao_code(icao_code)
    end

    context "with a valid ICAO code" do
      let(:icao_code) { "KCRG" }

      it { is_expected.to be_a(Airports::Airport) }
      its(:name) { is_expected.to eq("Jacksonville Executive at Craig Airport") }
    end

    context "with an invalid ICAO code" do
      let(:icao_code) { "XOXO" }

      it { is_expected.to be_nil }

      context "with a code that is too long" do
        let(:icao_code) { "ALICE" }

        it "doesn't try to look it up" do
          expect(Airports.parsed_data).not_to receive(:fetch).with(icao_code, nil)
          find_by_icao_code
        end
      end
    end
  end
end
