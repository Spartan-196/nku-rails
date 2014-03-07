class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :total
      t.integer :score
      t.integer :student_id
      t.string  :name
    end
  end
end
