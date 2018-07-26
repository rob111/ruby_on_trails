require 'rails_helper'

feature 'admin access', %Q{
  As a signed in admin
  I want to see admin page
  So that I can edit other accounts
} do
  scenario 'specify admin credentials' do
    admin = FactoryBot.create(:user, role: "admin")

    visit new_user_session_path

    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password

    click_button 'Log in'

    expect(page).to have_content('Admin Section')
    expect(page).to have_content('Sign Out')
  end

  scenario 'specify non-admin credentials' do
    member = FactoryBot.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: member.email
    fill_in 'Password', with: member.password

    click_button 'Log in'

    expect(page).to_not have_content('Admin Section')
    expect(page).to have_content('Sign Out')
  end

  scenario 'admin can access to user edit page' do
    admin1 = FactoryBot.create(:user, role: "admin")

    visit new_user_session_path

    fill_in 'Email', with: admin1.email
    fill_in 'Password', with: admin1.password

    click_button 'Log in'

    click_link 'Admin Section'

    expect(page).to have_content("Edit")
    expect(page).to have_content(admin1.email)
  end

  scenario 'non-admin cannot access other user\'s edit page' do
    member1 = FactoryBot.create(:user)
    member2 = FactoryBot.create(:user)


    visit new_user_session_path

    fill_in 'Email', with: member1.email
    fill_in 'Password', with: member1.password

    click_button 'Log in'
    visit "/users/#{member2.username}/edit"

    expect(page).to_not have_content('Admin Section')
    expect(page).to have_content('You do not have access to this page')
  end

end
