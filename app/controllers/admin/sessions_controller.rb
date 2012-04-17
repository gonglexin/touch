class Admin::SessionsController < Admin::ApplicationController
  layout 'login'

  skip_before_filter :require_admin

  def create
    admin = Admin.find_by_email(params[:email])
    if admin && admin.authenticate(params[:password])
      session[:admin_id] = admin.id
      flash[:success] = "Logged in!"
      redirect_to admin_root_url
    else
      flash[:error] = "Invalid email/password combination"
      redirect_to admin_log_in_path
    end
  end

  def destroy
    reset_session
    redirect_to admin_log_in_path, :notice => "Logged out!"
  end
end
