class StudentUploader
  
require 'csv'

  def initialize(file)
	  CSV.parse(file.read, :headers => true) do |row|
     	 Student.create(email: row["email"], name: row["name"], password: row ["password"], password_confirmation: ["password"], nickname: row["nickname"], image "", admin: false)
    end
  end
end
