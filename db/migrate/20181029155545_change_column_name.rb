class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :votes, :voting_point, :status
  end
end
