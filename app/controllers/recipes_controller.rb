class RecipesController < ApplicationController

  before_action :authenticate_user!, except: [:index, :new]

  def index
    @recipes = Recipe.all
    sort_attribute = params[:sort]

    if sort_attribute
      @recipes = @recipes.order(sort_attribute)
    end
  end

  def new
    
  end

  def create
    @recipe = Recipe.create(title: params[:title],
                            user_id: current_user.id,
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




