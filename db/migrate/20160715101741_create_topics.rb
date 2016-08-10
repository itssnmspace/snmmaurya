class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
    	t.string :title
    	t.string :description
      t.integer :position
      t.boolean :status, default: true
      t.string :slug
      t.timestamps
    end
  end
end