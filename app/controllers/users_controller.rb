# frozen_string_literal: true

class UsersController < ApplicationController
  def shopping_list
    @all_recipes = Recipe.all
  end
end
