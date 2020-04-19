class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :titration
      t.string :amount_periods_months, limit: 3
      t.string :workload
      t.boolean :status, default: 0

      t.timestamps
    end
  end
end
