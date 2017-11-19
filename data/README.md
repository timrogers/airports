# Airport codes

Airport codes and their corresponding data.

Transform the data provided by [OpenFlights](http://openflights.org/data.html) into a JSON format so that it can be looked up by IATA airport code.

## Data Format

### Original

Fileds in the order of appearance, in the original data source

* Airport ID	Unique OpenFlights identifier for this airport.
* Name	Name of airport. May or may not contain the City name.
* City	Main city served by airport. May be spelled differently from Name.
* Country	Country or territory where airport is located.
* IATA/FAA	3-letter FAA code, for airports located in Country "United States of America". 3-letter IATA code, for all other airports. Blank if not assigned.
* ICAO	4-letter ICAO code. Blank if not assigned.
* Latitude	Decimal degrees, usually to six significant digits. Negative is South, positive is North.
* Longitude	Decimal degrees, usually to six significant digits. Negative is West, positive is East.
* Altitude	In feet.
* Timezone	Hours offset from UTC. Fractional hours are expressed as decimals, eg. India is 5.5.
* DST	Daylight savings time. One of E (Europe), A (US/Canada), S (South America), O (Australia), Z (New Zealand), N (None) or U (Unknown)

Sample entries from the database

507,"Heathrow","London","United Kingdom","LHR","EGLL",51.4775,-0.461389,83,0,"E"
26,"Kugaaruk","Pelly Bay","Canada","YBB","CYBB",68.534444,-89.808056,56,-6,"A"
3127,"Pokhara","Pokhara","Nepal","PKR","VNPK",28.200881,83.982056,2712,5.75,"N"

### Transformed

A JSON object with airport data represented as objects with IATA codes as the key. For example `"LHR": {"name": "Heathrow", "city": "London", ...}`

Sample entry

```json
{
    "altitude": "83",
    "city": "London",
    "country": "United Kingdom",
    "dst": "E",
    "iata": "LHR",
    "icao": "EGLL",
    "latitude": "51.4775",
    "longitude": "-0.461389",
    "name": "Heathrow",
    "timezone": "0"
}
```

# Credits

Big thanks to [OpenFlights](http://openflights.org) for collecting and making this data available. Check out their website for additional data about airlines, routes etc.
