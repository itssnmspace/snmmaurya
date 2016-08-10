class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.string :cource
      t.string :college
      t.string :location
      t.text :description
      t.belongs_to :user
      t.datetime :started_at
      t.datetime :completed_at
      t.boolean :status, default: true
      t.integer :position
      t.timestamps null: false
    end
  end
end