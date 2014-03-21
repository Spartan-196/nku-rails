class StudentsController < ApplicationController
 
  def new
      @student = Student.new
  end
   
  def create
    @student = Student.new(student_params) 
   
    if @student.save #Save input to new student
      session[:student_id] = @student.id	  #generate session ID
      redirect_to students_path, :notice => "You have registered." #route user back to students with a "sucessful" notification
    else
      flash[:notice] = "Invalid input please correct"
      render 'new' #Show form for them to correct invalid entrie
    end
   end
  
  def upload
    StudentUploader.new(params[:file])
    redirect_to students_path
  end
  
      
  def show
    @student = Student.find(params[:id])
    @current = get_current_student
  end
  
  def edit
     @student = Student.find(params[:id])
  end
  
  def update
    @student = Student.find(params[:id])
    if @student.update(student_params)
      flash[:success] = "Student updated"
       redirect_to students_path
    else
      render 'edit'
    end
  end
   
  def index
    @date = params[:date] || Date.today
    @student = Student.all 
  end
   
  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    flash[:notice]="Delete Successful"
    session[:student_id] = nil
    @current_user=nil
      redirect_to students_path
  end
    
  private
    def student_params
      params.require(:student).permit(:name, :nickname, :email, :password, :password_confirmation, :image)
    end
 end 

  
