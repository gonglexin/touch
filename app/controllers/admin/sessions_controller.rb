class Admin::SessionsController < Admin::ApplicationController
  layout 'login'

  skip_before_filter :require_admin

  def create
    admin = Admin.find_by_email(params[:email])
    if admin && admin.authenticate(params[:password])
      session[:admin_id] = admin.id
      redirect_to admin_root_url, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    reset_session
    redirect_to admin_log_in_path, :notice => "Logged out!"
  end
end
