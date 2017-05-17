class CreateWhitecards < ActiveRecord::Migration[5.0]
  def change
    create_table :whitecards do |t|
      t.string :answer
      t.string :rating
      t.string :category
      t.string :player

      t.timestamps
    end
  end
end
