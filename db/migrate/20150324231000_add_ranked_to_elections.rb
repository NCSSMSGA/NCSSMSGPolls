class AddRankedToElections < ActiveRecord::Migration
  def change
    add_column :elections, :ranked, :boolean, default: false
  end
end
