class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :permalink, null: false
      t.text :body
      t.datetime :published_at

      t.references :category, null: false

      t.timestamps null: false
    end

    add_index :posts, :permalink, unique: true
    add_index :posts, :published_at, unique: false
  end
end
