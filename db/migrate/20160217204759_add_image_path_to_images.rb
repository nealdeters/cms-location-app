class AddImagePathToImages < ActiveRecord::Migration
  def change
    add_column :images, :image_path, :text
  end
end
