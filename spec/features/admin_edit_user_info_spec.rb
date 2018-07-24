require 'rails_helper'

feature 'admin edit user info', %Q{
  As a signed in admin
  I want to edit user info
  So that I can assist users
} do
  scenario 'change username' do
    admin = FactoryBot.create(:user, role: "admin")
    user = FactoryBot.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'
    click_link 'Admin Section'
    select(admin.username, :from => 'user_username')
    click_button 'Search'

    expect(page).to have_content(admin.username)

    fill_in 'Username', with: 'usertest22'
    click_button 'Update User'

    expect(page).to have_content('User was successfully updated.')

    select('usertest22', :from => 'user_username')
    click_button 'Search'

    expect(page).to have_content('usertest22')
  end
end
