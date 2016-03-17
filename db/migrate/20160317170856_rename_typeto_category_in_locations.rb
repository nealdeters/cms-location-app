class RenameTypetoCategoryInLocations < ActiveRecord::Migration
  def change
    rename_column :locations, :type, :category
  end
end
