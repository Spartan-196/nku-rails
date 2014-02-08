class StudentsController < ApplicationController

require 'digest'
  
def new
    @student = Student.new
end
 
def create
  # render text: params[:student].inspect #Debug dump submitted text to screen to test submition without page generation.
  @student = Student.new(params[:student].permit(:name, :nickname, :email, :password, :password_confirm, :image)) 
 
  if @student.save #Save input to new student
     session[:user_id] = @student.id	  #generate session ID
    redirect_to students_path, :notice => "You have registered." #route user back to students with a "sucessful" notification
  else
    flash[:notice] = "Invalid input please correct"
    render 'new' #Show form for them to correct invalid entrie
  end
 end

def show
  @student = Student.find(params[:id])
  @scurrent = current_user
  flash[:info] = @current.name
 
  #email_address= @student.email.downcase

end

def edit
   @student = Student.find(params[:id])
end

def update
  @student = Student.find(params[:id])
   if @student.update(params[:student].permit(:name, :nickname, :email, :password, :password_confirm, :image))
    flash[:success] = "Student updated"
     redirect_to students_path
  else
    render 'edit'
  end
end
 
def index
  @student = Student.all 
end
 
def destroy
  @student = Student.find(params[:id])
  @student.destroy
  flash[:notice]="Delete Successful"
  session[:user_id] = nil
  @current_user=nil
    redirect_to students_path
end
  #http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show] #requires login to student, user id dhh password secret
  
private
  def student_params
    params.require(:student).permit(:name, :nickname, :email, :image)
  end
end 

