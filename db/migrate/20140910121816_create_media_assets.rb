class CreateMediaAssets < ActiveRecord::Migration
  def change
    create_table :media_assets do |t|
      t.string :file, null: false

      t.timestamps null: false
    end
  end
end
