class AddActiveToElections < ActiveRecord::Migration
  def change
    add_column :elections, :active, :boolean, default: false
  end
end
