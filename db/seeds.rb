require 'httparty'
require 'open-uri'
#
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

  photo = trail["imgMedium"]
  t = Trail.new(name: trail["name"], description: trail["summary"], difficulty: difficulty, city: city, state: state, start_longitude: trail["longitude"], start_latitude: trail["latitude"], ascent: trail["ascent"], length: trail["length"], low_elevation: trail["low"], high_elevation: trail["high"])
  t.remote_photo_url = photo
  t.save
end

t1 = Trail.new(name: "Tully Lake Loop", description: "A great beginner trail with some technical singletrack.", difficulty: 2, city: "Royalston", state: "Massachusetts", start_longitude: "-72.2227", start_latitude: "42.6445", ascent: 335, length: 4.7, low_elevation: 639, high_elevation: 836)
t1.remote_photo_url = "https://cdn-files.apstatic.com/hike/7034611_medium_1501638149.jpg"
t1.save

t2 = Trail.new(name: "Mt. Norwottock Loop", description: "A fun trail with a great view north and east at the summit.", difficulty: 3, city: "South Amherst", state: "Massachusetts", start_longitude: "-72.5282", start_latitude: "42.3052", ascent: 726, length: 3.4, low_elevation: 446, high_elevation: 1086)
t2.remote_photo_url = "https://cdn-files.apstatic.com/hike/7035935_medium_1503591271.jpg"
t2.save
