class ChangeTableNameFromUsersToPlayers < ActiveRecord::Migration[5.0]
  def change
    rename_table :users, :players
  end
end
