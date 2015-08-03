require 'rails_helper'

RSpec.describe 'devise/sessions/new.html.slim', type: :view do
  before do
    FactoryGirl.create(:user)
    visit new_user_session_path
  end
  let(:user) { User.find_by(id: 1) }
  context 'ログイン' do
    it 'response ok' do
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: 'password'
      click_button 'Sign in'
      within first(:xpath, 'html') do
        expect(page).to have_content("ログインしました。")
      end
    end
  end
end
