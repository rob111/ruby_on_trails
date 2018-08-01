require 'dotenv/load'
require 'httparty'

url = "https://www.hikingproject.com/data/get-trails?lat=42.3601&lon=-71.0589&key=#{ENV["HIKING_PROJECT_API_KEY"]}"
response = HTTParty.get(url)
parsed = response.parsed_response

parsed["trails"].each do |trail|
  location_info = trail["location"].split(', ')
  if location_info.length == 2
    city = location_info[0]
    state = location_info[1]
  end
  if trail["difficulty"] == "green"
    difficulty = 1
  elsif trail["difficulty"] == "greenBlue"
    difficulty = 2
  elsif trail["difficulty"] == "blue"
    difficulty = 3
  elsif trail["difficulty"] == "blueBlack"
    difficulty = 4
  else
    difficulty = 5
  end

  Trail.create!(name: trail["name"], description: trail["summary"], difficulty: difficulty, city: city, state: state, start_longitude: trail["longitude"], start_latitude: trail["latitude"], ascent: trail["ascent"], length: trail["length"], photo: trail["imgMedium"])
end
