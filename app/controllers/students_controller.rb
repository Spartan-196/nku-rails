class StudentsController < ApplicationController

require 'digest'
  
def new
    @student = Student.new
end
 
def create
  # render text: params[:student].inspect #Debug dump submitted text to screen to test submition without page generation.
  @student = Student.new(params[:student].permit(:name, :nickname, :email, :image)) 
 
  if @student.save #Validation check before save
     session[:user_id] = @student.id	 
    redirect_to students_path, :notice => "You have registered."#If it fails go back to student
  else
    render 'new' #if good make new student from submited fields
  end
 end

def show
  @current = current_user
  flash[:info] = @current.name
  @student = Student.find(params[:id])
 
  #email_address= @student.email.downcase

end

def edit
   @student = Student.find(params[:id])
end

def update
  @student = Student.find(params[:id])
   if @student.update(params[:student].permit(:name, :nickname, :email, :image))
    redirect_to students_path
    flash[:success] = "Student updated"
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

