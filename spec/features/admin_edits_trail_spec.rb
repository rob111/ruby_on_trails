require 'rails_helper'

feature 'admin edits trail info', %Q{
  As a signed in admin
  I want to edit a trail's information
  So different trail information will show.
} do
  scenario 'change name of trail' do
    admin = FactoryBot.create(:user, role: "admin")
    trail = FactoryBot.create(:trail, name: "Sample Trail")

    visit new_user_session_path

    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password

    click_button 'Log in'

    expect(page).to have_content('Signed in successfully.')
    expect(page).to have_content('Sign Out')

    visit trail_path(trail)
    visit edit_trail_path(trail)

    fill_in 'Name', with: 'New Trail Name'
    fill_in 'Street', with: 'New Street'
    fill_in 'City', with: 'New City'
    fill_in 'State', with: 'AK'
    fill_in 'Zip', with: '99999'
    fill_in 'Length', with: 7
    click_button 'Edit Trail'

    expect(page).to have_content('The trail was edited successfully.')

    visit edit_trail_path(trail)
    click_link 'Delete This Trail'

    expect(page).to have_content('The trail was deleted.')
  end
end
