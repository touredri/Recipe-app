# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Recipe, type: :model do
  context 'When creating a new recipe' do
    it 'is valid with valid attributes' do
      recipe = build(:recipe)
      expect(recipe).to be_valid
    end

    it 'is not valid without a name' do
      recipe = build(:recipe)
      recipe.name = nil
      expect(recipe).not_to be_valid
    end

    it 'is not valid without a description' do
      recipe = build(:recipe)
      recipe.description = nil
      expect(recipe).not_to be_valid
    end

    it 'is not valid without a user' do
      recipe = build(:recipe)
      recipe.user = nil
      expect(recipe).not_to be_valid
    end
  end
end
