class CreateAssessments < ActiveRecord::Migration[6.0]
  def change
    create_table :assessments do |t|
      t.string :name
      t.integer :weight, default: 0
      t.references :grid, null: false, foreign_key: true

      t.timestamps
    end
  end
end
