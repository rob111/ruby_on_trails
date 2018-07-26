require 'rails_helper'

feature 'Edit user info', %Q{
  As a signed-in user,
  I want to be able to edit my user info,
  So that I can edit my profile

 } do
   scenario 'Non-authenticated user can\'t see a user\'s profile page' do
     user = FactoryBot.create(:user, username: "testuser")

     visit user_path(user)

     expect(page).to have_content("You need to sign in to access this page.")
   end

   scenario 'Signed-in member can\'t see other members\' profiles' do
     user = FactoryBot.create(:user, username: "testuser")
     user2 = FactoryBot.create(:user, username: "testuser2")


     visit new_user_session_path

     fill_in 'Email', with: user.email
     fill_in 'Password', with: user.password
     click_button 'Log in'

     visit user_path(user2)

     expect(page).to have_content("You do not have access to this page.")
   end

   scenario 'Signed-in member can\'t edit other members\' profiles' do
     user = FactoryBot.create(:user, username: "testuser")
     user2 = FactoryBot.create(:user, username: "testuser2")


     visit new_user_session_path

     fill_in 'Email', with: user.email
     fill_in 'Password', with: user.password
     click_button 'Log in'

     visit edit_user_path(user2)

     expect(page).to have_content("You do not have access to this page.")
   end

   scenario 'Signed-in member can see and edit their own page' do
     user = FactoryBot.create(:user, username: "testuser")

     visit new_user_session_path

     fill_in 'Email', with: user.email
     fill_in 'Password', with: user.password
     click_button 'Log in'

     visit user_path(user)

     expect(page).to_not have_content("You do not have access to this page.")

     visit edit_user_path(user)

     fill_in 'Username', with: 'usertest22'
     click_button 'Update User'

     expect(page).to have_content('User was successfully updated.')
   end

 end



#
#
# require 'rails_helper'
#
# feature 'admin edit user info', %Q{
#   As a signed in admin
#   I want to edit user info
#   So that I can assist users
# } do
#   scenario 'change username' do
#     admin = FactoryBot.create(:user, role: "admin")
#     user = FactoryBot.create(:user, username: "testuser")
#
#     visit new_user_session_path
#
#     fill_in 'Email', with: admin.email
#     fill_in 'Password', with: admin.password
#     click_button 'Log in'
#     click_link 'Admin Section'
#
#     expect(page).to have_content(admin.username)
#     expect(page).to have_content(user.email)
#
#     click_link(user.id)
#
#     fill_in 'Username', with: 'usertest22'
#     click_button 'Update User'
#
#     expect(page).to have_content('User was successfully updated.')
#     expect(page).to have_content('Last updated')
#     expect(page).to have_content(user.email)
#   end
# end
