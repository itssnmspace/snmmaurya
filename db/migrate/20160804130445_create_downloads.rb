class CreateDownloads < ActiveRecord::Migration[5.0]
  def change
    create_table :downloads do |t|
      t.string :title
      t.string :download
      t.string :description
      t.string :category
      t.boolean :status, default: false
      t.timestamps
    end
  end
end