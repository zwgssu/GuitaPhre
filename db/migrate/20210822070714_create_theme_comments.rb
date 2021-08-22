class CreateThemeComments < ActiveRecord::Migration[6.1]
  def change
    create_table :theme_comments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :theme, null: false, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
