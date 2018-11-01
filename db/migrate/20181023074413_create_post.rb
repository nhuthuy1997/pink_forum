class CreatePost < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :content
      t.integer :status
      t.references :topic, foreign_key: true, index: true

      t.timestamps
    end
  end
end
