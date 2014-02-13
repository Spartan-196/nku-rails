class SessionsController < ApplicationController
  
def create
  student = Student.find_by_email(params[:email])
  if student && student.authenticate(params[:password])
    session[:student_id] = student.id #if user is authenticated set session id to user id
    redirect_to students_path(student.name), :notice => "Logged in!" #redirect to main student page with notice of successful login
  else
    flash[:error] = "Invalid email or password" #if auth. fails, vaguely specify that they failed the login 
    redirect_to sessions_path
  end
end

  def destroy
    session[:student_id] = nil #nullify currently set session ID 
    redirect_to students_path, :notice => "Logged out!" #redirect with notice
  end
end
