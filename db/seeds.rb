user1 = User.create!(email: 'hey@hey.com', password: 'password1', username: 'user1')
user2 = User.create!(email: 'hi@hi.com', password: 'password2', username: 'user2')
user3 = User.create!(email: 'no@no.com', password: 'password3', username: 'user3')

trail1 = Trail.create!(name: 'First Trail', street: '123 Maple St.', city: 'Boston', state: 'MA', zip: '12345', start_latitutde: '1', start_longitude: '2', length: 6, difficulty: '7', elevation: '80', created_by: user1.id)
trail2 = Trail.create!(name: 'Another Trail', street: '456 Elm St.', city: 'Springfield', state: 'IL', zip: '09876', start_latitutde: '2', start_longitude: '4', length: 3, difficulty: '5', elevation: '45', created_by: user2.id)
trail3 = Trail.create!(name: 'Third Trail', street: '789 Main St.', city: 'Atlanta', state: 'GA', zip: '54321', start_latitutde: '3', start_longitude: '7', length: 9, difficulty: '4', elevation: '23', created_by: user3.id)
