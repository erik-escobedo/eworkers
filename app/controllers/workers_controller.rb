class WorkersController < Devise::RegistrationsController
  def new
    # Initialize an empty Worker for this User
    super { |user| user.build_worker }
  end

  def edit
    render 'workers/edit'
  end

  # Override this so it creates an User with an empty Worker account
  def resource_class
    User
  end

  def resource_name
    :user
  end

  def sign_up_params
    params.require(:worker).permit(
      :email, :password, :password_confirmation,
      worker_attributes: [
        :first_name, :last_name, :avatar, :phone_number,
        :latitude, :longitude, skill_ids: []
      ]
    )
  end

  def account_update_params
    params.require(:worker).permit(worker_attributes: [
      :first_name, :last_name, :avatar, :phone_number,
      :latitude, :longitude, skill_ids: []
    ])[:worker_attributes]
  end

  protected
  def update_resource(resource, params)
    resource.worker.update(params)
  end
end
