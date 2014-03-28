class AssignmentUploader

require 'csv'

  def initialize(file)
	CSV.parse(file.read, :headers => true) do |row|
     	 @student= Student.find_by_email(row["email"])
     	 Assignment.create(student_id: @stu.id,  name: row["name"], total: row["total"], score: row["score"]) 
  end
end
