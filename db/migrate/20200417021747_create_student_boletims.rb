class CreateStudentBoletims < ActiveRecord::Migration[6.0]
  def change
    create_table :student_boletims do |t|
      t.references :enrollment, null: false, foreign_key: true
      t.references :grid, null: false, foreign_key: true
      t.integer :total
      t.boolean :is_approved
      t.boolean :status

      t.timestamps
    end
  end
end
