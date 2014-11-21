class CreateCreativeWorks < ActiveRecord::Migration
  def change
    create_table :creative_works do |t|
      t.string :title, null: false
      t.string :permalink, null: false
      t.text :description
      t.datetime :published_at

      t.references :category

      t.timestamps null: false
    end

    add_index :creative_works, :permalink, unique: true
    add_index :creative_works, :published_at, unique: false
  end
end
