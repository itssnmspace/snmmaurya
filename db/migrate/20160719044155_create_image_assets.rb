class CreateImageAssets < ActiveRecord::Migration
  def change
    create_table :image_assets do |t|
      t.string :code
      t.string :title
      t.string :action
      t.string :target
      t.attachment :data
      t.boolean :status, default: true
      t.timestamps null: false
    end
  end
end