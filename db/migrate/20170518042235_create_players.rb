class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.string :name
      t.string :password
      t.string :email
      t.string :img
      t.integer :high_score

      t.timestamps
    end
  end
end
