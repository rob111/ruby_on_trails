require 'rails_helper'

feature 'user adds a new trail', %Q{
  As a signed user
  I want to add a new review for a trail
  So that I can share my experience
} do
  scenario 'navigate to new review form' do
    user = FactoryBot.create(:user, username: "testuser")
    trail = Trail.create!(name: 'First Trail', street: '123 Maple St.', city: 'Boston', state: 'MA', zip: '12345', start_latitude: '1', start_longitude: '2', length: '6', difficulty: '7', elevation: '80', user_id: user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    # save_and_open_page
    click_button 'Log in'

    visit new_trail_review_path(trail.id)
    fill_in 'Rating', with: 1
    fill_in 'Comment', with: 'Great trail'
    click_button 'Add Review'

    count = Trail.find(trail.id).reviews.length

    expect(page).to have_content('Review added successfully')
    expect(count).to equal(1)
  end

  scenario 'user cannot add a review without signing in' do
    user = FactoryBot.create(:user, username: "testuser")
    trail = Trail.create!(name: 'First Trail', street: '123 Maple St.', city: 'Boston', state: 'MA', zip: '12345', start_latitude: '1', start_longitude: '2', length: '6', difficulty: '7', elevation: '80', user_id: user)

    visit new_trail_review_path(trail.id)

    expect(page).to have_content('You do not have access to this page.')
  end
end
