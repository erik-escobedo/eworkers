class Api::WorkersController < ApplicationController
  respond_to :json

  def index
    @workers = Worker.includes(:skills)

    if params[:skills].present?
      @workers = @workers.with_skills(params[:skills])
    end

    respond_with @workers.limit(5)
  end
end
