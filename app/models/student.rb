require 'digest'

class Student < ActiveRecord::Base
  has_many :attendances
  validates :name, presence: true, length: { minimum: 2 }
  #validates :email, presence: true
  #Schema: User(name:string, password_digest:string)
  validates :email, uniqueness:true
  has_secure_password
  validates_presence_of :password, :on => :create  
  def image_url_with_fallback
    if image.present?
      image
    elsif email
      "http://gravatar.com/avatar/"+Digest::MD5.hexdigest(email)+"?d=mm"
    end
  end
  def self.in_seat(seat, date)
    Student.joins(:attendances).where(attendances: {seat: seat, attended_on: date})
  end
  
  def self.absent(date)
    Student.joins(:attendances).where.not(attendances: {attended_on: date})
  end
  def self.present(date)
    joins(:attendances).where(attendances: {attended_on: date})
  end
    
  
end
