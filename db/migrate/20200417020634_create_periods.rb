class CreatePeriods < ActiveRecord::Migration[6.0]
  def change
    create_table :periods do |t|
      t.time :start_period
      t.time :end_period
      t.string :type_period, limit: 15
      t.string :day_of_class, limit: 3

      t.timestamps
    end
  end
end
