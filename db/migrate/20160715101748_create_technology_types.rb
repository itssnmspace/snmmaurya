class CreateTechnologyTypes < ActiveRecord::Migration
  def change
    create_table :technology_types do |t|
	  t.string :title
    t.boolean :status, default: true
    t.integer :position
    t.timestamps null: false
    end
  end
end