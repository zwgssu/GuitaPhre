class CreateThemes < ActiveRecord::Migration[6.1]
  def change
    create_table :themes do |t|
      t.string :title, null: false
      t.string :overview, null: false
      t.string :tag_1
      t.string :tag_2
      t.string :tag_3
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
