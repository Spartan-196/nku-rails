class Assignment < ActiveRecord::Base
  has_many :students
  validates score:, presence: true
  
  def 
    
  end
end