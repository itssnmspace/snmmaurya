class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :title
      t.text :description
      t.boolean :status, default: true
      t.belongs_to :blog, index: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end