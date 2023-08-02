# frozen_string_literal: true

class RecipeFoodsController < ApplicationController
  # GET /recipe_foods/new
  def new
    @recipe_food = Recipe.find(params[:recipe_id])
    @foods = Food.all
    @recipe_food = @recipe.recipe_foods.new
  end

  # POST /recipe_foods or /recipe_foods.json
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.new(recipe_food_params)

    respond_to do |format|
      if @recipe_food.save
        format.html { redirect_to recipe_food_url(@recipe_food), notice: 'Ingredient was successfully added.' }
        format.json { render :show, status: :created, location: @recipe_food }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe_food.errors, status: :unprocessable_entity }
        render :new
      end
    end
  end

  # DELETE /recipe_foods/1 or /recipe_foods/1.json
  def destroy
    @recipe_food = RecipeFood.find(params[:id])

    if @recipe_food.destroy
      respond_to do |format|
        format.html { redirect_to recipe_foods_url, notice: 'Ingredient was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      redirect_to recipe_foods_url, notice: 'Ingredient was not destroyed.'
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def recipe_food_params
    params.fetch(:recipe_food, {})
  end
end
