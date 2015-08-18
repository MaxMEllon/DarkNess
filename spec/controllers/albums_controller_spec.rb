require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
  context 'アクセステスト' do
    describe 'GET #new' do
      before do
        @user = FactoryGirl.create(:user)
      end
      it 'return http success' do
        sign_in @user
        get :new
        expect(response).to have_http_status(:success)
      end
      it 'return http success' do
        sign_in @user
        get :list
        expect(response).to have_http_status(:success)
      end
    end
  end
end
