class AddWhiteCardIdToPlayers < ActiveRecord::Migration[5.0]
  def change
    add_column :players, :whitecard_id, :integer
  end
end
