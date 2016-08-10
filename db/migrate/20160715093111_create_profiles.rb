class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :contact
      t.string :email
      t.text :about
      t.string :address_line_one
      t.string :address_line_two
      t.string :address_line_three
      t.string :city
      t.string :state
      t.string :pin_code
      t.string :my_country
      t.belongs_to :user
      t.boolean :status, default: true
      t.integer :position
      t.timestamps null: false
    end
  end
end