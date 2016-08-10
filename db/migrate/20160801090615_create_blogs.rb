class CreateBlogs < ActiveRecord::Migration[5.0]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :description
      t.string :slug
      t.boolean :status, default: true
      t.boolean :featured, default: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end