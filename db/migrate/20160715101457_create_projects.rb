class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :url
      t.string :about
      t.text :description
      t.datetime :started_at
      t.datetime :completed_at
      t.belongs_to :user
      t.belongs_to :employment
      t.boolean :status, default: true
      t.integer :position
      t.timestamps null: false
    end
  end
end