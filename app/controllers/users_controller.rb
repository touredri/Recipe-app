# frozen_string_literal: true

class UsersController < ApplicationController
  def shopping_list
    @shopping_list = []
    all_foods = Food.all
    foods_in_recipes = Food.joins(:recipes).distinct
    all_foods.each do |food|
      @shopping_list << food unless foods_in_recipes.include?(food)
    end
    @total_item = @shopping_list.count
    @total_price = @shopping_list.sum { |food| food.price * food.quantity }
  end
end
