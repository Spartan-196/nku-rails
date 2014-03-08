class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
   before_action :require_login
  
  def current_student
    # Find whos logged in
    if( session[:student_id] == nil )
      return nil
    end
    return Student.find( session[:student_id] )
  end
  
  helper_method :current_student
 
  private
  def require_login
    if get_current_student == nil
      flash[:error] = "You must be logged in to access this section"
      redirect_to login_path # halts request cycle
    end
   end
  end
