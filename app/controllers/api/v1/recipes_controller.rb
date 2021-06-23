class Api::V1::RecipesController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]
  before_action :set_recipe, only: [ :show, :update ]

  def index
    @recipes = policy_scope(Recipe)
  end

  def show
  end

  def update
    if @recipe.update(recipe_params)
      render :show
    else
      render_error
    end
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    authorize @recipe
    if @recipe.save
      render :show, status: :created
    else
      render_error
    end
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
    authorize @recipe
  end

  def recipe_params
    params.require(:recipe).permit(:name, :description, :ingredients, :cuisine, :meal, :cook_time, :serves)
  end

  def render_error
    render json: { errors: @recipe.errors.full_messages },
    status: :unprocessable_entity
  end
end
