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

task :update do
  raw_data = open("https://raw.githubusercontent.com/jpatokal/openflights/master/data/" \
                  "airports.dat").read
  cleaned_data = raw_data.gsub(/\\"/, '""')

  cleaned_data = CSV.parse(cleaned_data).each_with_object({}) do |row, accumulator|
    # Doha is missing its IATA code, for some reason 🙄
    iata_code = row[5] == "OTBD" ? "DOH" : row[4]

    if iata_code != "\\N"
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
  end

  # Hyderabad (HYD) is missing, so add it in
  cleaned_data["HYD"] = {
    name: "Rajiv Gandhi International Airport",
    city: "Hyderabad",
    country: "India",
    iata: "HYD",
    icao: "VOHS",
    latitude: "17.2403",
    longitude: "78.4294",
    altitude: nil,
    timezone: "N",
    dst: "5.5",
    tz_name: "Asia/Calcutta"
  }

  cleaned_data = cleaned_data.reject { |code, _| code.nil? || code == "" }

  File.open("data/airports.json", "w").puts JSON.generate(cleaned_data)
end

task default: :spec
