require "csv"
require "json"

airport_data = {}

data = File.read("airports.dat").gsub(/\\"/,'""')

CSV.parse(data) do |row|
  airport_data[row[4]] = {
    :name => row[1],
    :city => row[2],
    :country => row[3],
    :iata => row[4],
    :icao => row[5],
    :latitude => row[6],
    :longitude => row[7],
    :altitude => row[8],
    :timezone => row[9],
    :dst => row[10]
  }
end

File.open("airports.json", "w").puts JSON.generate(airport_data)
