class AddPlayerIdToWhiteCard < ActiveRecord::Migration[5.0]
  def change
      add_column :whitecards, :player_id, :integer
  end
end
