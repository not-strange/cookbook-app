class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    
  end

  def create
    @recipe = Recipe.create(title: params[:title],
                            chef: params[:chef],
                            prep_time: params[:prep_time],
                            ingredients: params[:ingredients],
                            directions: params[:directions])

    flash[:success] = "New Recipe Created"
    redirect_to "/recipes/#{@recipe.id}"
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(title: params[:title],
                   prep_time: params[:prep_time],
                   chef: params[:chef],
                   ingredients: params[:ingredients],
                   directions: params[:directions])

    flash[:success] = "Recipe Updated"
    redirect_to "/recipes/#{@recipe.id}"
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    flash[:warning] = "And.... It's Gone."
    redirect_to '/recipes'
  end
end




