
# user1 = User.create!(username: "hey", email: 'hey@hey.com', password: 'password1')
# user2 = User.create!(username: "hi", email: 'hi@hi.com', password: 'password2')
# user3 = User.create!(username: "ho", email: 'no@no.com', password: 'password3')

# trail1 = Trail.create(name: 'First Trail', street: '123 Maple St.', city: 'Boston', state: 'MA', zip: '12345', start_latitutde: '1', start_longitude: '2', length: '6 miles', difficulty: '7', elevation: '80', user: user1)
# trail2 = Trail.create(name: 'Another Trail', street: '456 Elm St.', city: 'Springfield', state: 'IL', zip: '09876', start_latitutde: '2', start_longitude: '4', length: '3 miles', difficulty: '5', elevation: '45', user: user2)
# trail3 = Trail.create(name: 'Third Trail', street: '789 Main St.', city: 'Atlanta', state: 'GA', zip: '54321', start_latitutde: '3', start_longitude: '7', length: '9 miles', difficulty: '4', elevation: '23', user: user3)

user1 = User.create!(username: "ADMIN", email: 'admin@gmail.com', password: '111111', role: 'admin')
