class AttendancesController < ApplicationController
  before_filter :require_login
  
  def index
    @date = params[:date] || Date.today
    #attempt to find who is in what seat and who is not present.
    @seat_1 = Student.in_seat(1, @date)
    @seat_2 = Student.in_seat(2, @date)
    @seat_3 = Student.in_seat(3, @date)
    @seat_4 = Student.in_seat(4, @date)
    @absent_students= Student.absent(@date)
    
  end
  
  def new 
    @attendance = Attendance.new
  end
  
  def create
    @attendance= Attendance.new(attandances_parms)
    @attendance.seat = params[:attendance][:seat]
    @attendance.attended_on = Date.today
    @existing_attendance=Attendance.where(:attended_on => Date.today, :student_id => @current)
    if (@existing_attendance.first== nil)
      if @attendance.save
        redirect_to attendances_path, notice: "Attendance Recorded"
    else 
      render 'new' 
    end
    else
      flash[:notice] = "You have already created an attendance for today."
      redirect_to students_path
    end
  end
  
  
  def self.in_seat(seat, now=Date.today)
    present(now).where('attendances.seat = ?', seat)
    
    #Student.joins(:attendances).where(attendances: {seat: seat, attended_on: date})
  end

  def self.absent(now=Date.today)
    where.not(id: present(now))
    #Student.joins(:attendances).where.not(attendances: {attended_on: date})
  end

  def self.present(now=Date.today)
    joins(:attendances).where(attendances: {attended_now: now})
  end
  
  
  
  private 
  
  def attandances_parms
    params[:attendance][:student_id] = current_student.id
    params[:attendance][:attended_on] = Date.today
    params.require(:attendance).permit(:student_id, :attended_on, :seat)
  end
end