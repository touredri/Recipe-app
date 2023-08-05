# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User', type: :request do
  include Devise::Test::IntegrationHelpers

  describe 'GET /public recipe' do
    before(:each) do
      @user = User.create(name: 'Isaac', email: 'kaplan@gmail.com', password: '123456', password_confirmation: '123456')
    end

    it 'returns http success' do
      sign_in @user
      get root_path
      expect(response).to have_http_status(:success)
    end

    it 'should render index page for public recipe' do
      sign_in @user
      get public_recipes_path
      expect(response).to render_template('recipes/public_recipes')
    end
  end

  describe 'GET /sign in' do
    it 'should render sign in page' do
      get new_user_session_path
      expect(response).to have_http_status(:success)
    end
  end
end
