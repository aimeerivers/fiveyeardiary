class ProfilesController < ApplicationController

  before_filter :authenticate

  def edit
    @profile = current_user
  end

  def update
    @profile = current_user
    if @profile.update_attributes(params[:user])
      redirect_to edit_profile_url, notice: 'Profile updated successfully'
    else
      render :edit
    end
  end

end
