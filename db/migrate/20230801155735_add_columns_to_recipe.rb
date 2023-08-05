# frozen_string_literal: true

class AddColumnsToRecipe < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :preparation_time, :decimal
    add_column :recipes, :cooking_time, :decimal
  end
end
