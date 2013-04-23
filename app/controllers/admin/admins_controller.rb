class Admin::AdminsController < Admin::ApplicationController
  layout 'admin'

  def edit
    @admin = current_user
  end

  def update
    @admin = Admin.find(params[:id])

    if @admin.authenticate(params[:admin][:old_password]) && @admin.update(admin_params)
      redirect_to admin_setting_path, notice: 'Admin was successfully updated.'
    else
      redirect_to admin_setting_path, notice: 'Admin updated unsucessfully.'
    end
  end

  private
    def admin_params
      params.require(:admin).permit(:old_password, :password, :password_confirmation)
    end
end
