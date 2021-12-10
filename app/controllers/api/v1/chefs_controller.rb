class Api::V1::ChefsController < Api::V1::GraphitiController
  def index
    chefs = ChefResource.all(params)
    respond_with(chefs)
  end

  def show
    chef = ChefResource.find(params)
    respond_with(chef)
  end

  def create
    chef = ChefResource.build(params)

    if chef.save
      render jsonapi: chef, status: :created
    else
      render jsonapi_errors: chef
    end
  end

  def update
    chef = ChefResource.find(params)

    if chef.update_attributes
      render jsonapi: chef
    else
      render jsonapi_errors: chef
    end
  end

  def destroy
    chef = ChefResource.find(params)

    if chef.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: chef
    end
  end
end
