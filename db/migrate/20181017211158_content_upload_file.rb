class ContentUploadFile < ActiveRecord::Migration[5.2]
  def change
    add_column :contents, :file_path, :string
  end
end
