class AssignmentsController < ApplicationController
  
  def new
    if admin?
      @assignment = Assignment.new
    else
      redirect_to students_path
      flash[:error] = "Unauthorized"
    end
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
  
  def index
    render :show
  end