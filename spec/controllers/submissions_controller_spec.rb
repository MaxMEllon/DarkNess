require 'rails_helper'

RSpec.describe SubmissionsController, type: :controller do
  context 'アクセステスト' do
    describe 'GET #new' do
      it 'return http success' do
        get :new
        expect(response).to have_http_status(:success)
      end
    end
  end
end
