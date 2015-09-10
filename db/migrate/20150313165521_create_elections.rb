class CreateElections < ActiveRecord::Migration
  def change
    create_table :elections do |t|
      t.string :name
      t.integer :numcand
      t.datetime :start
      t.datetime :end
      t.string :years

      t.timestamps
    end
  end
end
