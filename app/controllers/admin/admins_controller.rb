class Admin::AdminsController < Admin::ApplicationController

  def edit
    @admin = Admin.find(session[:admin_id])
  end

  def update
    @admin = Admin.find(params[:id])

    if @admin.authenticate(params[:admin][:old_password]) && @admin.update_attributes(params[:admin])
      redirect_to admin_setting_path, notice: 'Admin was successfully updated.'
    else
      redirect_to admin_setting_path, notice: 'Admin updated unsucessfully.'
    end
  end

end
