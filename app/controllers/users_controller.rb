# frozen_string_literal: true

class UsersController < ApplicationController
  def shopping_list
    @foods = Food.all
    @recipe_foods = Food.joins(:recipes).distinct
    @shopping_list = []
    @recipe_foods.each do |recipe_food|
      @shopping_list << recipe_food
    end
    @final_list = @foods.where(id: @shopping_list.map(&:id))

    @price = @final_list.pluck(:price)
    @quantity = @final_list.pluck(:quantity)
    @total = @price.zip(@quantity).map { |x, y| x * y }.sum
  end
end
