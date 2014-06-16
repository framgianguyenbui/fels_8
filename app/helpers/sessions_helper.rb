module SessionsHelper
  def sign_in(user, remember = false)
    remember_token = User.new_remember_token
    if remember
      cookies.permanent[:remember_token] = {value: remember_token,
                                            expires: 2.weeks.from_now.utc}
    else
      cookies.permanent[:remember_token] = remember_token
    end
    user.no_password_validation = true
    user.update_attributes! remember_token: remember_token
    user.no_password_validation = false
    @current_user = user
  end

  def sign_out
    current_user = nil
    cookies.delete :remember_token
  end

  def current_user(user)
    self.current_user = user
  end

  def current_user
    @current_user||= User.find_by_remember_token cookies[:remember_token]
  end

  def current_user?(user)
    user == current_user
  end

  def admin?
    current_user.role == 1
  end

  def teacher?
    current_user.role == 2
  end

  def signed_in?
    !current_user.nil?
  end

  def store_location
    session[:return_to] = request.fullpath
  end

  def redirect_back_or(default)
    redirect_to session[:return_to]||default
  end

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_path, notice: 'Please sign in'
    end
  end

  def signed_in_admin
    if !signed_in? || (signed_in? && !current_user.admin_accessible?)
      store_location
      redirect_to admin_signin_path unless request.fullpath == admin_signin_path
    end
  end
end
