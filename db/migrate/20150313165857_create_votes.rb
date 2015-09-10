class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :ballot, index: true
      t.references :candidate, index: true

      t.timestamps
    end
  end
end
