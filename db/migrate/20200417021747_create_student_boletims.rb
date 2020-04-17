class CreateStudentBoletims < ActiveRecord::Migration[6.0]
  def change
    create_table :student_boletims do |t|
      t.references :enrollment, null: false, foreign_key: true
      t.references :grid, null: false, foreign_key: true
      t.integer :total, default: 0
      t.boolean :is_approved, default: 0
      t.boolean :status, default: 0

      t.timestamps
    end
  end
end
