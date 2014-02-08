class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :nickname
      t.string :email
      t.text :image
      t.string :password_digest
      t.string :password_hash
      t.string :password_salt


      t.timestamps
    end
  end
end
