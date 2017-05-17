class CreateBlackcards < ActiveRecord::Migration[5.0]
  def change
    create_table :blackcards do |t|
      t.string :question
      t.string :rating
      t.string :category
      t.integer :pick
      t.string :player_won

      t.timestamps
    end
  end
end
