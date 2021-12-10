class Api::V1::MatchesController < Api::V1::GraphitiController
  def index
    matches = MatchResource.all(params)
    respond_with(matches)
  end

  def show
    match = MatchResource.find(params)
    respond_with(match)
  end

  def create
    match = MatchResource.build(params)

    if match.save
      render jsonapi: match, status: :created
    else
      render jsonapi_errors: match
    end
  end

  def update
    match = MatchResource.find(params)

    if match.update_attributes
      render jsonapi: match
    else
      render jsonapi_errors: match
    end
  end

  def destroy
    match = MatchResource.find(params)

    if match.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: match
    end
  end
end
