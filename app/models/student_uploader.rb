require 'csv'

class StudentUploader
  def initialize(file)
    @file = file
  end
  
  def import
    CSV.parse(@file.path :headers => true) do |row|
    
    end
  end
end
