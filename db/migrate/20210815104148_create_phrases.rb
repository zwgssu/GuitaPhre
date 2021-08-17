class CreatePhrases < ActiveRecord::Migration[6.1]
  def change
    create_table :phrases do |t|
      t.string :title, null: false
      t.string :body, null: false
      t.string :tag_1
      t.string :tag_2
      t.string :tag_3
      t.string :guitar
      t.boolean :user_only, null: false, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
