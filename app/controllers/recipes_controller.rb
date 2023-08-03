# frozen_string_literal: true

class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @foods = @recipe.foods
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to recipe_url(@recipe), notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recipe = current_user.recipes.find(params[:id])


    if @recipe.destroy
      respond_to do |format|
        format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      redirect_to recipes_url, notice: 'Recipe could not be destroyed.'
    end
  end

  def public_recipes
    @recipes = Recipe.includes(user, recipe_foods: :food).where(public: true).order(created_at: :desc)
  end

  def toggle_public
    @recipe = Recipe.find(params[:id])
    # authorize! :toggle_public, @recipe

    @recipe.toggle_public
    redirect_to recipe_url(@recipe)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :preparation_time, :cooking_time, :user_id)
  end
end
