class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :voteable_id
      t.string  :voteable_type
      t.references  :voter
      t.timestamps(null: false)
    end
  end
end
