class AttendancesController < ApplicationController
  before_filter :require_login

  def index
    #attempt to find who is in what seat
    now=Date.today
    @seat_1 = Student.in_seat(1, now)
    @seat_2 = Student.in_seat(2, now)
    @seat_3 = Student.in_seat(3, now)
    @seat_4 = Student.in_seat(4, now)
  end
  
  def new 
    @attendance = Attendance.new
  end
    
  
  def create
    @attendance= Attendance.new(attandances_parms) 
    if @attendance.save
      redirect_to attendances_path, notice: "Attendance Recorded"
    else 
      render 'new'
    end
  end

  private 
  
  def attandances_parms
    params[:attendance][:student_id] = current_student.id
    params[:attendance][:attended_on] = Date.today
    params.require(:attendance).permit(:student_id, :attended_on, :seat)
  end
end