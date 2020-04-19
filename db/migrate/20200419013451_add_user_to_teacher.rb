class AddUserToTeacher < ActiveRecord::Migration[6.0]
  def change
    add_reference :teachers, :user, null: false, foreign_key: true
  end
end
