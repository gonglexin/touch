class Admin::SessionsController < Admin::ApplicationController
  layout 'login'

  skip_before_filter :require_admin

  def new
    if cookies[:remember_token]
      redirect_to admin_root_url
    end
  end

  def create
    admin = Admin.find_by_email(params[:email])
    if admin && admin.authenticate(params[:password])
      # TODO use SecureRandom instead of plain id
      cookies.permanent[:remember_token] = admin.id
      flash[:success] = "Logged in!"
      redirect_to admin_root_url
    else
      flash[:error] = "Invalid email/password combination"
      redirect_to admin_login_path
    end
  end

  def destroy
    cookies.delete(:remember_token)
    redirect_to admin_login_path, :notice => "Logged out!"
  end
end
