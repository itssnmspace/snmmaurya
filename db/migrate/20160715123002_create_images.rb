class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :imageable_id
      t.string :imageable_type
      t.attachment :data
      t.timestamps null: false
    end
    add_index :images, [:imageable_type, :imageable_id]
  end
end