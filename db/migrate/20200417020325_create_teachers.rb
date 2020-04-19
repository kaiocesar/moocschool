class CreateTeachers < ActiveRecord::Migration[6.0]
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :cpf, limit: 15
      t.boolean :status, defaut: 0
      t.references :user, null: false, foreign_key: true
      
      t.timestamps
    end
    add_index :teachers, :cpf, unique: true
  end
end
