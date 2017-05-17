class AddIsDiscardedToWhiteCardsTable < ActiveRecord::Migration[5.0]
  def change
    add_column :whitecards, :is_discarded, :boolean, default: false
  end
end
