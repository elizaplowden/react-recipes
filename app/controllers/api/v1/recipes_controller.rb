class Api::V1::RecipesController < Api::V1::BaseController
  before_action :set_recipe, only: [:show]

  def index
    @recipes = policy_scope(Recipe)
  end

  def show
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
    authorize @restaurant
  end
end
