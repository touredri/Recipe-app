# frozen_string_literal: true

json.array! @recipe_foods, partial: 'recipe_foods/recipe_food', as: :recipe_food
