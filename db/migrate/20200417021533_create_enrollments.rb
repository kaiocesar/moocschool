class CreateEnrollments < ActiveRecord::Migration[6.0]
  def change
    create_table :enrollments do |t|
      t.references :student, null: false, foreign_key: true
      t.references :classroom, null: false, foreign_key: true
      t.string :period, limit: 2
      t.text :description
      t.boolean :status, default: 0

      t.timestamps
    end
  end
end
