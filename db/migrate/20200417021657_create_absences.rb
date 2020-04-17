class CreateAbsences < ActiveRecord::Migration[6.0]
  def change
    create_table :absences do |t|
      t.date :date_absence
      t.boolean :status, default: 0
      t.references :grid, null: false, foreign_key: true
      t.references :enrollment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
