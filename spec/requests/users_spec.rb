require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before { get '/users' }
    it 'check if response status is correct' do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'index' template" do
      expect(response).to render_template('index')
    end
    it 'body has the correct text' do
      expect(response.body).to include('Number of posts')
    end
  end

  describe 'GET /index/id' do
    before { get '/users/1' }
    it 'check if response status is correct' do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'show' template" do
      expect(response).to render_template('show')
    end
    it 'body has the correct text' do
      expect(response.body).to include('This will be show content for user')
    end
  end
end
