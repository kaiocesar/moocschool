class AddStatusToSchool < ActiveRecord::Migration[6.0]
  def change
    add_column :schools, :status, :boolean
  end
end
