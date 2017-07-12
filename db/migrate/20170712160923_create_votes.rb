class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.string :votable_type
      t.integer :votable_id
      t.integer :value, default: 1
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
