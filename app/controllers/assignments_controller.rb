class AssignmentsController < ApplicationController
   before_action :is_admin, only: [:new]
  def new
    if admin?
      @assignment = Assignment.new
    else
      redirect_to students_path
      flash[:error] = "Unauthorized"
    end
  end
  
  def upload
    AssignmentUploader.new(params[:file])
    redirect_to assignments_path
  end
    
  def create
    if admin?
      @assignment = Assignment.new(assignment_params)
      if @assignment.save
        redirect_to students_path, notice: "Assignment saved"
      else
        render :new
      end
    else
      redirect_to students_path
      flash[:error] = "Unauthorized"
    end
  end
  
  def show
    @assignments = Assignment.where("student_id = ?", params[:id])
  end
  
  def index
    if(params[:id] == nil)
      @assignments = Assignment.all
    else
      @assignments = Assignment.where("student_id = ?", params[:id])
    end      
  end
end
