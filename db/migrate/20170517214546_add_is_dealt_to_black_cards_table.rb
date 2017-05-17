class AddIsDealtToBlackCardsTable < ActiveRecord::Migration[5.0]
  def change
    add_column :blackcards, :is_dealt, :boolean, default: false
  end
end
