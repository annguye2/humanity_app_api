class CreateScores < ActiveRecord::Migration[5.0]
  def change
    create_table :scores do |t|
      t.references :blackcard, foreign_key: true
      t.references :whitecard, foreign_key: true
      t.integer :score

      t.timestamps
    end
  end
end
