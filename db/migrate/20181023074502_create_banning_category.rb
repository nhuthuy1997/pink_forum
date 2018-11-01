class CreateBanningCategory < ActiveRecord::Migration[5.1]
  def change
    create_table :banning_categories do |t|
      t.references :user, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true

      t.timestamps
    end
  end
end
