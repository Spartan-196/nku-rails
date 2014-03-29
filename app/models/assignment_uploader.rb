class AssignmentUploader

require 'csv'

  def initialize(file)
	  CSV.parse(file.read, :headers => true) do |row|
     	if @student= Student.find_by_email(row["email"])
        Assignment.create(student_id: @student.id,  name: row["name"], total: row["total"], score: row["score"]) 
      end
    end
  end
end
