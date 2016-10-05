class CreateSunspotPostCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :sunspot_post_categories do |t|
      t.string :title
      t.boolean :status, default: true
      t.string :slug
      t.boolean :featured, default: false
      t.timestamps
    end
  end
end
