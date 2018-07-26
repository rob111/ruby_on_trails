require 'rails_helper'

feature 'admin edit user info', %Q{
  As a signed in admin
  I want to edit user info
  So that I can assist users
} do
  scenario 'change username' do
    admin = FactoryBot.create(:user, role: "admin")
    user = FactoryBot.create(:user, username: "testuser")

    visit new_user_session_path

    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'
    click_link 'Admin Section'

    expect(page).to have_content(admin.username)
    expect(page).to have_content(user.email)

    click_link(user.id)

    fill_in 'Username', with: 'usertest22'
    click_button 'Update User'
    save_and_open_page


    expect(page).to have_content('User was successfully updated.')
  end
end
