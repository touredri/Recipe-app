# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Food, type: :model do
  context 'When creating a new food' do
    it 'is valid with valid attributes' do
      user = create(:user)
      food = build(:food, user:)
      expect(food).to be_valid
    end

    it 'is not valid without a name' do
      user = create(:user)
      food = build(:food, user:)
      food.name = nil
      expect(food).not_to be_valid
    end
  end
end
