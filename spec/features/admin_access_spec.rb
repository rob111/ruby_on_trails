require 'rails_helper'

feature 'admin access', %Q{
  As a signed in admin
  I want to see admin page
  So that I can edit other accounts
} do
  scenario 'specify admin credentials' do
    admin = User.create(username: "Admin", email: "admin@example.com", password: "000000", role: "admin")

    visit new_user_session_path

    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password

    click_button 'Log in'

    expect(page).to have_content('Admin Section')
    expect(page).to have_content('Sign Out')
  end

  scenario 'specify non-admin credentials' do
    member = User.create(username: "UserTest", email: "member@example.com", password: "000000")

    visit new_user_session_path

    fill_in 'Email', with: member.email
    fill_in 'Password', with: member.password

    click_button 'Log in'

    expect(page).to_not have_content('Admin Section')
    expect(page).to have_content('Sign Out')
  end

  scenario 'admin can access to user edit page' do
    admin = User.create(username: "Admin1", email: "admin1@example.com", password: "000000", role: "admin")

    visit new_user_session_path

    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password

    click_button 'Log in'

    click_link 'Admin Section'

    expect(page).to have_content("User To Update")
  end

  scenario 'non-admin cannot access user edit page' do
    member1 = User.create(username: "UserTest1", email: "member1@example.com", password: "000000")

    visit new_user_session_path

    fill_in 'Email', with: member1.email
    fill_in 'Password', with: member1.password

    click_button 'Log in'
    visit "/users/3"

    expect(page).to_not have_content('Admin Section')
    expect(page).to have_content('You do not have access to this page')
  end

end
