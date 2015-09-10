class CreateBallots < ActiveRecord::Migration
  def change
    create_table :ballots do |t|
      t.references :user, index: true
      t.references :election, index: true

      t.timestamps
    end
  end
end
