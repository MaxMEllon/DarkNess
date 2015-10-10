require 'rails_helper'

RSpec.describe 'devise/sessions/new.html.slim', type: :view do
  before do
    FactoryGirl.create(:user, id: 100)
  end
  let(:user) { User.find_by(id: 100) }
  context 'ログイン' do
    it '失敗' do
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: 'passord'
      click_button 'SignIn'
      within first(:xpath, 'html') do
        expect(page).to have_content('メールアドレスまたはパスワードが違います。')
      end
    end
  end
end
