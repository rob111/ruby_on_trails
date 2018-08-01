require 'rails_helper'

feature 'user adds a new trail', %Q{
  As a signed user
  I want to add a new review for a trail
  So that I can share my experience
} do
  scenario 'navigate to new review form' do
    user = FactoryBot.create(:user, username: "testuser")
    trail = FactoryBot.create(:trail)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log In'

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
    trail = FactoryBot.create(:trail)

    visit new_trail_review_path(trail.id)

    expect(page).to have_content('You do not have access to this page.')
  end
end
