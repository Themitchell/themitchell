class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.string :permalink, null: false

      t.timestamps null: false
    end

    add_index :categories, :permalink, unique: true
  end
end
