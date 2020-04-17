class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :tritation
      t.string :amount_periods, limit: 2
      t.time :workload
      t.boolean :status

      t.timestamps
    end
  end
end
