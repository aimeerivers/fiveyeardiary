class SettingsController < ApplicationController

  before_filter :authenticate
  before_filter :load_setting

  def edit
  end

  def update
    if @setting.update_attributes(params[:setting])
      redirect_to edit_settings_url, notice: 'Settings updated successfully'
    else
      render :edit
    end
  end

  private

  def load_setting
    @setting = current_user.setting || current_user.build_setting
  end

end
