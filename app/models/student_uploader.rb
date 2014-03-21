class StudentUploader
  def intialize(file)
    @file = file
  end
  
  def import
    @file.read
  end
end
