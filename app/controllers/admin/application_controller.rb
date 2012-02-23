class Admin::ApplicationController < ActionController::Base
  layout 'admin'
  before_filter :require_admin

  def require_admin
    unless Admin.find_by_id(session[:admin_id])
      redirect_to admin_log_in_path
    end
  end
end
