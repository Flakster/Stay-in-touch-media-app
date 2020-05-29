# rubocop:disable Metrics/BlockLength
require 'rails_helper'

RSpec.feature "Users", type: :feature do
  context 'user friendship requests' do
    before(:each) do
      u1 = User.create(name: 'User 1 test', email: 'user1@mail.com', password: '123456')
      u2 = User.create(name: 'User 2 test', email: 'user2@mail.com', password: '123456')
      u3 = User.create(name: 'User 3 test', email: 'user3@mail.com', password: '123456')
      visit root_path
      within('form') do
        fill_in 'user_email', with: 'user2@mail.com'
        fill_in 'user_password', with: '123456'
      end
      click_button 'Log in'
    end
    scenario 'user can see the friendship request link' do
      click_link 'All users'
      expect(page).to have_content('Invite to friendship')
    end
    scenario 'user can send a friendship request from the users list' do
      click_link 'All users'
      first(:link, "Invite to friendship").click
      expect(page).to have_content('Pending')
    end
    scenario 'user can send a friendship request from the user\'s profile' do
      click_link 'All users'
      first(:link, "See Profile").click
      click_link 'Invite to friendship'
      expect(page).to have_content('Pending')
    end
    scenario 'user can see a Notifications link telling how many pending requests have' do
      expect(page).to have_content('Notifications')
    end
    scenario 'user can accept a friendship request' do
      click_link 'All users'
      first(:link, "Invite to friendship").click
      click_link 'Sign out'
      click_link 'Sign in'
      within('form') do
        fill_in 'user_email', with: 'user1@mail.com'
        fill_in 'user_password', with: '123456'
      end
      click_button 'Log in'
      click_link 'Notifications'
      click_link 'Accept'
      expect(page).to have_content('Notifications (0)')
    end
    scenario 'user can reject a friendship request' do
      click_link 'All users'
      first(:link, "Invite to friendship").click
      click_link 'Sign out'
      click_link 'Sign in'
      within('form') do
        fill_in 'user_email', with: 'user1@mail.com'
        fill_in 'user_password', with: '123456'
      end
      click_button 'Log in'
      click_link 'Notifications'
      click_link 'Reject'
      expect(page).to have_content('Notifications (0)')
    end
  end

end
# rubocop:enable Metrics/BlockLength