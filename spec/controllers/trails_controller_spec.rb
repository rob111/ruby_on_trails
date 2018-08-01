require "rails_helper"

RSpec.describe Api::V1::TrailsController, type: :controller do
  describe "GET#index" do
    it "should return a list of all the trails" do
      first_trail = Trail.create!(name: 'Happy Trail', length: 5, difficulty: 5, street: '123 Main', city: 'Boston', state: 'MA', zip: '02144')
      second_trail = Trail.create!(name: 'Sad Trail', length: 5555, difficulty: 1, street: '321 Main', city: 'Boston', state: 'MA', zip: '02144')

      get :index
      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")

      expect(returned_json.length).to eq 2
      expect(returned_json[0]["name"]).to eq "Happy Trail"
      expect(returned_json[0]["difficulty"]).to eq 5

      expect(returned_json[1]["name"]).to eq "Sad Trail"
      expect(returned_json[1]["length"]).to eq '5555'
    end
  end

  describe "GET#show" do
    it "should return a single trail & reviews" do
      user = User.create(username: 'Steve', email: 'steve@stphen.com', password: '111111')
      first_trail = Trail.create!(name: 'Happy Trail', length: 5, difficulty: 5, street: '123 Main', city: 'Boston', state: 'MA', zip: '02144', created_by: 1)
      review = Review.create(rating: 5, comment: 'YO THIS TRAIL IS GREAT!', user_id: user.id, trail_id: first_trail.id)
      second_trail = Trail.create!(name: 'Sad Trail', length: 5555, difficulty: 1, street: '321 Main', city: 'Boston', state: 'MA', zip: '02144', created_by: 1)

      get :show, params: { id: first_trail.id}
      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")

      expect(returned_json.length).to eq 3
      expect(returned_json["trail"]["name"]).to eq "Happy Trail"
      expect(returned_json["trail"]["difficulty"]).to eq 5
      expect(returned_json["trail"]["created_by"]).to eq user.id
      expect(returned_json["reviews"].length).to eq 1
      expect(returned_json["reviews"][0]["comment"]).to eq 'YO THIS TRAIL IS GREAT!'
      expect(returned_json["current_user"]["id"]).to eq nil
      expect(returned_json["current_user"]["admin"]).to eq false

    end
  end
end
