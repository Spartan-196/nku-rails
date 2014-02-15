class AddSeatToAttendances < ActiveRecord::Migration
  def change
  add_column :attendances, :seat, :integer
  end
end
