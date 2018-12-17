class UserContentCreated < ActiveRecord::Migration[5.2]
  def change
    create_table :user_contents do |t|
      t.references :content
      t.references :user

      t.boolean :favorite
      t.integer :rating

      t.timestamps
    end

    add_index :user_contents, %w[user_id content_id]
  end
end
