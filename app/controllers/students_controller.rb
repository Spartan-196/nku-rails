class StudentsController < ApplicationController
########
  def new
  @student = Student.new
 end
########
 def create
  # render text: params[:student].inspect #Debug dump submitted text to screen to test submition without page generation.
  @student = Student.new(params[:student].permit(:name, :nickname, :email, :image)) 
 
  if @student.save #Validation check before save
    redirect_to @student#If it fails go back to student
  else
    render 'new' #if good make new student from submited fields
  end
 end
########
  def show
    @student = Student.find(params[:id])
  end
########   
  def edit
     @student = Student.find(params[:id])
  end
########
def update
  @student = Student.find(params[:id])
 
  if @student.update(params[:student].permit(:name, :nickname, :email, :image))
    redirect_to @student
  else
    render 'edit'
  end
end
#######
  def index
    @student = Student.all 
  end
########
  def destroy
  @student = Student.find(params[:id])
  @student.destroy
 
  redirect_to students_path
  end
########
  #http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show] #requires login to student, user id dhh password secret
########
  private
  def student_params
    params.require(:student).permit(:name, :nickname, :email, :image)
  end
########
end 

