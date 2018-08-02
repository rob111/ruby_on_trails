require 'rails_helper'

feature 'user adds a new trail', %Q{
  As a signed user
  I want to add new trail
  So that I can share what I know about this trail
} do
  scenario 'navigate to new trails form' do
    user = FactoryBot.create(:user, username: "testuser")

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log In'
    click_link 'Add New Trail'

    expect(page).to have_content('Add New Trail')
    expect(page).to_not have_content('You need to log in first.')
  end

  scenario 'user cannot see Trails Form Page without log in' do

    visit new_trail_path

    expect(page).to have_content("You must be logged in to view that page.")
    expect(page).to_not have_content("Add New Trail")
  end

  scenario 'user successfully added a trail and redirect to index page' do
    user = FactoryBot.create(:user, username: "trailtestuser");

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log In'
    click_link 'Add New Trail'


    fill_in 'Name', with: 'Boston21 Trail'
    fill_in 'Street', with: '123 Main St.'
    fill_in 'City', with: 'Boston'
    fill_in 'State', with: 'MA'
    fill_in 'Zip', with: '12345'
    fill_in 'Start latitude', with: '1'
    fill_in 'Start longitude', with: '2'
    fill_in 'Length', with: '6'
    fill_in 'Difficulty', with: '5'
    fill_in 'Description', with: '80'
    fill_in 'Ascent', with: '8000'
    fill_in 'Low elevation', with: '180'
    fill_in 'High elevation', with: '880'

    click_button 'Add Trail'

    expect(page).to have_content('Trail added successfully')

  end
end
