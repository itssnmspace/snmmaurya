class CreateEmployments < ActiveRecord::Migration
  def change
    create_table :employments do |t|
      t.string :name
      t.string :location
      t.string :description
      t.string :url
      t.string :started_at
      t.string :end_at
      t.belongs_to :user
      t.string :role, default: "Software Engineer"
      t.boolean :status, default: true
      t.integer :position
      t.timestamps null: false
    end
  end
end