class Admin::SessionsController < Admin::ApplicationController
  layout 'login'

  skip_before_filter :require_admin

  def new
    redirect_to admin_root_url if signed_in?
  end

  def create
    admin = Admin.find_by_email(params[:email])
    if admin && admin.authenticate(params[:password])
      sign_in admin
      flash[:success] = "Logged in!"
      redirect_to admin_root_url
    else
      flash[:error] = "Invalid email/password combination"
      redirect_to admin_login_path
    end
  end

  def destroy
    sign_out
    redirect_to admin_login_path, :notice => "Logged out!"
  end
end
