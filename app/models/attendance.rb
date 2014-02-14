class Attendance < ActiveRecord::Base
  belongs_to :student
   validates :student_id, uniqueness: { scope: :attended_on, 
     message: "You may only attend one class session per day." }
  validates :seat, numericality: { only_integer: true,
    greater_than: 0, less_than: 20}
end
