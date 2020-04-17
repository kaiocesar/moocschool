class CreateStudentAssessments < ActiveRecord::Migration[6.0]
  def change
    create_table :student_assessments do |t|
      t.references :assessment, null: false, foreign_key: true
      t.references :enrollment, null: false, foreign_key: true
      t.integer :weight
      t.boolean :status

      t.timestamps
    end
  end
end
