class CategoriesController < ApplicationController
  before_action :current_chef_must_be_category_chef, only: [:edit, :update, :destroy] 

  before_action :set_category, only: [:show, :edit, :update, :destroy]

  # GET /categories
  def index
    @q = current_chef.categories.ransack(params[:q])
    @categories = @q.result(:distinct => true).includes(:chef, :recipes, :matches, :category_recipes).page(params[:page]).per(10)
  end

  # GET /categories/1
  def show
    @match = Match.new
    @recipe = Recipe.new
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  def create
    @category = Category.new(category_params)

    if @category.save
      message = 'Category was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @category, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /categories/1
  def update
    if @category.update(category_params)
      redirect_to @category, notice: 'Category was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /categories/1
  def destroy
    @category.destroy
    message = "Category was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to categories_url, notice: message
    end
  end


  private

  def current_chef_must_be_category_chef
    set_category
    unless current_chef == @category.chef
      redirect_back fallback_location: root_path, alert: "You are not authorized for that."
    end
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def category_params
      params.require(:category).permit(:category_name, :chef_id)
    end
end
