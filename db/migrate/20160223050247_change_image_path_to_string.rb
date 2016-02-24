class ChangeImagePathToString < ActiveRecord::Migration
  def change
    change_column :images, :image_path, :string
  end
end
