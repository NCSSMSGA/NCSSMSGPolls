class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :year, :integer, null: :false, default: 100
    add_column :users, :admin, :boolean, null: :false, default: false
  end
end
