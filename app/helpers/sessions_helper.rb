module SessionsHelper

  def sign_in(user)
    # TODO use SecureRandom instead of plain id
    cookies.permanent[:remember_token] = user.id
    @@current_user = user
  end

  def sign_out
    @@current_user = nil
    cookies.delete(:remember_token)
  end

  def signed_in?
    !!current_user if cookies[:remember_token]
  end

  def current_user
    @@current_user ||= user_from_remember_token
  end

  private

    def user_from_remember_token
      remember_token = cookies[:remember_token]
      Admin.find_by_id(remember_token) unless remember_token.nil?
    end

end
