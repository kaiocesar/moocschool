class CreateEnrollments < ActiveRecord::Migration[6.0]
  def change
    create_table :enrollments do |t|
      t.references :student, null: false, foreign_key: true
      t.references :classroom, null: false, foreign_key: true
      t.string :perio, limit: 2
      t.text :description
      t.boolean :status

      t.timestamps
    end
  end
end
