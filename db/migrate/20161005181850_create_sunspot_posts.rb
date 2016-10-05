class CreateSunspotPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :sunspot_posts do |t|
      t.string :title
      t.text :description
      t.belongs_to :sunspot_post_category
      t.belongs_to :user
      t.boolean :status, default: true
      t.string :slug
      t.boolean :featured, default: false
      t.timestamps
    end
  end
end
