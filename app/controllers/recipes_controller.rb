class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build(name: "1st Ingredient")
    @recipe.ingredients.build(name: "2nd Ingredient")
  end

  def create
    @recipe = Recipe.create(strong_params)
    redirect_to recipe_path(@recipe)
  end

  private

  def strong_params
    params.require(:recipe).permit(
      :title,
      ingredients_attributes: [:name, :quantity]
      )
  end
end
