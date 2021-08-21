class CreateFavoritePhrases < ActiveRecord::Migration[6.1]
  def change
    create_table :favorite_phrases do |t|
      t.references :user, null: false, foreign_key: true
      t.references :phrase, null: false, foreign_key: true

      t.timestamps
    end
  end
end
