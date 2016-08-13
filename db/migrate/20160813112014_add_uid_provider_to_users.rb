class AddUidProviderToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :uid, :string unless column_exists? :users, :uid
    add_column :users, :provider, :string unless column_exists? :users, :provider
  end
end