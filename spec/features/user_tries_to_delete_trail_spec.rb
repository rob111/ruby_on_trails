require 'rails_helper'

feature 'user tries to delete trail', %Q{
  As a signed in non-admin user
  I do not want to be able to delete a trail
  Because only admins should be able to delete trails.
} do
  scenario 'try to delete trail' do
    user = FactoryBot.create(:user)
    trail = FactoryBot.create(:trail, name: "Sample Trail")

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    expect(page).to have_content('Signed in successfully.')
    expect(page).to have_content('Sign Out')

    visit trail_path(trail)

    expect(page).to_not have_content('Delete This Trail')
  end
end
