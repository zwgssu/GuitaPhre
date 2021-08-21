class CreateFavoriteUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :favorite_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :fav_user, null: false, foreign_key: { to_table: :users }

      t.index [:user_id, :fav_user_id], unique: true

      t.timestamps
    end
  end
end
