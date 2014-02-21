class AttendancesController < ApplicationController
  before_filter :require_login

  def index
    @date = params[:date] || Date.today
    #attempt to find who is in what seat
    #now=Date.today
    @seat_1 = Student.in_seat(1, @date)
    @seat_2 = Student.in_seat(2, @date)
    @seat_3 = Student.in_seat(3, @date)
    @seat_4 = Student.in_seat(4, @date)
  end
  
  def new 
    @attendance = Attendance.new
  end
  
  def create
    @attendance= Attendance.new(attandances_parms)
    @existing_attendance=Attendance.where(:attended_on => Date.today, :student_id => !nil)
    if (@existing_attendance== nil)
      @attendance.save
      redirect_to attendances_path, notice: "Attendance Recorded"
    else 
       flash[:error] = "You have already created an attendance for today."
      render 'new' 
    end
  end
  
  def self.in_seat(seat, date)
   Student.joins(:attendances).where(attendances: {seat: seat, attended_on: date})
  end

  def self.absent(date)
    Student.joins(:attendances).where.not(attendances: {attended_on: date})
  end

  private 
  
  def attandances_parms
    params[:attendance][:student_id] = current_student.id
    params[:attendance][:attended_on] = Date.today
    #params[:attendance][:date] = date
    params.require(:attendance).permit(:student_id, :attended_on, :seat)
  end
end