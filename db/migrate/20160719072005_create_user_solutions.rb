class CreateUserSolutions < ActiveRecord::Migration
  def change
    create_table :user_solutions do |t|
      t.belongs_to :user, index: true
      t.belongs_to :solution, index: true
      t.timestamps
    end
  end
end