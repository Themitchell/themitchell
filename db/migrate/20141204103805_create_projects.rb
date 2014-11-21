class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.text :description
      t.date :from
      t.date :until

      t.timestamps null: false
    end
  end
end
