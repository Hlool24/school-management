class CreateSchools < ActiveRecord::Migration[8.0]
  def change
    create_table :schools do |t|
      t.string :name_ar, null: false
      t.string :name_en, null: false
      t.integer :status, null: false
      t.string :address

      t.timestamps
    end
    add_index :schools, :name_ar, unique: true
    add_index :schools, :name_en, unique: true
  end
end
