require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /posts' do
    before(:example) { get '/users/:user_id/posts' }

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the index template' do
      expect(response).to render_template('index')
    end

    it 'contains the correct text' do
      expect(response.body).to include('List all posts')
    end
  end

  describe 'GET /users/:user_id/posts/:id' do
    before(:example) { get '/users/:user_id/posts/:id' }

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the show template' do
      expect(response).to render_template('show')
    end

    it 'contains the correct text' do
      expect(response.body).to include('Single post page')
    end
  end
end
