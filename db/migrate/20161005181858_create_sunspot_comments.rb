class CreateSunspotComments < ActiveRecord::Migration[5.0]
  def change
    create_table :sunspot_comments do |t|
      t.text :description
      t.belongs_to :sunspot_post
      t.belongs_to :user
      t.boolean :status, default: true
      t.string :slug
      t.boolean :featured, default: false
      t.timestamps
    end
  end
end
