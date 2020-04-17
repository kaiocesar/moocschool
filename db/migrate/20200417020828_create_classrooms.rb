class CreateClassrooms < ActiveRecord::Migration[6.0]
  def change
    create_table :classrooms do |t|
      t.string :name
      t.datetime :start_year
      t.datetime :end_year
      t.string :period, limit: 2
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
