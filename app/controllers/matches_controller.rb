class MatchesController < ApplicationController
  before_action :set_match, only: %i[show edit update destroy]

  def index
    @q = Match.ransack(params[:q])
    @matches = @q.result(distinct: true).includes(:recipe,
                                                  :category).page(params[:page]).per(10)
  end

  def show; end

  def new
    @match = Match.new
  end

  def edit; end

  def create
    @match = Match.new(match_params)

    if @match.save
      message = "Match was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @match, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @match.update(match_params)
      redirect_to @match, notice: "Match was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @match.destroy
    message = "Match was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to matches_url, notice: message
    end
  end

  private

  def set_match
    @match = Match.find(params[:id])
  end

  def match_params
    params.require(:match).permit(:category_id, :recipe_id)
  end
end
