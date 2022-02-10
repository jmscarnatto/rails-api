require 'rails_helper'

RSpec.describe 'Api::V1::Tokens', type: :request do
  describe 'POST /api/v1/tokens' do
#    @user = FactoryBot.build(:user)
    let(:valid_user) do
      { 'user' => { 'email' => 'bruce@wyane.com', 'password' => '12345678' } }
    end
    it 'should get JWT token' do
      # user = User.new(valid_user)
      post api_v1_tokens_url, params: valid_user
      expect(response).to have_http_status(200)
    end

#    it 'should not get JWT token' do
#      post api_v1_tokens_url, params: { user: { email: @user.email, password: 'bad_password' } }, as: :json
#      expect(response).to have_http_status(401)
#    end
  end
end
