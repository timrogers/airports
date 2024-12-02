# frozen_string_literal: true

require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "csv"
require "json"
require "open-uri"

RSpec::Core::RakeTask.new(:spec)

def check_for_empty_data(field)
  # OpenFlights uses "\\N" (i.e. a literal backslash followed by a capital N) to
  # indicate a null field.
  if field == "\\N"
    nil
  else
    field
  end
end

desc "Updates the airports data file based on the OpenFlights source and our patches"
task :update do
  raw_data = URI.open("https://raw.githubusercontent.com/jpatokal/openflights/master/" \
                      "data/airports.dat").read + File.read("./data/patches.dat")

  cleaned_data = raw_data.gsub('\"', '""')

  cleaned_data = CSV.parse(cleaned_data).each_with_object({}) do |row, accumulator|
    iata_code = row[4]

    # We'll skip other airports which don't have IATA codes
    next unless iata_code != "\\N"

    accumulator[iata_code] = {
      name: check_for_empty_data(row[1]),
      city: check_for_empty_data(row[2]),
      country: check_for_empty_data(row[3]),
      iata: iata_code,
      icao: check_for_empty_data(row[5]),
      latitude: check_for_empty_data(row[6]),
      longitude: check_for_empty_data(row[7]),
      altitude: check_for_empty_data(row[8]),
      timezone: check_for_empty_data(row[9]),
      dst: check_for_empty_data(row[10]),
      tz_name: check_for_empty_data(row[11]),
    }
  end

  File.open("data/airports.json", "w") do |f|
    f.write(JSON.generate(cleaned_data))
  end
end

task default: :spec
