class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.string :title, null: false
      t.string :director, null: false
      t.string :year, null: false
      t.string :category, null: false

      t.timestamps
    end
  end
end
