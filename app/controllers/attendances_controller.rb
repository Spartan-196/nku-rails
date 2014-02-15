class AttendancesController < ApplicationController
  before_filter :require_login

  def new 
    @attendance = Attendance.new
  end
    
  
  def create
    @attendance= Attendance.new(params[:attendance].permit(:attendance, :attended_on, :seat)) 
    redirect_to attendances_path
  end

  private 
  
  def attandances_parms
    params.require(:attendance).permit(:attendance, :attended_on, :seat)
  end
end