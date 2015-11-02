class ProfilesController < ApplicationController
  def show
    @worker = Worker.find(params[:id])
  end
end
