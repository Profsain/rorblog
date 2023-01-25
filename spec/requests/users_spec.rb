require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    before(:each) { get '/users' }

    it 'page load successful' do
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      expect(response).to render_template('index')
    end

    it 'contains the correct text' do
      expect(response.body).to include('List all users')
    end
  end

  describe 'GET /users/:id' do
    before(:each) { get '/users/:id' }

    it 'page load successful' do
      expect(response).to have_http_status(200)
    end

    it 'renders the show template' do
      expect(response).to render_template('show')
    end

    it 'contains the correct text' do
      expect(response.body).to include('Display single user information')
    end
  end
end
