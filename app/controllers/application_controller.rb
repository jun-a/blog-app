class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :require_login!  #helper_methodとして定義するとclassの中でmoduleとして扱う

  private

  def current_user
     @current_user ||= User.find(session[:user_id]) if session[:user_id].present?
  end

  def require_login!
    if current_user.blank?
      redirect_to login_session_path
      return
    end
  end
end
