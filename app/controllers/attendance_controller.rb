class AttendanceContoller < ApplicationController
  
  def new
    @attendance = Attendance.new
  end
  
  def create
    @attendance= attendance.new(params[:attendance].permit(:attendance, :attended_on, :seat)) 
  end

  private 
  
  def attandance_parms
    params.require(:attendance).permit(:attendance, :attended_on, :seat)
  end
end