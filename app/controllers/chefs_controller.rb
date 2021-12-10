class ChefsController < ApplicationController
  before_action :set_chef, only: %i[show edit update destroy]

  def index
    @chefs = Chef.page(params[:page]).per(10)
  end

  def show
    @category = Category.new
  end

  def new
    @chef = Chef.new
  end

  def edit; end

  def create
    @chef = Chef.new(chef_params)

    if @chef.save
      redirect_to @chef, notice: "Chef was successfully created."
    else
      render :new
    end
  end

  def update
    if @chef.update(chef_params)
      redirect_to @chef, notice: "Chef was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @chef.destroy
    redirect_to chefs_url, notice: "Chef was successfully destroyed."
  end

  private

  def set_chef
    @chef = Chef.find(params[:id])
  end

  def chef_params
    params.require(:chef).permit(:first_name, :last_name)
  end
end
