class CreateGrids < ActiveRecord::Migration[6.0]
  def change
    create_table :grids do |t|
      t.references :teacher, null: false, foreign_key: true
      t.references :discipline, null: false, foreign_key: true
      t.references :classroom, null: false, foreign_key: true
      t.references :period, null: false, foreign_key: true

      t.timestamps
    end
  end
end
