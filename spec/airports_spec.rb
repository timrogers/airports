# frozen_string_literal: true

require "spec_helper"

RSpec.describe Airports do
  it "has a version number" do
    expect(Airports::VERSION).to_not be nil
  end

  describe "patches" do
    subject(:find_by_iata_code) do
      described_class.find_by_iata_code(iata_code)
    end

    context "applies to existing values" do
      let(:iata_code) { "IST" }

      its(:tz_name) { is_expected.to eq("Europe/Istanbul") }
    end

    context "adds new entries" do
      let(:iata_code) { "BER" }

      its(:name) { is_expected.to eq("Berlin Brandenburg Airport") }
    end
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
    end

    context "with a code that is too long" do
      let(:iata_code) { "ALICE" }

      it "doesn't try to look it up" do
        expect(described_class.parsed_data).to_not receive(:fetch).with(iata_code, nil)
        find_by_iata_code
      end
    end
  end

  describe ".iata_codes" do
    subject { described_class.iata_codes }

    it { is_expected.to be_a(Array) }
    it { is_expected.to include("LHR") }
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
    end

    context "with a code that is too long" do
      let(:icao_code) { "ALICE" }

      it { is_expected.to be_nil }
    end
  end

  describe ".find_all_by_city_name" do
    subject(:find_all_by_city_name) do
      described_class.find_all_by_city_name(city_name)
    end

    context "with a city name that has matches" do
      let(:city_name) { "London" }

      its(:length) { is_expected.to eq(7) }
    end

    context "with a city name that has matches, apart from case" do
      let(:city_name) { "lOnDoN" }

      its(:length) { is_expected.to eq(7) }
    end

    context "with a non-matching city name" do
      let(:city_name) { "Asgard" }

      it { is_expected.to be_empty }
    end
  end
end
