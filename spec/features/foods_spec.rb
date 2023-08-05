require 'rails_helper'

RSpec.describe 'Foods', type: :feature do
  before(:each) do
    @user = User.create(name: 'Isaac', email: 'kaplan@gmail.com', password: '123456',
                        password_confirmation: '123456')
    @recipe = Recipe.create(name: 'vanilla', preparation_time: 1, cooking_time: 2, description: 'One of a kind',
                            public: true, user_id: @user.id)
    @food = Food.create(name: 'beans', measurement_unit: 'percs', price: 12, quantity: 22, user_id: @user.id)
    @recipe_food = RecipeFood.create(quantity: 30, food_id: @food.id, recipe_id: @recipe.id)

    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
  end

  describe 'Test functionality for food' do
    it 'should create a new food' do
      visit new_food_path
      fill_in 'Name', with: @food.name
      fill_in 'Measurement unit (i.e: grams)', with: @food.measurement_unit
      fill_in 'Unit price', with: @food.price
      fill_in 'Quantity', with: @food.quantity
      click_button 'Create Food'
      expect(page).to have_content(@food.name)
    end

    it 'should show text for adding new food' do
      visit new_food_path
      expect(page).to have_content('New food form')
    end

    it 'page should contain remove button' do
      visit foods_path
      expect(page).to have_content('Delete')
    end
  end
end