require 'dotenv/load'

# user1 = User.create!(email: 'hey@hey.com', password: 'password1', username: 'user1')
# user2 = User.create!(email: 'hi@hi.com', password: 'password2', username: 'user2')
# user3 = User.create!(email: 'no@no.com', password: 'password3', username: 'user3')
# user4 = User.create!(username: "ADMIN", email: 'admin@gmail.com', password: '111111', role: 'admin')

#
# trail1 = Trail.create!(name: 'First Trail', street: '123 Maple St.', city: 'Boston', state: 'MA', zip: '12345', start_latitude: '1', start_longitude: '2', length: '6', difficulty: '7', elevation: '80')
# trail2 = Trail.create!(name: 'Another Trail', street: '456 Elm St.', city: 'Springfield', state: 'IL', zip: '09876', start_latitude: '2', start_longitude: '4', length: '3', difficulty: '5', elevation: '45')
# trail3 = Trail.create!(name: 'Third Trail', street: '789 Main St.', city: 'Atlanta', state: 'GA', zip: '54321', start_latitude: '3', start_longitude: '7', length: '9', difficulty: '4', elevation: '23')
#
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

  # binding.pry
  Trail.create!(name: trail["name"], description: trail["summary"], difficulty: difficulty, city: city, state: state, start_longitude: trail["longitude"], start_latitude: trail["latitude"], ascent: trail["ascent"], length: trail["length"], photo: trail["imgMedium"])
end
