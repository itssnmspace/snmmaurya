class CreateRubiests < ActiveRecord::Migration[5.0]
  def change
    create_table :rubiests do |t|
      t.text :title
      t.text :description
      t.boolean :status, default: true
      t.string :slug
      t.boolean :featured, default: false
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end