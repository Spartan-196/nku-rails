class AddAttendedOnToAttendances < ActiveRecord::Migration
  def change
    add_column :attendances, :attended_on, :date
  end
end
