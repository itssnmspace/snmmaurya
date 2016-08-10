class CreateUserProblems < ActiveRecord::Migration
  def change
    create_table :user_problems do |t|
      t.belongs_to :user, index: true
      t.belongs_to :problem, index: true
      t.timestamps
    end
  end
end