class Admin::ApplicationController < ApplicationController
  include SessionsHelper

  layout 'admin'
  before_filter :require_admin

  def require_admin
    unless signed_in?
      redirect_to admin_login_path, notice: "Please login in"
    end
  end

end
