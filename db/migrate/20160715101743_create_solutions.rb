class CreateSolutions< ActiveRecord::Migration
  def change
    create_table :solutions do |t|
    	t.string :title
    	t.text :description
      t.belongs_to :problem, index: true
      t.boolean :correct, default: true
      t.integer :position
      t.boolean :status, default: true
      t.string :slug
      t.timestamps
    end
  end
end