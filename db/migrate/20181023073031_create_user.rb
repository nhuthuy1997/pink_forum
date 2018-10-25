class CreateUser < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password, null: false
      t.date :birthday
      t.integer :sex
      t.integer :role

      t.timestamps
    end
  end
end
