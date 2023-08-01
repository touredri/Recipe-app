class RemoveColumnsFromRecipe < ActiveRecord::Migration[7.0]
  def change
    remove_column :recipes, :preparation_time, :date
    remove_column :recipes, :cooking_time, :date
  end
end
