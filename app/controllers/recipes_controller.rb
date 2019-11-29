class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new

    2.times do
     @recipe.ingredients.build
    end
  end

  def create
    recipe = Recipe.create(recipe_strong_params)
    redirect_to recipe_path(recipe)
  end

  def recipe_strong_params
    params.require(:recipe).permit(:title, ingredients_attributes: [:name, :quantity])
  end

end
