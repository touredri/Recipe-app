# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  before do
    User.destroy_all
  end
  context 'When creating a new recipe_food' do
    it 'is valid with valid attributes' do
      recipe_food = build(:recipe_food)
      expect(recipe_food).to be_valid
    end

    it 'is not valid without a recipe' do
      recipe_food = build(:recipe_food)
      recipe_food.recipe = nil
      expect(recipe_food).not_to be_valid
    end

    it 'is not valid without a food' do
      recipe_food = build(:recipe_food)
      recipe_food.food = nil
      expect(recipe_food).not_to be_valid
    end

    it 'is not valid without a quantity' do
      recipe = create(:recipe)
      food = create(:food)
      recipe_food = build(:recipe_food, recipe:, food:)
      recipe_food.quantity = nil
      expect(recipe_food).not_to be_valid
    end
  end
end
