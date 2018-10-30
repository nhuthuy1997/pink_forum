class DeviseForUsers < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.rename :password, :encrypted_password

      t.string :reset_password_token
      t.datetime :reset_password_sent_at

      t.datetime :remember_created_at

      t.index :email, unique: true
      t.index :reset_password_token, unique: true
    end

    change_column_null :users, :name, true
  end
end
