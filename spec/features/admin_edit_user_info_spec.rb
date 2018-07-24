require 'rails_helper'

feature 'admin edit user info', %Q{
  As a signed in admin
  I want to edit user info
  So that I can assist users
} do
  scenario 'change username' do
    admin = User.create(username: "Admin", email: "admin@example.com", password: "000000", role: "admin")
    user = User.create(username: "usertest", email: "user@example.com", password: "000000")

    visit new_user_session_path

    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'
    click_link 'Admin Section'
    select('usertest', :from => 'user_username')
    click_button 'Search'

    expect(page).to have_content('usertest')

    fill_in 'Username', with: 'usertest22'
    click_button 'Update User'

    expect(page).to have_content('User was successfully updated.')

    select('usertest22', :from => 'user_username')
    click_button 'Search'

    expect(page).to have_content('usertest22')
  end
end
