# frozen_string_literal: true

FactoryBot.define do
  factory :recipe_food do
    recipe
    food
    quantity { 10 }
  end
end
