
# user1 = User.create!(username: "hey", email: 'hey@hey.com', password: 'password1')
# user2 = User.create!(username: "hi", email: 'hi@hi.com', password: 'password2')
# user3 = User.create!(username: "ho", email: 'no@no.com', password: 'password3')


trail1 = Trail.create!(name: 'First Trail', street: '123 Maple St.', city: 'Boston', state: 'MA', zip: '12345', start_latitude: '1', start_longitude: '2', length: '6', difficulty: '7', elevation: '80', user_id: 1)
trail2 = Trail.create!(name: 'Another Trail', street: '456 Elm St.', city: 'Springfield', state: 'IL', zip: '09876', start_latitude: '2', start_longitude: '4', length: '3', difficulty: '5', elevation: '45', user_id: 3)
trail3 = Trail.create!(name: 'Third Trail', street: '789 Main St.', city: 'Atlanta', state: 'GA', zip: '54321', start_latitude: '3', start_longitude: '7', length: '9', difficulty: '4', elevation: '23', user_id: 2)
