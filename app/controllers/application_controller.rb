class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #skip_before_action :require_login [:new,:create]
  #before_filter :require_login
  private
  
  def current_student
    @current_student ||= Student.find(session[:student_id]) if session[:student_id]
  end

  helper_method :current_student
  
  def require_login
    redirect_to sessions_path unless current_student
  end
end
