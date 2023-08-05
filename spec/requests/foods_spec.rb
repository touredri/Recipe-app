# frozen_string_literal: true

require 'rails_helper'
# require 'faker'

RSpec.describe 'Food', type: :request do
  include Devise::Test::IntegrationHelpers

  before(:each) do
    @user = User.create(name: 'Law', email: 'law123@gmail.com', password: '123456',
                        password_confirmation: '123456')
    @recipe = Recipe.create(name: 'vanilla', preparation_time: 1, cooking_time: 2, description: 'One of a kind',
                            public: true, user_id: @user.id)
    @food = Food.create(name: 'beans', measurement_unit: 'percs', price: 12, quantity: 22, user_id: @user.id)
    @recipe_food = RecipeFood.create(quantity: 30, food_id: @food.id, recipe_id: @recipe.id)
  end

  describe 'GET /index' do
    it 'returns http success' do
      sign_in @user
      get foods_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      sign_in @user
      get new_food_path
      expect(response).to render_template('foods/new')
    end
  end
end
