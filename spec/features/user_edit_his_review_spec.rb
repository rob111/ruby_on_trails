require 'rails_helper'

feature 'user edits their own review', %Q{
  As a signed in user
  I want to edit my own reviews
  So that I can make it better for others
} do
  scenario 'edit trails review' do
    testuser = FactoryBot.create(:user, username: "testuser")
    trail = FactoryBot.create(:trail)

    visit new_user_session_path

    fill_in 'Email', with: testuser.email
    fill_in 'Password', with: testuser.password
    click_button 'Log in'

    visit new_trail_review_path(trail.id)
    fill_in 'Rating', with: 1
    fill_in 'Comment', with: 'Great trail'
    click_button 'Add Review'

    visit edit_trail_review_path(trail.id, trail.reviews.first.id)

    fill_in 'Rating', with: 5
    fill_in 'Comment', with: 'SUPER SUPER CLEAR AIR'
    click_button 'Edit Review'

    expect(page).to have_content('Review updated successfully')

  end

  scenario 'cannot edit review because this review created by someone else' do
    testuser = FactoryBot.create(:user, username: "testuser")
    trail = FactoryBot.create(:trail)

    visit new_user_session_path

    fill_in 'Email', with: testuser.email
    fill_in 'Password', with: testuser.password
    click_button 'Log in'

    visit new_trail_review_path(trail.id)

    fill_in 'Rating', with: 1
    fill_in 'Comment', with: 'Great trail'
    click_button 'Add Review'

    click_link 'Sign Out'

    user = FactoryBot.create(:user, username: "user")

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    visit edit_trail_review_path(trail.id, trail.reviews.first.id)

    click_button 'Edit Review'

    expect(page).to have_content('This is not your review')
  end
end
