class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string :name
      t.string :cpf, limit: 15
      t.boolean :status, default: 0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :students, :cpf, unique: true
  end
end
