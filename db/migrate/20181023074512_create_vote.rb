class CreateVote < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.integer :type_of_vote, null: false
      t.references :user, index: true, foreign_key: true
      t.integer :ownerable_id
      t.string :ownerable_type

      t.timestamps
    end
  end
end
