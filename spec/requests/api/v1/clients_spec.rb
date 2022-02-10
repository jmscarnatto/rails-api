require 'rails_helper'

RSpec.describe "Api::V1::Clients", type: :request do
  describe "GET /api/v1/clients" do
    it "should give a unauthorized response" do
      get '/api/v1/clients/index'
      expect(response).to have_http_status(403)
    end
    it "should give a unauthorized response" do
      headers = { 'Authorization' => 'Bearer fdgfjdgfjhgdsfjhgdsfjgdfjhg' }
      # { 'user' => { 'email' => 'bruce@wyane.com', 'password' => '12345678' } },
      post '/api/v1/clients/index',  headers: headers
      expect(response).to have_http_status(403)
    end
    it 'should give a success response' do
      headers['Authorization'] = 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJleHAiOjE2MzE4OTcwNjJ9.5uIEJezXgSzUURYxEUI_6sGCAAi8QAIoDxw6gDwtGdA'
      headers['params'] = { 'user' => { 'email' => 'bruce@wyane.com', 'password' => '12345678' } }
      post '/api/v1/clients/index', headers: headers
      expect(response).to have_http_status(200)
    end
  end
end
