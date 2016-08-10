class CreateTechnologies < ActiveRecord::Migration
  def change
    create_table :technologies do |t|
      t.string :name
      t.string :description
      t.float :experience
      t.string :experience_level
      t.belongs_to :technology_type
      t.belongs_to :user
      t.boolean :status, default: true
      t.integer :position
      t.timestamps null: false
    end
  end
end