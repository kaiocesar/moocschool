class CreateSchools < ActiveRecord::Migration[6.0]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :cnpj

      t.timestamps
    end
    add_index :schools, :cnpj, unique: true
  end
end
