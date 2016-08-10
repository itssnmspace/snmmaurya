class CreateLessions < ActiveRecord::Migration[5.0]
  def change
    create_table :lessions do |t|
      t.text :title
      t.text :description
      t.boolean :status, default: true
      t.belongs_to :user, index: true
      t.belongs_to :study, index: true
      t.string :slug
      t.boolean :featured, default: false
      t.timestamps
    end
  end
end