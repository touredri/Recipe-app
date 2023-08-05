# frozen_string_literal: true

class FoodsController < ApplicationController
  load_and_authorize_resource

  # GET /foods or /foods.json
  def index
    @foods = current_user.foods
  end

  # GET /foods/1 or /foods/1.json
  def show; end

  # GET /foods/new
  def new
    @food = Food.new
  end

  # GET /foods/1/edit
  def edit; end

  # POST /foods or /foods.json
  def create
    @food = Food.new(food_params)
    @food.user = current_user

    respond_to do |format|
      if @food.save
        format.html { redirect_to foods_url, notice: 'Food was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foods/1 or /foods/1.json
  def destroy
    @food.destroy

    respond_to do |format|
      format.html { redirect_to foods_url, notice: 'Food was successfully destroyed.' }
    end
  end

  private

  def set_food
    @food = Food.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity, :user_id)
  end
end
