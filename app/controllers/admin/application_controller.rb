class Admin::ApplicationController < ActionController::Base
  before_filter :require_admin
  layout "admin"

  def require_admin
    unless Admin.find_by_id(cookies[:remember_token])
      redirect_to admin_login_path
    end
  end
end
