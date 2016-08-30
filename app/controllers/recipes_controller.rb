class RecipesController < ApplicationController
  def one
    @recipe = Recipe.find(1)
  end

  def all
    @recipes = Recipe.all
  end
end
