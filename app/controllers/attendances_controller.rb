class AttendancesController < ApplicationController
  
  def new
    
    @current_student = current_student
    
    if !@current_student
      redirect_to sessions_path(sessions)
    end
    
    @attendance = Attendance.new
  end
    
  
  def create
    @attendance= attendance.new(params[:attendance].permit(:attendance, :attended_on, :seat)) 
  end

  private 
  
  def attandances_parms
    params.require(:attendance).permit(:attendance, :attended_on, :seat)
  end
end