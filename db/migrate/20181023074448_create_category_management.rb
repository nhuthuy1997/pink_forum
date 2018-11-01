class CreateCategoryManagement < ActiveRecord::Migration[5.1]
  def change
    create_table :category_managements do |t|
      t.references :moderator, index: true, foreign_key: { to_table: :users }
      t.references :category, index: true, foreign_key: true

      t.timestamps
    end
  end
end
