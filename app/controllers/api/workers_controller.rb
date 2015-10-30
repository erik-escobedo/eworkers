class Api::WorkersController < ApplicationController
  respond_to :json

  def index
    @workers = Worker.includes(:skills)

    if params[:skills].present?
      @workers = @workers.with_skills(params[:skills])
    end

    render json: {
      workers: @workers.limit(per_page).offset(per_page * page),
      total: @workers.length
    }
  end

  private
  def page
    (params[:page] || 0).to_i
  end

  def per_page
    (params[:per_page] || 5).to_i
  end
end
