require 'rails_helper'

RSpec.describe 'devise/sessions/new.html.slim', type: :view do
  before do
    FactoryGirl.create(:user, id: 100)
    visit new_user_session_path
  end
  let(:user) { User.find_by(id: 100) }
  context 'ログイン' do
    it '成功' do
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: 'password'
      click_button 'SignIn'
      within first(:xpath, 'html') do
        # expect(page).to have_content('')
      end
    end
  end
end
